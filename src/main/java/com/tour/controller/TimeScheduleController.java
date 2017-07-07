package com.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.Detail_ScheduleDAO;
import com.tour.dao.Detail_ScheduleMapper;
import com.tour.dao.TimeScheduleDAO;
import com.tour.dao.TimeScheduleExcel;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.ScheduleDayVO;

@Controller
public class TimeScheduleController {

	@Autowired
	TimeScheduleDAO  dao;
	@Autowired
	Detail_ScheduleDAO detail_dao;
	@Autowired
	TimeScheduleExcel   tsExcel;
	
	@RequestMapping("/time_schedule")
	public String time_schedule(int tour_id, Model model){
		//System.out.println("TimeScheduleController");
		//tour_id=44;
		List<ScheduleDayVO> list= dao.tourDateList(tour_id);
		List<DetailScheduleVO> list2 = detail_dao.detailMyPage(tour_id);
		//System.out.println("list.size="+list.size());
		model.addAttribute("list", list);
		model.addAttribute("list2", list2);
		model.addAttribute("my_page_gubun","../time_schedule/time_schedule.jsp");
		return "detail_mypage/detail_content";
	}
	
	@RequestMapping(value="/time_schedule_excel",produces="text/plain;charset=UTF-8")
	public @ResponseBody String time_schedule_exce(int tour_id, Model model){
		String excelFileName=tsExcel.createExcel(tour_id);
		model.addAttribute("excel_file", excelFileName);
		
		return excelFileName;
	}
	
}
