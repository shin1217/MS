package com.bit.ms.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.ms.admin.service.AdminProductService;
import com.bit.ms.member.model.FoodVO;

@Controller
public class AdminOrdersController {
	
	@Autowired
	AdminProductService service;
	
	@RequestMapping(value="/admin/adminOrders")
	public String adminOrders() {
		
		return "admin/adminOrders";
	}
	
	@RequestMapping(value="/admin/insertFood", method=RequestMethod.POST)
	public String insertFood(FoodVO foodVO,
							HttpServletRequest request) throws IllegalStateException, IOException {
		
		String uploadURI = request.getContextPath()+"/images/"+foodVO.getFood_type();
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		System.out.println(dir);
	
		int resultCnt = service.insertFood(foodVO); // 이미지를 제외한 음식 정보 저장
		
		if(resultCnt == 1) {
			// 업로드 파일의 물리적 저장
			if (!foodVO.getReport().isEmpty()) {
				String imgName = foodVO.getFood_id()+"_"+foodVO.getFood_type()+"_"+foodVO.getReport().getOriginalFilename(); // 이미지 이름
				
				foodVO.getReport().transferTo(new File(dir, imgName)); // dir 폴더에 파일 저장
				foodVO.setFood_photo(imgName); // 데이터베이스에 저장할 파일 이름 지정
			}
			service.updateImg(foodVO.getFood_photo(), foodVO.getFood_id(), foodVO.getStore_id()); // 이전에 저장된 음식 정보에 이미지 저장
			System.out.println("음식 추가 성공");
		}
		return "redirect:/admin/adminOrders"; // 뷰 페이지만이 아닌 URL까지 변경해줘야 함
	}
	
	@RequestMapping("/admin/updateFood")
	@ResponseBody
	public void updateFood(@RequestParam("foodId") int foodId,
							@RequestParam("storeId") int storeId,
							FoodVO foodVO) {
		
		foodVO.setFood_id(foodId);
		foodVO.setStore_id(storeId);
		int resultCnt = service.updateFood(foodVO);
		
		if(resultCnt == 1) {
			System.out.println("음식 정보 업데이트 성공");
		}
	}

	@RequestMapping("/admin/deleteFood")
	@ResponseBody
	public void deleteProduct(@RequestParam("foodId") int foodId,
								@RequestParam("storeId") int storeId,
								@RequestParam("fileName") String fileName,
								HttpServletRequest request) {
		
		String[] getType = fileName.split("_"); // 파일 이름에서 타입만 가져오기
		String uploadURI = request.getContextPath()+"/images/"+getType[1];
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);
		
		int resultCnt = service.deleteFood(foodId, storeId);
		
		if(resultCnt == 1) {
			new File(dir, fileName).delete(); // 실제 폴더에 데이터 삭제
			System.out.println("음식 삭제 성공");
		}
	}
	
	@RequestMapping("/admin/getFoodInfoAll")
	@ResponseBody
	public List<FoodVO> getFoodInfoAll(@RequestParam("storeId") int storeId){
		return service.getFoodInfoAll(storeId);
	}
	
}
