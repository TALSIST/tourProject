package com.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tour.dao.PlanDAO;
import com.tour.persistence.CityVO;
import com.tour.persistence.CountryVO;
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
	
	//sub_category_id":101,"top_category_id":41,"name":"�ڵ��� �Ӵ�
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
	
	//�˻��� �Է��ϸ� �� �������� �ؿ� �����̼� ����ֱ�
	@RequestMapping("/inputsearch")
	public @ResponseBody List<PlaceVO> inputsearch(String name){
		System.out.println(name+"name");
		List<PlaceVO> inputSearch=dao.inputSearch(name);
		return inputSearch;
	}
	
	//Spot Day�߰��ϱ�
	@RequestMapping("/addSpot")
	public @ResponseBody List<PlaceVO> addSpot(int place_id, int sub_category_id, Model model){
		
		List<PlaceVO> addSpot = dao.addSpot(place_id);
		String sub_category_name = dao.getSubName(sub_category_id);
		System.out.println(sub_category_name);
		sub_category_name="abc";
		model.addAttribute("sub_category_name", sub_category_name);
		System.out.println(addSpot);
		return addSpot;
	}
	
	@RequestMapping("/goDaySelect")
	public String goDay(){
		return "plan/dayselect";
	}
	
	@RequestMapping("/dddddd")
	public String dododo(String startDate, String endDate, HttpSession session){
		/*System.out.println("asdfasdfasdfasdf         "+startDate);
		if((tourTitle!="") && (startDate!="") && (endDate!="")){
			
			
			//DB�� �ֱ�
			
		}*/
		//session.setAttribute("tourTitle", tourTitle);
		session.setAttribute("startDay", startDate);
		session.setAttribute("endDay", endDate);
		return "plan/dayselect";
		
		
		//�����ϸ� �����̶��
		//�����ϸ� �ٸ��������� �̵���Ű��
	}
	
//===========================�����κ�========================================
	
	@RequestMapping("/getContinentID")
	   public @ResponseBody List<CountryVO> countryList(String name){
	      List<CountryVO> conList = dao.countryList(name);
	      return conList;
	   }
	   
	   @RequestMapping("/getCountryID")
	   public @ResponseBody List<CityVO> cityList(String name){
	      System.out.println(name+"����");
	      name=name.trim();
	      System.out.println(name);
	      List<CityVO> cityList=dao.cityList(name);
	      System.out.println(cityList);
	      return cityList;
	   }
//==========================���� �κ�=========================================
	
	   @RequestMapping("/routecommend")
	   public String route_comm(){
	      return "plan/routecommend";
	   }
	   
	   @RequestMapping("/complete")
	   public String complete(){
	      return "plan/complete";
	   }
	   
	   
}
