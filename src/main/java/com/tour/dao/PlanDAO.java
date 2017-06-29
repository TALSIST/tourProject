package com.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.CityVO;
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
	
	public List<SubCategoryVO> setSubCategory(int topCategoryId){
		return planMapper.setSubCategory(topCategoryId);
	}
	
	
	public List<PlaceVO> getloc(String city_id){
		return planMapper.getloc(Integer.parseInt(city_id));
	}
	
	
}
