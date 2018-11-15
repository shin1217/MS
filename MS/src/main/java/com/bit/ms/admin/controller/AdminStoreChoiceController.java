package com.bit.ms.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.admin.service.AdminUserListService;
import com.bit.ms.member.model.StoreVO;

@Controller
public class AdminStoreChoiceController {

	@Autowired
	AdminUserListService adminUserListService;
	
	@RequestMapping(value = "/admin/storeChoice", method = RequestMethod.GET)
	public String storeChoiceForm(@Param("id") String id, Model model, HttpSession session) {

		List<StoreVO> result = adminUserListService.getStoreName(id, session);
			
		model.addAttribute("store", result);
		
		return "admin/adminStoreChoice";
	}
	
	@RequestMapping(value = "/admin/storeReg", method = RequestMethod.GET)
	public String storeRegForm() {

		return "admin/adminStoreReg";
	}
}
