package com.bit.ms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.service.AdminMypageService;

@Controller
public class AdminMypageController {
	
	@Autowired
	private AdminMypageService service;
	
	@RequestMapping("/admin/adminMypage")
	public String adminMypage(HttpSession session, Model model) {
		
		/*AdminVO adminVo = (AdminVO) session.getAttribute("adminVO");
		
		String admin_id = adminVo.getAdmin_id();*/
		
		//매장이 다르나 아이디는 같은 관리자가 있으므로
		//리스트로 받아서 0번째를 불러옴
		model.addAttribute("admin",service.getAdmin("1").get(0));
		model.addAttribute("store",service.getStore("1"));
		
		return "admin/adminMypage";
	}

}
