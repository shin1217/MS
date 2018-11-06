package com.bit.ms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/reg")
public class AdminRegController {

	@RequestMapping(method = RequestMethod.GET)
	public String adminReg() {

		return "admin/adminReg";
	}
}
