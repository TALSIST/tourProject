package com.tour.persistence;

import java.util.Date;
import java.util.List;

public class StoryVO {
	private int story_id;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int hit;
	private int detail_schedule_id;
	private int member_id;
	private String[] imageFiles; //업로드 파일을 받을 때 사용
	private List<StoryImagesVO> storyImageList;

	public List<StoryImagesVO> getStoryImageList() {
		return storyImageList;
	}

	public void setStoryImageList(List<StoryImagesVO> storyImageList) {
		this.storyImageList = storyImageList;
	}

	public int getStory_id() {
		return story_id;
	}

	public void setStory_id(int story_id) {
		this.story_id = story_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public Date getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getDetail_schedule_id() {
		return detail_schedule_id;
	}

	public void setDetail_schedule_id(int detail_schedule_id) {
		this.detail_schedule_id = detail_schedule_id;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String[] getImageFiles() {
		return imageFiles;
	}

	public void setImageFiles(String[] imageFiles) {
		this.imageFiles = imageFiles;
	}

}
