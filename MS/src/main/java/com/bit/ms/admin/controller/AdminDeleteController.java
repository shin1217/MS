package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.service.AdminDeleteService;

@Controller
public class AdminDeleteController {

	@Autowired
	private AdminDeleteService service;
	
	@RequestMapping("/admin/adminDelete")
	public String delete(AdminVO adminVo) {
		
		String admin_id = adminVo.getAdmin_id();
		service.deleteAdmin(admin_id);
		
		return "admin/adminMypage";
	}
}
