package com.bit.ms.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductManagementController {
	
	
	@RequestMapping("/admin/productManagement")
	public String adminProductManagement() {
		
		return "admin/adminProductManagement";
	}
}
