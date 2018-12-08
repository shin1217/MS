package com.bit.ms.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberChatController {
	@RequestMapping("/member/chat")
	public String chat() {

		return "member/chat";
	}
}
