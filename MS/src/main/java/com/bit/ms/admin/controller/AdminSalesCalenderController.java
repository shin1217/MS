package com.bit.ms.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bit.ms.admin.model.SalesVO;
import com.bit.ms.admin.service.AdminSalesCalenderService;

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
	
}
