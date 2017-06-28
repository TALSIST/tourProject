package com.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.cityVO;
import com.tour.persistence.placeVO;
import com.tour.persistence.subCategoryVO;
import com.tour.persistence.topCategoryVO;

@Repository
public class PlanDAO {
	@Autowired
	private PlanMapper planMapper;
	
	public List<topCategoryVO> setTopCategory(){
		return planMapper.setTopCategory();
	}
	
	public List<subCategoryVO> setSubCategory(int topCategoryId){
		return planMapper.setSubCategory(topCategoryId);
	}
	
	
	public List<placeVO> getloc(String city_id){
		return planMapper.getloc(Integer.parseInt(city_id));
	}
	
	
}
