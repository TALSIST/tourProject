package com.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.tour.persistence.CityVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SubCategoryVO;
import com.tour.persistence.TopCategoryVO;

public interface PlanMapper {

	@Select("SELECT * FROM top_category")
	public List<TopCategoryVO> setTopCategory();
	
	@Select("SELECT * FROM sub_category WHERE top_Category_Id=#{top_Category_Id}")
	public List<SubCategoryVO> setSubCategory(int top_Category_Id);
	
	@Select("SELECT * FROM place where cityId = #{city_id}")
	public List<PlaceVO> getloc(int city_id);
}
