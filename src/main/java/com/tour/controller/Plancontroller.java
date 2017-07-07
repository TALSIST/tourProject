package com.tour.controller;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.SessionScope;

import com.tour.dao.PlanDAO;
import com.tour.persistence.CityVO;
import com.tour.persistence.CountryVO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SubCategoryVO;
import com.tour.persistence.TopCategoryVO;

import oracle.sql.DATE;

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
	
	
	
	@RequestMapping("/savePlan")
	public void savePlan(String sendData){
		System.out.println(sendData);
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(sendData);
			JSONObject jsonObj = (JSONObject)obj;
			String tour_id=  (String)jsonObj.get("tour_id");
			JSONArray jsonarr = (JSONArray)jsonObj.get("tour");
			
			//"tour_date": "1",
			//"tour_order": "1"
			for(int i=0; i<jsonarr.size(); i++){
				JSONObject jsonobj = (JSONObject)jsonarr.get(i);
				int place_id = Integer.parseInt((String)jsonobj.get("place_id"));		//장소 ID
				String tour_dateOrder =  (String)jsonobj.get("tour_dateOrder");			//Day1 , Day2
				int tour_order = Integer.parseInt((String)jsonobj.get("tour_order"));		//각날짜의 여행순서
				String tour_fullDate= (String)jsonobj.get("tour_fullDate");
				System.out.println("tour_dateOrder : " + tour_dateOrder+" place_id = "+place_id + "  tour_order " +tour_order + " tour_fullDate  " + tour_fullDate);
				
				String year = tour_fullDate.substring(0,tour_fullDate.indexOf("-"));
				String mm = tour_fullDate.substring(tour_fullDate.indexOf("-")+1,tour_fullDate.lastIndexOf("-"));
				String dd = tour_fullDate.substring(tour_fullDate.lastIndexOf("-")+1,tour_fullDate.length());
				System.out.println(year+mm+dd);
				Map map= new HashMap();
				map.put("year", year);
				map.put("mm",mm);
				map.put("dd", dd);
				
				Date date = dao.getDate(map);			//데이트 형식
				
				DetailScheduleVO vo = new DetailScheduleVO();
				vo.setPlace_id(place_id);
				vo.setTour_id(Integer.parseInt(tour_id));
				vo.setTour_date(date);
				vo.setTour_order(tour_order);
				dao.setDetailSchedule(vo);
				
			}
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
//===========================예지부분========================================
	@RequestMapping("/startTour")
	public @ResponseBody String startTour(int city_id, String title, String startDate, String endDate, HttpSession session){
		Map map=new HashMap();
		map.put("title", title);
		dao.tourInsert(map);
		int tour_id=dao.getTourId();
		dao.setDetailTour(tour_id);
		dao.setShareTour(tour_id);
		
		String city_name = dao.getCityName(city_id);
		System.out.println("city_name : " + city_name);
		session.setAttribute("city_name", city_name);
		session.setAttribute("city_id", city_id);
		session.setAttribute("tour_id", tour_id);		
		session.setAttribute("title", title);
		session.setAttribute("startDay", startDate);
		session.setAttribute("endDay", endDate);
		return "plan/dayselect";
		//성공하면 성공이라고
		//실패하면 다른페이지로 이동시키기
	}
	@RequestMapping("/getContinentID")
	   public @ResponseBody List<CountryVO> countryList(String name){
	      List<CountryVO> conList = dao.countryList(name);
	      return conList;
	   }
	   
	   @RequestMapping("/getCountryID")
	   public @ResponseBody List<CityVO> cityList(String name){
	      System.out.println(name+"공백");
	      name=name.trim();
	      System.out.println(name);
	      List<CityVO> cityList=dao.cityList(name);
	      System.out.println(cityList);
	      return cityList;
	   }
	   
	   @RequestMapping("/detailTour")
	   public @ResponseBody String detailTour(int tour_id){
			dao.setDetailTour(tour_id);
		   return "plan/dayselect";
		   
	   }
	   
	   @RequestMapping("/shareTour")
	   public @ResponseBody String shareTour(int tour_id){
			dao.setShareTour(tour_id);
		   return "plan/dayselect";
	   }
	   
	   
	   
//==========================민정 부분=========================================
	
	   @RequestMapping("/routecommend")
	   public String route_comm(){
	      return "plan/routecommend";
	   }
	   
	   @RequestMapping("/recomm")
	    public String recomm(String prevLat,String prevlong,String curLat,String curlong,HttpSession session){ 
		   session.setAttribute("prevLat", prevLat);
		   session.setAttribute("prevlong", prevlong);
		   session.setAttribute("curLat", curLat);
		   session.setAttribute("curlong", curlong);
		   
		   return "plan/routecommend";
	      }
	   
	   @RequestMapping("/complete")
	   public String complete(){
	      return "plan/complete";
	   }
	   
	   
}
