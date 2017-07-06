package com.tour.persistence;

import java.util.Date;
import java.util.List;

public class ScheduleDayVO {

	// for TimeSchedule
	private int tour_id;
	private Date tour_date;
	private String day_title;
	private String day_day;
	private String day_order;
	private String day_title_short;
	
	List<CityVO>   cityVO;
	List<PlaceVO> placeVO;
	
	public String getDay_title_short() {
		return day_title_short;
	}
	public void setDay_title_short(String day_title_short) {
		this.day_title_short = day_title_short;
	}
	public int getTour_id() {
		return tour_id;
	}
	public void setTour_id(int tour_id) {
		this.tour_id = tour_id;
	}
	public Date getTour_date() {
		return tour_date;
	}
	public void setTour_date(Date tour_date) {
		this.tour_date = tour_date;
	}
	public String getDay_title() {
		return day_title;
	}
	public void setDay_title(String day_title) {
		this.day_title = day_title;
	}
	public String getDay_day() {
		return day_day;
	}
	public void setDay_day(String day_day) {
		this.day_day = day_day;
	}
	public String getDay_order() {
		return day_order;
	}
	public void setDay_order(String day_order) {
		this.day_order = day_order;
	}
	public List<CityVO> getCityVO() {
		return cityVO;
	}
	public void setCityVO(List<CityVO> cityVO) {
		this.cityVO = cityVO;
	}
	public List<PlaceVO> getPlaceVO() {
		return placeVO;
	}
	public void setPlaceVO(List<PlaceVO> placeVO) {
		this.placeVO = placeVO;
	}	
	
}
