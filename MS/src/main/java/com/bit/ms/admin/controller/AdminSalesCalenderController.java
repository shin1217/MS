package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.SalesVO;
import com.bit.ms.admin.service.AdminSalesCalenderService;
import com.bit.ms.member.model.ReplyVO;

@Controller
public class AdminSalesCalenderController {

	@Autowired
	private AdminSalesCalenderService salesService;
	
	@RequestMapping("admin/salesCalender")
	public ModelAndView adminSales() {
		
		ModelAndView modelAndView = new ModelAndView();
		
		List<SalesVO> list = salesService.salesList();
		
		modelAndView.addObject("salesList", list);
		modelAndView.setViewName("admin/adminSalesCalender");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "admin/salesInfo/{indexId}", method = RequestMethod.GET)
	public @ResponseBody List<SalesVO> salesViewList(@PathVariable("indexId") int day) {
		
		List<SalesVO> viewList = salesService.salesViewList(day);
		
		return viewList;
	}
	
}
