package com.tour.dao;

import java.util.List;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

import com.tour.persistence.detailScheduleVO;
import com.tour.persistence.tourVO;


public interface Detail_ScheduleMapper {
	@SelectKey(statement="select tour_id from tour", resultType=Integer.class ,keyProperty="tour_id", before = false)
	@Select("select * from DETAIL_SCHEDULE d "
			+ "inner join PLACE p "
			+ "on d.PLACE_ID=p.PLACE_ID "
			+ "and d.tour_id=#{tour_id}")
	public List<detailScheduleVO> detailMyPage(int tour_id);
	

	@Select("select * from TOUR t "
			+ "INNER JOIN SHARED_MEMBERS s "
			+ "on t.TOUR_ID = s.TOUR_ID "
			+ "INNER JOIN MEMBER m "
			+ "on s.MEMBER_ID =#{member_id} ")
	public List<tourVO> tourList(int member_id);
	
	
	
}
