package com.tour.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.Detail_ScheduleDAO;
import com.tour.persistence.TourVO;

@Controller
public class MyPageController {
	@Autowired
	private Detail_ScheduleDAO dao;
	
	//���������� ����
	@RequestMapping("/mypage") 
	public String mypage_page(HttpSession session,Model model){
		List<TourVO> list= dao.tourList(1);
		System.out.println(list.get(0).getTour_id());
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
	@RequestMapping("/story")
	public String story(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","story.jsp");
		return "mypage/mypage";
	}
	@RequestMapping("/memo")
	public String memo(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","memo.jsp");
		return "mypage/mypage";
	}
	@RequestMapping("/map")
	public String map(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","map.jsp");
		return "mypage/mypage";
	}
	
}
