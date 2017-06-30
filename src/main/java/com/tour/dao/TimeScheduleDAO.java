package com.tour.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.persistence.CityVO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.ScheduleDayVO;

@Repository
public class TimeScheduleDAO {
	
	@Autowired
	TimeScheduleMapper tsMapper;
	
	
	public List<ScheduleDayVO> tourDateList(int tour_id){
		//System.out.println("TimeScheduleDAO.tourDateList");
		List<ScheduleDayVO> list=tsMapper.tourDateList(tour_id);
	
		return list;
	}

}
