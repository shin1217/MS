package com.bit.ms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminCEOBoardController {

	@RequestMapping(value = "/admin/CEOBoard", method = RequestMethod.GET)
	public String adminCEOBoard() {
		
		
		
		return "admin/adminCEOBoard";
	}
}
