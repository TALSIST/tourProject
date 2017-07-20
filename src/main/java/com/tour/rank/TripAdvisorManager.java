package com.tour.rank;

import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
public class TripAdvisorManager {
	public static void main(String[] args) {
		TripAdvisorManager gm = new TripAdvisorManager();
		gm.top25();
	}
	public List<RankPlaceVO> top25(){
		List<RankPlaceVO> list = new ArrayList<RankPlaceVO>();
		
		try {
			Document doc = Jsoup.connect("https://www.tripadvisor.co.kr/TravelersChoice-Destinations-cTop-g1").get();
			Elements ranks = doc.select("div.winnerLayer div.posn span.posn_inner");
			Elements titles = doc.select("div.winnerLayer div.mainName");
			Elements imgs = doc.select("div.winnerInfo_lb li.fl img");
			//			Elements imgs = doc.select("#WINNERVIEWER > ul > li.firstone > a > div > img");
			for(int i = 1;i<=ranks.size();i++){
				String placeTitle=titles.get(i-1).text();
				//System.out.println(ranks.get(i).text()+" "+placeTitle.substring(0, placeTitle.lastIndexOf(","))+" "+imgs.get(i).attr("src"));
				RankPlaceVO vo = new RankPlaceVO();
				vo.setRank(Integer.parseInt(ranks.get(i-1).text().trim()));
				//vo.setTitle(placeTitle.substring(0, placeTitle.lastIndexOf(",")));
				vo.setTitle(placeTitle);
				vo.setImg(imgs.get(3*i-2).attr("src"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
