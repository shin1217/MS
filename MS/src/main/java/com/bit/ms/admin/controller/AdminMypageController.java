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
import com.bit.ms.admin.service.AdminMypageService;
import com.bit.ms.member.model.StoreVO;

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
		model.addAttribute("admin",service.getAdmin(admin_id));
		model.addAttribute("store",service.getStore(admin_id));
		
		return "admin/adminMypage";
	}
	
	@RequestMapping(value = "/admin/adminMypage/{store_id}", method = RequestMethod.GET)
	public @ResponseBody StoreVO store(@PathVariable("store_id") int store_id) {
		
		StoreVO store = service.getStoreDetail(store_id);
		
		return store;
	}
	//관리자 삭제
	@RequestMapping("/admin/adminDelete")
	public String delete(AdminVO adminVo) {
		
		String admin_id = adminVo.getAdmin_id();
		service.deleteAdmin(admin_id);
		
		return "admin/adminMypage";
	}
	//관리자 수정
	@RequestMapping(value = "/admin/adminEdit", method = RequestMethod.POST)
	public String adminEdit(AdminVO adminVo) {
		
		service.editAdmin(adminVo);
		
		return "admin/adminMypage";
	}
	/*//관리자 매장 추가
	@RequestMapping(value = "/admin/adminStoreAdd", method = RequestMethod.GET)
	public @ResponseBody List<StoreVO> getStoreList(){
		
		// 스토어리스트를 받아옴
		return service.storeListGet();
	}*/
	//관리자 매장 추가
	@RequestMapping(value = "/admin/adminStoreAdd", method = RequestMethod.POST)
	public String addStore(StoreVO storeVO) {
		
		System.out.println("매장등록시 정보 : " + storeVO);
		//선택된 매장아이디를 포함해 새로 회원가입
		service.storeAdd(storeVO);
		
		return "admin/adminMypage";
	}
	//관리자 매장 삭제
	@RequestMapping(value = "/admin/adminStoreDelete", method = RequestMethod.POST)
	public String deleteStore(AdminVO adminVo) {
		//System.out.println("삭제 : " + adminVo);
		int store_id = adminVo.getStore_id();
		service.storeDelete(store_id);
		
		return "admin/adminMypage";
	}
}
