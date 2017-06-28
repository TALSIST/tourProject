package com.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.tour.persistence.cityVO;
import com.tour.persistence.placeVO;
import com.tour.persistence.subCategoryVO;
import com.tour.persistence.topCategoryVO;

public interface PlanMapper {

	@Select("SELECT * FROM top_category")
	public List<topCategoryVO> setTopCategory();
	
	@Select("SELECT * FROM sub_category WHERE top_Category_Id=#{top_Category_Id}")
	public List<subCategoryVO> setSubCategory(int top_Category_Id);
	
	@Select("SELECT * FROM place where cityId = #{city_id}")
	public List<placeVO> getloc(int city_id);
}
