package com.bit.ms.admin.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.admin.service.AdminUserListService;

@Controller
public class AdminStoreChoiceController {

	@Autowired
	AdminUserListService adminUserListService;
	
	@RequestMapping(value = "/admin/storeChoice", method = RequestMethod.GET)
	public String storeChoiceForm(@Param("id") String id, Model model) {

		List<StoreVO> result = adminUserListService.getStoreName(id);
		
		model.addAttribute("store", result);
		
		return "admin/adminStoreChoice";
	}
}
