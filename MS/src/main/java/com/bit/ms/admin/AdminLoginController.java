package com.bit.ms.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin")
public class AdminLoginController {
	
	@RequestMapping(method = RequestMethod.GET)
	public String admin() {
		
		return "admin/adminLogin";
	}
}