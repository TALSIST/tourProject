package com.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.PlanDAO;
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
	
	//sub_category_id":101,"top_category_id":41,"name":"자동차 임대
	@RequestMapping("/dayselectTop")
	public @ResponseBody List<SubCategoryVO> TopSelect(int top_category_id, Model model){
		List<SubCategoryVO> subList = dao.setSubCategory(top_category_id);
		model.addAttribute("subList", subList);
		return subList;
	}
	
	@RequestMapping("/getLocationList")
	public @ResponseBody List<PlaceVO> locationList(String city_id){
		List<PlaceVO> locList = dao.getloc(city_id);
		return locList;
	}
	
	@RequestMapping("/selSubcategoryLocList")
	public @ResponseBody List<PlaceVO> selSubLocList(String city_id,String sub_category_id){
		Map map = new HashMap();
		map.put("city_id", city_id);
		map.put("sub_category_id", sub_category_id);
		List<PlaceVO> selSubLocList=dao.selSubLocList(map);
		return selSubLocList;
	}
	
	//검색어 입력하면 그 순간마다 밑에 로케이션 찍어주기
	@RequestMapping("/inputsearch")
	public @ResponseBody List<PlaceVO> inputsearch(String name){
		System.out.println(name+"name");
		List<PlaceVO> inputSearch=dao.inputSearch(name);
		return inputSearch;
	}
	
	//Spot Day추가하기
	@RequestMapping("/addSpot")
	public @ResponseBody List<PlaceVO> addSpot(String name, int sub_category_id, Model model){
		List<PlaceVO> addSpot = dao.addSpot(name);
		String sub_category_name = dao.getSubName(sub_category_id);
		System.out.println(sub_category_name);
		sub_category_name="abc";
		model.addAttribute("sub_category_name", sub_category_name);
		return addSpot;
	}
	
	
	
	
}
