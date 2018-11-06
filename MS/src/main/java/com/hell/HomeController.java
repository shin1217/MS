package com.hell;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	// 앱 실행 시 첫 페이지 이동
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/home";
	}
	
}
