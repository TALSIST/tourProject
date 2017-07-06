package com.tour.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.MemberDAO;

@Controller
public class MemberController {

   @Autowired
   private MemberDAO dao;
   
   @RequestMapping("/signup22222")
   public String member_signup(String name, String email,String password, Model model, HttpSession session){
      String id= email.substring(0,email.lastIndexOf("@"));   //id를 어떻게 설정할것인지, 유효성검사도!
      
      Map map = new HashMap();
      map.put("name", name);
      map.put("email", email);
      map.put("password", password);
      dao.memberInsert(map);
      session.setAttribute("id", name);
      //model.addAttribute("vo", vo);
      return "main/login";
      
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