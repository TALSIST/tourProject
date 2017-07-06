package com.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.SchedulePlanVO;
import com.tour.persistence.StoryImagesVO;
import com.tour.persistence.StoryVO;

public interface StoryMapper {
	@Results(value={
			@Result(property="tour_date", column="tour_date"),
			@Result(property="detailScheduleList", column="{tour_date=tour_date, tour_id=tour_id}", javaType=List.class, many=@Many(select="selectDetails"))
	})
	@Select("SELECT TO_CHAR(tour_date, 'YYYY-MM-DD') AS tour_date, tour_id FROM detail_schedule "
			+ "WHERE tour_id = #{tour_id} "
			+ "GROUP BY tour_date, tour_id "
			+ "ORDER BY tour_date ASC")
	public List<SchedulePlanVO> selectSchedulePlans(int tour_id);
	
	@Results(value={
			@Result(property="detail_schedule_id", column="detail_schedule_id"),
			@Result(property="place_id", column="place_id"),
			@Result(property="tour_id", column="tour_id"),
			@Result(property="tour_date", column="tour_date"),
			@Result(property="tour_order", column="tour_order"),
			@Result(property="memo", column="memo"),
			@Result(property="budget", column="budget"),
			@Result(property="transportation", column="transportation"),
			@Result(property="placeVO", column="place_id",  javaType=PlaceVO.class, many=@Many(select="selectPlace")),
			@Result(property="storyList", column="detail_schedule_id",  javaType=List.class, many=@Many(select="selectStory"))
	})
	@Select("SELECT TO_CHAR(tour_date, 'YYYY-MM-DD') AS tour_day, detail_schedule_id, place_id, tour_id, tour_date, tour_order, memo, budget, transportation "
			+ "FROM detail_schedule "
			+ "WHERE TO_CHAR(tour_date, 'YYYY-MM-DD') = #{tour_date} AND tour_id = #{tour_id} "
			+ "ORDER BY tour_order")
	public List<DetailScheduleVO> selectDetails(String tour_date, int tour_id);
	
	@Results(value={
			@Result(property="story_id", column="story_id"),
			@Result(property="title", column="title"),
			@Result(property="content", column="content"),
			@Result(property="regdate", column="regdate"),
			@Result(property="updatedate", column="updatedate"),
			@Result(property="hit", column="hit"),
			@Result(property="detail_schedule_id", column="detail_schedule_id"),
			@Result(property="member_id", column="member_id"),
			@Result(property="storyImageList", column="story_id",  javaType=List.class, many=@Many(select="selectStoryImages")),
	})
	@Select("SELECT * FROM story WHERE detail_schedule_id = #{detail_schedule_id}")
	public List<StoryVO> selectStory(int detail_schedule_id);
	
	@Select("SELECT * FROM story_images WHERE story_id = #{story_id}")
	public List<StoryImagesVO> selectStoryImages(int story_id);
	
	@Select("SELECT place_id, city_id, sub_category_id, name, explaination, address, phone, homepage, image, selection, good, latitude, longitude "
			+ "FROM place "
			+ "WHERE place_id = #{place_id}")
	public PlaceVO selectPlace(int place_id);
	
	@Insert("INSERT INTO story (story_id, title, content, regdate, updatedate, hit, detail_schedule_id, member_id) "
			+ "VALUES (seq_story.nextval, #{title}, #{content}, SYSDATE, SYSDATE, 0, #{detail_schedule_id}, #{member_id})")
	public void insertStroy(StoryVO story);
}
