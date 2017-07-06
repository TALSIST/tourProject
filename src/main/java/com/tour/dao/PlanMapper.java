package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.tour.persistence.CityVO;
import com.tour.persistence.CountryVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SubCategoryVO;
import com.tour.persistence.TopCategoryVO;

public interface PlanMapper {

	@Select("SELECT * FROM TOP_CATEGORY")
	public List<TopCategoryVO> setTopCategory();
	
	@Select("SELECT * FROM sub_category WHERE top_category_id=#{top_category_id}")
	public List<SubCategoryVO> setSubCategory(int top_category_id);
	
	@Select("SELECT * FROM place where city_id = #{city_id}")
	public List<PlaceVO> getloc(int city_id);
	
	
	@Select("SELECT * FROM place where city_id=#{city_id} and sub_category_id=#{sub_category_id}")
	public List<PlaceVO> selSubLocList(Map map);
	
	@Select("SELECT * FROM place where name LIKE '%'||#{name}||'%'")
	public List<PlaceVO> inputSearch(String name);
	
	//
	@Select("SELECT * FROM place WHERE place_id=#{place_id}")
	public List<PlaceVO> addSpot(int place_id);
	
	//서브카테고리 아이디가지고 서브카테고리 네임 가져오기
	@Select("SELECT name FROM sub_category where sub_category_id=#{sub_category_id}")
	public String getSubName(int sub_category_id);
	
	//==================================================================예지..
	
	   @Select("SELECT * FROM country WHERE continent_id=("
	         + "SELECT continent_id FROM continent where name=#{name})")
	   public List<CountryVO> getcontinent(String name);
	   
	   @Select("SELECT * FROM city WHERE country_id=(SELECT country_id FROM country where name=#{name})")
	   public List<CityVO> getcountry(String name); 
	
	
	
}
