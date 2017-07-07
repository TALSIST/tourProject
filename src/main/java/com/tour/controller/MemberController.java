package com.tour.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.MemberDAO;
import com.tour.persistence.MemberVO;

@Controller
public class MemberController {

   @Autowired
   private MemberDAO dao;
   
   @RequestMapping("/signup") //회원가입->이메일, 아이디 중복체크 후->멤버 테이블 등록
   public String member_signup(String id, String password,String name, String email, Model model, HttpSession session){
      System.out.println("sing up");
      
      Map map = new HashMap();
      map.put("id", id);
      map.put("password", password);
      map.put("name", name);
      map.put("email", email);
      
      dao.memberInsert(map);
      MemberVO vo = dao.memberInfoData(email);
      int member_id = vo.getMember_id();
      session.setAttribute("member_id", member_id);
      session.setAttribute("id", id);
      session.setAttribute("email", email);
      return "main/login";
      
   }
   
   @RequestMapping("/signin")
   public @ResponseBody String member_signin(String email, String password, HttpSession session){
      
      MemberVO vo  = dao.memberInfoData(email);
      String pwd = vo.getPassword();
      String id = vo.getId();
      int member_id = vo.getMember_id();
      System.out.println(member_id +  "     dddddddddddd");
      if(pwd.equals(password)) {
         session.setAttribute("id", id);
         session.setAttribute("email", email);
         session.setAttribute("member_id", member_id);
         return "OK";
      }
      return "NO";
   }
   
   
   @RequestMapping("/logout")
   public String member_logout(HttpSession session)
   {
	   //session.removeAttribute("id");
      
	   session.invalidate();
      
      return "redirect:main1";
   }

   
      @RequestMapping("/emailcheck")
      public String member_emailcheck(String email,Model model)
      {
         int count=dao.memberEmailcheck(email);
         model.addAttribute("count", count);
         model.addAttribute("email", email);
         return "main/emailcheck";
      }
      
   
}