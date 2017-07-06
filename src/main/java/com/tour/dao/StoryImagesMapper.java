package com.tour.dao;

import org.apache.ibatis.annotations.Insert;

public interface StoryImagesMapper {
	@Insert("INSERT INTO story_images (story_images_id, image, story_id) "
			+ "VALUES (seq_story_images.nextval, #{image}, seq_story.currval)")
	public void inseryStoryImages(String image);
}
