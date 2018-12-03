package com.bit.ms.kakao;

import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class KakaoAuthorizeCode {

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam("code") String code) {

		ModelAndView mv = new ModelAndView();
		
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
		String message = null;

		// 유저정보 카톡에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");

		if (properties.isMissingNode()) {
			// if "name" node is missing
		} else {
			nickname = properties.path("nickname").asText();
			thumbnailImage = properties.path("thumbnail_image").asText();
			profileImage = properties.path("profile_image").asText();
			
			System.out.println("nickname : " + nickname);
			System.out.println("thumbnailImage : " + thumbnailImage);
			System.out.println("profileImage : " + profileImage);
			
			mv.addObject("nickname", nickname);
			mv.setViewName("user/userReg");
		}

		return mv;
	}
}
