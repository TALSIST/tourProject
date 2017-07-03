package com.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.TimeScheduleDAO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.ScheduleDayVO;

@Controller
public class TimeScheduleController {

	@Autowired
	TimeScheduleDAO  dao;
	
	@RequestMapping("/time_schedule")
	public String time_schedule(int tour_id, Model model){
		//System.out.println("TimeScheduleController");
		//tour_id=44;
		List<ScheduleDayVO> list= dao.tourDateList(tour_id);
		//System.out.println("list.size="+list.size());
		model.addAttribute("list", list);
		model.addAttribute("my_page_gubun","../time_schedule/time_schedule.jsp");
		return "detail_mypage/detail_content";
	}
}
