package com.tour.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tour.dao.StoryDAO;
import com.tour.persistence.SchedulePlanVO;

@Service
public class StoryService {
	@Autowired
	private StoryDAO storyDao;
	
	public List<SchedulePlanVO> selectSchedulePlans(int tour_id){
		List<SchedulePlanVO> schedulePlans = storyDao.selectSchedulePlans(tour_id);
		return schedulePlans;
	}
}
