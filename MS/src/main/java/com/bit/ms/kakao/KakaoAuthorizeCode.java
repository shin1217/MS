package com.bit.ms.kakao;

import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class KakaoAuthorizeCode {

	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code) {

		System.out.println("code : " + code);

		//JsonNode 트리형태로 토큰을 받는다
		JsonNode jsonToken = KakaoGetToken.getAccessToken(code);
		JsonNode token = jsonToken.get("access_token");
		
		System.out.println("access_token : " + token);
		
		return "redirect:/user/reg";
	}
}
