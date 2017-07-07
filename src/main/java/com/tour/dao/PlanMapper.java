package com.tour.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.tour.persistence.CityVO;
import com.tour.persistence.CountryVO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.MemberVO;
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
	
	@Select("SELECT name FROM city where city_id=#{city_id}")
	public String getCityName(int city_id);
	
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
	
	//Date형식 변환
	@Select("SELECT to_date(#{year}||lpad(#{mm},2,'0')||lpad(#{dd},2,'0')) yyyymmdd from dual")
	public Date getDate(Map map);
	
	//일정만들기 데이터 입력.
	@Insert("INSERT INTO detail_schedule(detail_schedule_id,place_id,tour_id,tour_date,tour_order) "
			+ " VALUES(SEQ_DETAIL_SCHEDULE.nextval,#{place_id},#{tour_id},#{tour_date},#{tour_order}) ")
	public void setDetailSchedule(DetailScheduleVO vo);
	
	//일정짜기 게시글 공유권한 가져오기
	@Select("SELECT * FROM member WHERE member_id=(SELECT member_id FROM shared_members WHERE tour_id=#{tour_id})")
	public List<MemberVO> getMember(int tour_id);
	
	//==================================================================예지..
	
	@Select("SELECT * FROM country WHERE continent_id=("
	         + "SELECT continent_id FROM continent where name=#{name})")
	   public List<CountryVO> getcontinent(String name);
	   
	   @Select("SELECT * FROM city WHERE country_id=(SELECT country_id FROM country where name=#{name})")
	   public List<CityVO> getcountry(String name); 
	
	   @Insert("INSERT INTO tour(tour_id,title,img) VALUES(SEQ_TOUR.nextval, #{title},#{img})")
	   public void tourInsert(Map map);
	   
	   @Select("SELECT SEQ_TOUR.currval from dual")
	   public int getTourId();
	   
	   
	   @Insert("INSERT INTO detail_schedule(detail_schedule_id,place_id,tour_id) VALUES(SEQ_DETAIL_SCHEDULE.nextval,#{place_id},#{tour_id})")
	      public void setDetailTour(int tour_id);
	      
	      @Insert("INSERT INTO shared_members(shared_members_id,tour_id,member_id) VALUES(SEQ_SHARED_MEMBERS.nextval,#{tour_id},#{member_id})")
	      public void setShareTour(Map shareMap);
	      
	
}
