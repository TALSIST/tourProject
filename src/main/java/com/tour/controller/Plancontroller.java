package com.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.PlanDAO;
import com.tour.persistence.CityVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SubCategoryVO;
import com.tour.persistence.TopCategoryVO;

@Controller
public class Plancontroller {
	@Autowired
	private PlanDAO dao;
	
	
	@RequestMapping("/dayselect2")
	public String dayselect(Model model){
		List<TopCategoryVO> topList = dao.setTopCategory();
		model.addAttribute("topList", topList);
		return "plan/dayselect";
	}
	
	
	@RequestMapping("/dayselectTop")
	public @ResponseBody List<SubCategoryVO> TopSelect(int topCategoryId, Model model){
		List<SubCategoryVO> subList = dao.setSubCategory(topCategoryId);
		model.addAttribute("subList", subList);
		
		return subList;
	}
	
	@RequestMapping("/getLocationList")
	public @ResponseBody List<PlaceVO> locationList(String city_id){
		List<PlaceVO> locList = dao.getloc(city_id);
		return locList;
	}
	
	
}
