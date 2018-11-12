package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminUserListService;
import com.bit.ms.user.model.UserVO;

@Controller
@RequestMapping("/admin/userList")
public class AdminUserListController {

	@Autowired
	AdminUserListService listService;

	// admin메인페이지에서 회원목록 클릭시
	@RequestMapping(value = "", method = RequestMethod.GET)
	
	public String getUserList(Model model) {

		model.addAttribute("userlist", listService.getUserList());

		return "admin/adminUserList";
	}
	
	// 회원목록에서 각 열을 클릭시 정렬
	@RequestMapping(value = "/sort", method = RequestMethod.GET)
	@ResponseBody
	public List<UserVO> sortingUserList(String sortName, String orderBy) {
		
		List<UserVO> result = listService.sortingUserList(sortName, orderBy);
		
		return result;
	}
}
