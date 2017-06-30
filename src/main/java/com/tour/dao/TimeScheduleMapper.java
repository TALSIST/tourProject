package com.tour.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Many;

import com.tour.persistence.CityVO;
import com.tour.persistence.DetailScheduleVO;
import com.tour.persistence.PlaceVO;
import com.tour.persistence.ScheduleDayVO;
import com.tour.persistence.TourVO;

public interface TimeScheduleMapper {

	
	@Results(
			{
			@Result(property="tour_order", 			column="tour_order"),
			@Result(property="cityvo.name", 			column="city_name" ),
			@Result(property="placevo.name", 		column="place_name" ),
			@Result(property="datevo.mm", 			column="mm" ),
			@Result(property="datevo.dd", 			column="dd" ),
			@Result(property="datevo.dy", 			column="dy" ),
			@Result(property="datevo.day_seq", 	column="day_seq" ),
			@Result(property="datevo.day_rk", 		column="day_rk" )
			}
	)
	@Select("Select to_char(dts.tour_date,'MON DD\"일 (\" DY \")\"')        day_title  "
			+"            ,'DAY '||TO_CHAR((dts.tour_date-stDt.start_date)+1) day_order "
			+"            ,pl.name                                                                      place_name"
            +"		        ,rank() over(partition by tour_date                                               "
		    +"                               order by tour_order, ds.place_id) day_rk                  "
            +"from   detail_schedule ds																	      "
            +"         ,place                pl																		      "
            +"		     ,city                  ct																		  "
            +"		     ,(select min(tour_date) start_date												  "
            +"		       from   detail_schedule dtl															  "
            +"		       where dtl.TOUR_ID = #{tour_id} ) stdt										  "
            +"where tour_id = #{tour_id}																	  "
            +"and     pl.PLACE_ID = ds.PLACE_ID														      "
            +"and     ct.CITY_ID    = pl.CITY_ID														      "
            +"order by tour_date, tour_order	")
	public List<DetailScheduleVO> timeScheduleListData(int tour_id);
	
	// 일정표 날짜 리스트
	@Select("select dts.tour_id                                                                            "
            +"        ,dts.tour_date																		 "
            +"		,to_char(dts.tour_date,'MON DD\"일\"') day_title		 "
            +"    ,'('||to_char(dts.tour_date,'DY')||')'                       day_day"
            +"		,'DAY '||TO_CHAR((dts.tour_date-stDt.start_date)+1) day_order	 "
            +"    ,TO_CHAR(dts.tour_id)||':'||TO_CHAR(dts.tour_date,'yyyymmdd') tour_id_date "
            +"from 																								"
            +"        (select tour_id, tour_date                                                       "
            +"          from  detail_schedule 															 "
            +"		  where tour_id = #{tour_id}													 "
            +"         group by tour_id, tour_date ) dts											 "
            +"        ,(select tour_id, min(tour_date) start_date								"
            +"		   from   detail_schedule																 "
            +"		   where tour_id = #{tour_id} 													 "
            +"		   group by tour_id) stDt															 "
            +"where dts.tour_id = stDt.tour_id														 "
            +"order by dts.tour_date")	
	@Results(
			value={
					@Result(property="tour_id"     , column="tour_id"),
					@Result(property="tour_date" , column="tour_date"),
					@Result(property="day_title"   ,column="day_title"),
					@Result(property="day_order",column="day_order"),
					@Result(property="cityVO"      , javaType=List.class, column="tour_id_date", many=@Many(select="tourDateCityList")),
					@Result(property="placeVO"   , javaType=List.class, column="tour_id_date", many=@Many(select="tourDatePlaceList"))
			})
	public List<ScheduleDayVO> tourDateList(int tour_id);
	
	@Select("SELECT ct.city_id, ct.name "
               +"FROM   city ct "
               +"           ,(SELECT plc.city_id, ds.TOUR_DATE, ds.TOUR_ORDER "
               +"		        FROM   place plc  "
               +"					       ,detail_schedule ds  "
               +"					      ,(SELECT TO_NUMBER(SUBSTR(#{tour_id_date},1,INSTR(#{tour_id_date},':')-1)) tour_id  "
               +"         		                       ,SUBSTR(#{tour_id_date},INSTR(#{tour_id_date},':')+1)                          yyyymmdd  "
               +"                          FROM   dual) idt  "
               +"			   WHERE plc.place_id   = ds.place_id  "
               +"			   AND     ds.tour_id     = idt.tour_id  "
               +"			   AND     TO_CHAR(ds.tour_date,'yyyymmdd')=idt.yyyymmdd "
               +"			   ORDER BY ds.TOUR_DATE, ds.TOUR_ORDER ) sch "
               +"WHERE ct.city_id = sch.city_id "
               +"GROUP BY ct.city_id, ct.name")
	public List<CityVO> tourDateCityList(String tour_id_date);
	
	@Select("SELECT p.place_id                                 place_id "
			   +"           ,TO_CHAR(rownum)||'.'||p.name  name "
			   +"FROM   place                p "
			   +"           ,detail_schedule ds "
			   +"           ,(SELECT TO_NUMBER(SUBSTR(#{tour_id_date},1,INSTR(#{tour_id_date},':')-1)) tour_id "
		       +"                         ,SUBSTR(#{tour_id_date},instr(#{tour_id_date},':')+1)                           yyyymmdd "
               +"              FROM   dual) idt "
			   +"WHERE p.place_id = ds.place_id "
			   +"AND     ds.tour_id = idt.tour_id "
			   +"AND     TO_CHAR(ds.tour_date,'yyyymmdd')=idt.yyyymmdd "
			   +"ORDER BY ds.tour_date, ds.tour_order "
                )
	   //+"AND     ds.tour_date = #{tour_date} "
	public List<PlaceVO> tourDatePlaceList(String tour_id_date);

}
