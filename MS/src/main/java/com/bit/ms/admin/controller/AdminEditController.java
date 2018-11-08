package com.bit.ms.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.service.AdminEditService;

@Controller
public class AdminEditController {
	
	@Autowired
	private AdminEditService service;
	
	@RequestMapping(value = "/admin/adminEdit", method = RequestMethod.POST)
	public String adminEdit(AdminVO adminVo) {
		
		service.editAdmin(adminVo);
		
		return "admin/adminMypage";
	}

}
