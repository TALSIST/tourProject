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
		System.out.println("TimeScheduleDAO.tourDateList");
		List<ScheduleDayVO> list=tsMapper.tourDateList(tour_id);
		System.out.println(list.get(0).getPlaceVO().size());
		for(int i=0;i<list.get(0).getCityVO().size();i++){
			System.out.println(i+" : "+list.get(0).getCityVO().get(i).getName());
		}
		/*for (int i=0;i<list.size();i++){
			System.out.println(list.get(i).getTour_date());
			
			list.get(i).setCityVO(tsMapper.tourDateCityList(tour_id, list.get(i).getTour_date()));
			//list.get(i).setPlaceVO(tsMapper.tourDatePlaceList(tour_id, list.get(i).getTour_date()));
		}*/
		
		return list;
	}

}
