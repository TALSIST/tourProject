package com.tour.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.tour.persistence.DetailScheduleVO;

public class Util {
	public List getDay(List<DetailScheduleVO> list){
		
		for(int i=0;i<list.size();i++){
			Date date1 = list.get(i).getTour_date();
			Date date2 = list.get(list.size()-1).getTour_date();
			Date date3 = list.get(0).getTour_date();
			SimpleDateFormat sdf= new SimpleDateFormat("yy-MM-dd");
			Calendar c1 = Calendar.getInstance();
			Calendar c2 = Calendar.getInstance();
			Calendar c3 = Calendar.getInstance();
			c1.setTime(date1);
			c2.setTime(date2);
			c3.setTime(date3);
			long d1 =c1.getTime().getTime();
			long d2 =c2.getTime().getTime();
			long d3 =c3.getTime().getTime();
			int day2=(int)((d1-d2)/(1000*60*60*24));
			int day =(int)((d2-d3)/(1000*60*60*24))+1;
			list.get(i).setDay(day+day2);
		}
		int a=0;
		for(int i=0;i<list.size()-1;i++){
			if(list.get(i).getDay()==list.get(i+1).getDay()){
				list.get(i).setGubun("0");
			}else{
				list.get(i).setGubun("1");
			}
			System.out.print(list.get(i).getGubun());
		}
		System.out.println(a);
		return list;
	}
}
