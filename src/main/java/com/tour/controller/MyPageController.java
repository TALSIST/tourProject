package com.tour.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.Detail_ScheduleDAO;
import com.tour.persistence.tourVO;

@Controller
public class MyPageController {
	@Autowired
	private Detail_ScheduleDAO dao;
	
	//���������� ����
	@RequestMapping("/mypage") 
	public String mypage_page(HttpSession session,Model model){
		List<tourVO> list= dao.tourList(1);
		System.out.println(list.get(0).getTourId());
		model.addAttribute("list",list);
		return "mypage/mypage";
	}
	//�������������� ���� ���� ����
	@RequestMapping("/detail_content")
	public String detail_content(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		return "mypage/mypage";
	}
	@RequestMapping("/gaeyo2")
	public String gaeyo(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","gaeyo2.jsp");
		return "mypage/mypage";
	}
	
	
}
