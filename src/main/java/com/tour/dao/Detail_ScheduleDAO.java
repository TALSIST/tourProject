package com.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.detailScheduleVO;
import com.tour.persistence.tourVO;

@Repository
public class Detail_ScheduleDAO {
	@Autowired
	private Detail_ScheduleMapper scheduleMapper;
	
	public List<tourVO> tourList(int member_id){
		return scheduleMapper.tourList(member_id);
	}
	
	public List<detailScheduleVO> detailMyPage(int tour_id){
		return scheduleMapper.detailMyPage(tour_id);
	}
	/*
	 * VO 대문자
	 * 퍼시스턴스 -> VO
	 * */
}
