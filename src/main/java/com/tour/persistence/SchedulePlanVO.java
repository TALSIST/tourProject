package com.tour.persistence;

import java.util.ArrayList;
import java.util.List;

public class SchedulePlanVO {
	private String tour_date;
	private List<DetailScheduleVO> detailScheduleList = new ArrayList<DetailScheduleVO>();

	public String getTour_date() {
		return tour_date;
	}

	public void setTour_date(String tour_date) {
		this.tour_date = tour_date;
	}
	
	public List<DetailScheduleVO> getDetailScheduleList() {
		return detailScheduleList;
	}

	public void setDetailScheduleList(List<DetailScheduleVO> detailScheduleList) {
		this.detailScheduleList = detailScheduleList;
	}

}
