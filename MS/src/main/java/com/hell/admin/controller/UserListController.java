package com.hell.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hell.admin.service.UserListService;

@Controller
public class UserListController {

	@Autowired
	UserListService listService;
	
	// admin 메인페이지에서 회원정보 클릭 
	@RequestMapping("/admin/userList")
	public String getUserList(Model model) {
		
		model.addAttribute("userlist", listService.getUserList());
		
		
		return "admin/userList";
	}
}
