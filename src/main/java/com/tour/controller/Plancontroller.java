package com.tour.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.PlanDAO;
import com.tour.persistence.cityVO;
import com.tour.persistence.placeVO;
import com.tour.persistence.subCategoryVO;
import com.tour.persistence.topCategoryVO;

@Controller
public class Plancontroller {
	@Autowired
	private PlanDAO dao;
	
	
	@RequestMapping("/dayselect2")
	public String dayselect(Model model){
		List<topCategoryVO> topList = dao.setTopCategory();
		model.addAttribute("topList", topList);
		return "plan/dayselect";
	}
	
	
	@RequestMapping("/dayselectTop")
	public @ResponseBody List<subCategoryVO> TopSelect(int topCategoryId, Model model){
		List<subCategoryVO> subList = dao.setSubCategory(topCategoryId);
		model.addAttribute("subList", subList);
		
		return subList;
	}
	
	@RequestMapping("/getLocationList")
	public @ResponseBody List<placeVO> locationList(String city_id){
		List<placeVO> locList = dao.getloc(city_id);
		return locList;
	}
	
	
}
