package com.tour.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

public interface StoryImagesMapper {
	@Insert("INSERT INTO story_images (story_images_id, image, story_id) "
			+ "VALUES (seq_story_images.nextval, #{image}, seq_story.currval)")
	public void insertStoryImages(String image);
	
	@Insert("INSERT INTO story_images (story_images_id, image, story_id) "
			+ "VALUES (seq_story_images.nextval, #{image}, #{story_id})")
	public void insertStoryUpdateImages(Map<String, Object> map);
	
	@Delete("DELETE FROM story_images WHERE story_id = #{story_id}")
	public void deleteStoryImages(int story_id);
	
}
