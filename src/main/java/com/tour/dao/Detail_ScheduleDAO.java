package com.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.TourVO;

@Repository
public class Detail_ScheduleDAO {
	@Autowired
	private Detail_ScheduleMapper scheduleMapper;
	
	public List<TourVO> tourList(int member_id){
		return scheduleMapper.tourList(member_id);
	}
	
	public List<DetailScheduleVO> detailMyPage(int tour_id){
		return scheduleMapper.detailMyPage(tour_id);
	}
	
	/*
	 * VO 대문자
	 * 퍼시스턴스 -> VO
	 * */
}
