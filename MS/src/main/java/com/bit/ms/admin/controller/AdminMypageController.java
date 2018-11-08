package com.bit.ms.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.admin.service.AdminMypageService;

@Controller
public class AdminMypageController {
	
	@Autowired
	private AdminMypageService service;
	
	@RequestMapping("/admin/adminMypage")
	public String adminMypage(HttpSession session, Model model) {
		
		AdminVO adminVo = (AdminVO) session.getAttribute("adminSession");
		
		String admin_id = adminVo.getAdmin_id();
		
		//매장이 다르나 아이디는 같은 관리자가 있으므로
		//리스트로 받아서 0번째를 불러옴
		model.addAttribute("admin",service.getAdmin(admin_id).get(0));
		model.addAttribute("store",service.getStore(admin_id));
		
		return "admin/adminMypage";
	}
	
	@RequestMapping(value = "/admin/adminMypage/{store_name}", method = RequestMethod.GET)
	public @ResponseBody StoreVO store(@PathVariable("store_name") String store_name) {
		
		StoreVO store = service.getStoreDetail(store_name);
		
		System.out.println(service.getStore(store_name));
		
		return store;
		
	}

}
