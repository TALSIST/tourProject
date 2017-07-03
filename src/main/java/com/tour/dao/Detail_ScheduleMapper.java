package com.tour.dao;

import java.util.List;

import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.TourVO;


public interface Detail_ScheduleMapper {
	@Select("select d.tour_id,d.detail_schedule_id,d.place_id,d.tour_date,d.tour_order from DETAIL_SCHEDULE d "
			+ "where d.tour_id =#{tour_id} ")
	@Results(value={
			  @Result(property = "tour_id", column = "tour_id"),
			  @Result(property = "detail_schedule_id", column = "detail_schedule_id"),
			  @Result(property = "place_id", column = "place_id"),
			  @Result(property = "tour_date", column = "tour_date"),
			  @Result(property = "tour_order", column = "tour_order"),
			  @Result(property = "placeVO", column = "place_id",one=@One(select="getPlaceVO"))
				}
			)
	public List<DetailScheduleVO> detailMyPage(int tour_id);
	
	@Select("select * from place where place_id=#{place_id}")
	public PlaceVO getPlaceVO(int place_id);

	@Select("select * from TOUR t "
			+ "INNER JOIN SHARED_MEMBERS s "
			+ "on t.TOUR_ID = s.TOUR_ID "
			+ "INNER JOIN MEMBER m "
			+ "on s.MEMBER_ID =#{member_id} ")
	public List<TourVO> tourList(int member_id);
	
}
