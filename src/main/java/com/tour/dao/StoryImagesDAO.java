package com.tour.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoryImagesDAO {
	@Autowired
	private StoryImagesMapper sImgMapper;
	
	public void insertStoryImages(String image){
		sImgMapper.inseryStoryImages(image);
	}
}
