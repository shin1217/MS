package com.bit.ms.kakao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.ms.user.model.UserVO;
import com.bit.ms.user.service.UserLoginService;

@Controller
public class KakaoLoginController {

	@Autowired
	KakaoLoginCheckService kakaoService;

	@Autowired
	UserLoginService userService;

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session,
			HttpServletResponse response) throws IOException {
		// 결과값 초기화
		int result = 0;

		System.out.println("code : " + code);

		// JsonNode트리형태로 토큰받아온다
		JsonNode jsonToken = KakaoAccessToken.getAccessToken(code);
		// 여러 json객체 중 access_token을 가져온다
		JsonNode accessToken = jsonToken.get("access_token");

		System.out.println("access_token : " + accessToken);

		// access_token을 통해 사용자 정보 요청
		JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);

		// Get id
		String id = userInfo.path("id").asText();
		String nickname = null;
		String email = null;

		result = kakaoService.getKakaoLogin(id);

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");

		if (properties.isMissingNode()) {
			// if "name" node is missing
		} else {
			nickname = properties.path("nickname").asText();
			email = kakao_account.path("email").asText();

			System.out.println("id : " + id);
			System.out.println("nickname : " + nickname);
			System.out.println("email : " + email);

			// DB에 저장할 카카오 아이디 세션에 저장
			session.setAttribute("kakao_id", id);

			ra.addAttribute("nickname", nickname);
			ra.addAttribute("email", email);

			// 카카오 로그인 정보가 존재 할 경우
			if (result == 1) {
				UserVO vo = kakaoService.kakaoLoginPass(id, session);

				// 이메일 인증이 되어있는지 확인
				if (!vo.getUser_key().equals("Y")) { // 인증 안하면 로그인페이지로 돌아가서 메시지출력
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('이메일 인증바랍니다.');");
					out.println("location.href='/'");
					out.println("</script>");
					out.flush();

					return null;

				} else { // 인증이 되어있으면
					return "redirect:/user/main";
				}
			}
		}
		return "redirect:/user/reg";
	}
}
