package com.tour.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.SchedulePlanVO;
import com.tour.persistence.StoryVO;

@Repository
public class StoryDAO {
	@Autowired
	private StoryMapper sMapper;
	
	public List<SchedulePlanVO> selectSchedulePlans(int tour_id){
		List<SchedulePlanVO> schedulePlans = sMapper.selectSchedulePlans(tour_id);
		return schedulePlans;
	}
	
	public void insertStory(StoryVO story){
		sMapper.insertStroy(story);
	}
	
	public void updateStory(StoryVO story){
		sMapper.updateStory(story);
	}
	
	public void deleteStory(int story_id){
		sMapper.deleteStory(story_id);
	}
}
