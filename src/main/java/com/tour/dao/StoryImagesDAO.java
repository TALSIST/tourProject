package com.tour.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoryImagesDAO {
	@Autowired
	private StoryImagesMapper sImgMapper;
	
	public void insertStoryImages(String image){
		sImgMapper.insertStoryImages(image);
	}
	
	public void deleteStoryImages(int story_id){
		sImgMapper.deleteStoryImages(story_id);
	}
	
	public void insertStoryUpdateImages(String image, int story_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("image", image);
		map.put("story_id", story_id);
		sImgMapper.insertStoryUpdateImages(map);
	}
}
