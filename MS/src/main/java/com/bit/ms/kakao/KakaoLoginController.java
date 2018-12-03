package com.bit.ms.kakao;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class KakaoLoginController {

	@Autowired
	KakaoLoginCheckService kakaoLoginCheckService;

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session) {

		int result = 0;

		System.out.println("code : " + code);

		// JsonNode 트리형태로 토큰을 받는다
		JsonNode jsonToken = KakaoAccessToken.getAccessToken(code);
		JsonNode accessToken = jsonToken.get("access_token");

		System.out.println("access_token : " + accessToken);

		// 사용자 정보 요청
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);

		// Get id
		String id = userInfo.path("id").asText();
		String nickname = null;
		String thumbnailImage = null;
		String profileImage = null;
		String email = null;

		result = kakaoLoginCheckService.getKakaoLogin(id);

		System.out.println("카카오 회원가입 확인 : " + result);

		// 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		if (properties.isMissingNode()) {
			// if "name" node is missing
		} else {
			nickname = properties.path("nickname").asText();
			thumbnailImage = properties.path("thumbnail_image").asText();
			profileImage = properties.path("profile_image").asText();
			email = kakao_account.path("email").asText();

			System.out.println("id : " + id);
			System.out.println("nickname : " + nickname);
			System.out.println("thumbnailImage : " + thumbnailImage);
			System.out.println("profileImage : " + profileImage);
			System.out.println("email : " + email);

			session.setAttribute("kakao_id", id);
			
			ra.addAttribute("nickname", nickname);
			ra.addAttribute("email", email);

			// 카카오 로그인 정보가 존재 할 경우
			if (result == 1) {

				System.out.println("카카오 이미 있음");

				return "redirect:/";
			}
		}
		return "redirect:/user/reg";
	}
}
