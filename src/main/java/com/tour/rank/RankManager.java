package com.tour.rank;

import java.util.*;

import org.springframework.stereotype.Component;
@Component
public class RankManager {
	public List<RankPlaceVO> getRankList(){
		RankPlaceDAO dao = new RankPlaceDAO("tripadvisor");
		TripAdvisorManager t = new TripAdvisorManager();
		List<RankPlaceVO> tList = t.top25();
		for(RankPlaceVO vo:tList){
			dao.placeInsert(vo);
		}
		System.out.println("저장완료");
		return dao.getTripData();
	}
}
