package com.tour.persistence;

import java.util.Date;

public class DetailScheduleVO {
	private int detail_schedule_id;
	private int place_id;
	private int tour_id;
	private Date tour_date;
	private int tour_order;
	private String memo;
	private int budget;
	private String transportation;
	private PlaceVO placeVO;
	private int day;
	private String gubun;

	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public PlaceVO getPlaceVO() {
		return placeVO;
	}
	public void setPlaceVO(PlaceVO placeVO) {
		this.placeVO = placeVO;
	}
	public int getDetail_schedule_id() {
		return detail_schedule_id;
	}
	public void setDetail_schedule_id(int detail_schedule_id) {
		this.detail_schedule_id = detail_schedule_id;
	}
	public int getPlace_id() {
		return place_id;
	}
	public void setPlace_id(int place_id) {
		this.place_id = place_id;
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
	public int getTour_order() {
		return tour_order;
	}
	public void setTour_order(int tour_order) {
		this.tour_order = tour_order;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public String getTransportation() {
		return transportation;
	}
	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}
	
}
