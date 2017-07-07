package com.tour.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.CityVO;
import com.tour.persistence.CountryVO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SubCategoryVO;
import com.tour.persistence.TopCategoryVO;

@Repository
public class PlanDAO {
	@Autowired
	private PlanMapper planMapper;
	
	public List<TopCategoryVO> setTopCategory(){
		return planMapper.setTopCategory();
	}
	
	public List<SubCategoryVO> setSubCategory(int top_category_id){
		return planMapper.setSubCategory(top_category_id);
	}
	public String getCityName(int city_id){
		return planMapper.getCityName(city_id);
	}
	
	public List<PlaceVO> getloc(String city_id){
		return planMapper.getloc(Integer.parseInt(city_id));
	}
	
	public List<PlaceVO> selSubLocList(Map map){
		return planMapper.selSubLocList(map);
	}
	
	public List<PlaceVO> inputSearch(String name){
		return planMapper.inputSearch(name);
	}
	
	public List<PlaceVO> addSpot(int place_id){
		return planMapper.addSpot(place_id);
	}
	
	public String getSubName(int sub_category_id){
		return planMapper.getSubName(sub_category_id);
	}
	
	public Date getDate(Map map){
		return planMapper.getDate(map);
	} 
	
	public void setDetailSchedule(DetailScheduleVO vo){
		planMapper.setDetailSchedule(vo);
	}

	//==================================================예지부분..
	   
		public List<CountryVO> countryList(String name){
	      return planMapper.getcontinent(name);
	   }
	   
	   public List<CityVO> cityList(String name){
	      return planMapper.getcountry(name);
	   }
	   
	   public void tourInsert(Map map){
		      planMapper.tourInsert(map);
	   }
	   
	   public int getTourId(){
		   return planMapper.getTourId();
	   }
	   
	   
	   public void setDetailTour(int tour_id){
		   planMapper.setDetailTour(tour_id);
	   }
	   
	   public void setShareTour(int tour_id){
		   planMapper.setShareTour(tour_id);
	   }
}
