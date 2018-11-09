package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.model.AdminVO;
import com.bit.ms.admin.model.StoreVO;
import com.bit.ms.admin.service.AdminStoreService;

@Controller
public class AdminStoreController {

	@Autowired
	private AdminStoreService service;
	
	@RequestMapping(value = "/admin/adminStoreAdd", method = RequestMethod.GET)
	public @ResponseBody List<StoreVO> getStoreList(){
		// 스토어리스트를 받아옴
		return service.storeListGet();
		
	}
	
	@RequestMapping(value = "/admin/adminStoreAdd", method = RequestMethod.POST)
	public String addStore(AdminVO adminVo) {
		System.out.println("매장등록시 정보 : " + adminVo);
		//선택된 매장아이디를 포함해 새로 회원가입
		service.storeAdd(adminVo);
		
		return "admin/adminMypage";
	}
	
	@RequestMapping(value = "/admin/adminStoreDelete", method = RequestMethod.POST)
	public String deleteStore(AdminVO adminVo) {
		System.out.println("삭제 : " + adminVo);
		service.storeDelete(adminVo);
		return "admin/adminMypage";
	}
	
}
