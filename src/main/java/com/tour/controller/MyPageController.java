package com.tour.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tour.dao.Detail_ScheduleDAO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.TourVO;
import com.tour.util.Util;

@Controller
public class MyPageController {
	@Autowired
	private Detail_ScheduleDAO dao;
	private Util util = new Util();
	//마이페이지 들어갈때
	@RequestMapping("/mypage") 
	public String mypage_page(HttpSession session,Model model){
		List<TourVO> list= dao.tourList(1);
		System.out.println(list.get(0).getTour_id());
		model.addAttribute("list",list);
		return "mypage/mypage";
	}
	//마이페이지에서 세부 일정 볼때
	@RequestMapping("/detail_content")
	public String detail_content(@ModelAttribute("tour_id") int tour_id,Model model){
		List<DetailScheduleVO> list = dao.detailMyPage(tour_id);
		list = util.getDay(list);
		model.addAttribute("list",list);
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		return "mypage/mypage";
	}
	@RequestMapping("/gaeyo2")
	public String gaeyo(int tour_id,Model model){
		List<DetailScheduleVO> list = dao.detailMyPage(tour_id);
		list = util.getDay(list);
		model.addAttribute("list",list);
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","gaeyo2.jsp");
		return "mypage/mypage";
	}

	@RequestMapping("/map")
	public String map(Model model){
		model.addAttribute("jsp_page","detail_mypage/detail_content");
		model.addAttribute("my_page_gubun","map.jsp");
		return "mypage/mypage";
	}
	
}
