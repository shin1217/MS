package com.hell.user.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hell.member.dao.UserDaoInterface;
import com.hell.member.model.UserVO;

@Service
public class UserLoginService {

   @Autowired
   private SqlSessionTemplate sqlSessionTemplate;
   private UserDaoInterface userDao;

   public boolean userLogin(String userId, String userPw, HttpSession session, String check, HttpServletResponse response) {

      boolean result = false;

      userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
      UserVO vo = userDao.loginUser(userId);
      
      
      // 1. vo가 비어있지 않다면 Id & Pw가 일치하는지 확인해야한다.
      if(vo != null && vo.getUserId().equals(userId) && vo.getUserPw().equals(userPw)) {
         if(check != null) {
        	 Cookie cookie = new Cookie("check", userId);
        	 response.addCookie(cookie);
        	 
        	 // 쿠키 잘 만들어졌나~?
        	 System.out.println(cookie);
         } else {
        	 Cookie cookie = new Cookie("check", "");
        	 cookie.setMaxAge(0);
        	 response.addCookie(cookie);
		}
         // session에 Pw가 노출되지 않도록 빈 값으로 초기화
         vo.setUserPw("");
         
         // 세션에 vo 객체 저장한다.
         session.setAttribute("userVO", vo);
         
         System.out.println(session.getAttribute("userVO"));//로그인 확인
         System.out.println("그냥 객체"+vo);//로그인 확인
         
         result = true;
      }

      return result;
   }
}