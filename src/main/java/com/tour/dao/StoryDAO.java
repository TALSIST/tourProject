package com.tour.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.SchedulePlanVO;

@Repository
public class StoryDAO {
	@Autowired
	private StoryMapper sMapper;
	
	public List<SchedulePlanVO> selectSchedulePlans(int tour_id){
		List<SchedulePlanVO> schedulePlans = sMapper.selectSchedulePlans(tour_id);
		return schedulePlans;
	}
}
