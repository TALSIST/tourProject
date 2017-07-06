package com.tour.persistence;

public class MainContentVO {
	private int tour_id;
	private String title;
	private String subTitle;
	private String img;
	private String completion_status;
	private int hits;

	public int getTour_id() {
		return tour_id;
	}

	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getCompletion_status() {
		return completion_status;
	}

	public void setCompletion_status(String completion_status) {
		this.completion_status = completion_status;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

}
