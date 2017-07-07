package com.tour.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tour.dao.StoryDAO;
import com.tour.dao.StoryImagesDAO;
import com.tour.persistence.SchedulePlanVO;
import com.tour.persistence.StoryVO;

@Service
public class StoryService {
	@Autowired
	private StoryDAO storyDao;
	@Autowired
	private StoryImagesDAO storyImgDao;
	
	public List<SchedulePlanVO> selectSchedulePlans(int tour_id){
		List<SchedulePlanVO> schedulePlans = storyDao.selectSchedulePlans(tour_id);
		return schedulePlans;
	}
	
	@Transactional
	public void insertStory(StoryVO story){
		storyDao.insertStory(story);
		if(story.getImageFiles() != null){
			for(int i=0; i<story.getImageFiles().length; i++){
				storyImgDao.insertStoryImages(story.getImageFiles()[i].substring(0,12)+story.getImageFiles()[i].substring(14));
			}
		}
	}
	
	@Transactional
	public void updateStory(StoryVO story){
		storyDao.updateStory(story);
		storyImgDao.deleteStoryImages(story.getStory_id());
		if(story.getImageFiles() != null){
			for(int i=0; i<story.getImageFiles().length; i++){
				storyImgDao.insertStoryUpdateImages(
						story.getImageFiles()[i].substring(0,12)+story.getImageFiles()[i].substring(14),
						story.getStory_id());
			}
		}
	}
	
	@Transactional
	public void deleteStory(int story_id){
		storyDao.deleteStory(story_id);
		storyImgDao.deleteStoryImages(story_id);
	}
}
