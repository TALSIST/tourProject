package com.tour.persistence;

import java.util.Date;

public class detailScheduleVO {
	private int detailScheduleId;
	private int placeId;
	private int tourId;
	private Date tourDate;
	private int tourOrder;
	private String memo;
	private int budget;
	private String transportation;
	public int getDetailScheduleId() {
		return detailScheduleId;
	}
	public void setDetailScheduleId(int detailScheduleId) {
		this.detailScheduleId = detailScheduleId;
	}
	public int getPlaceId() {
		return placeId;
	}
	public void setPlaceId(int placeId) {
		this.placeId = placeId;
	}
	public int getTourId() {
		return tourId;
	}
	public void setTourId(int tourId) {
		this.tourId = tourId;
	}
	public Date getTourDate() {
		return tourDate;
	}
	public void setTourDate(Date tourDate) {
		this.tourDate = tourDate;
	}
	public int getTourOrder() {
		return tourOrder;
	}
	public void setTourOrder(int tourOrder) {
		this.tourOrder = tourOrder;
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
