package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.tour.persistence.MainContentVO;

public interface MainContentMapper {
	//占싣뱄옙占싶듸옙 占쏙옙占쏙옙 占싯삼옙占쏙옙占쏙옙占쏙옙 占쏙옙체占쏙옙占쏙옙占쏙옙占쏙옙
	@Select("SELECT CEIL(COUNT(*)/9) FROM tour")
	public int contentTotalPage();
	
	//占쏙옙占쏙옙占쏙옙占쏙옙占싱쇽옙
	@Select("SELECT tour_id, title, subTitle, img, num FROM "
			+ "(SELECT tour_id, title, subTitle, img, rownum as num FROM "
			+ "(SELECT tour_id, title, subTitle, img FROM tour "
			+ "ORDER BY tour_id DESC)) WHERE num BETWEEN #{start} AND #{end}")
	public List<MainContentVO> contentData(Map map);
	
	//占쏙옙占쏙옙占쏙옙 占싯삼옙占쏙옙占쏙옙占쏙옙, 占쏙옙체占쏙옙占쏙옙占쏙옙占쏙옙
	@Select("SELECT CEIL(COUNT(DISTINCT t.tour_id)/9) "
			+"FROM tour t, detail_schedule d, place p, city ct, country cy "
			+"WHERE t.tour_id=d.tour_id AND d.place_id=p.place_id "
			+"AND p.city_id=ct.city_id AND ct.country_id=cy.country_id "
			+"AND cy.name=#{countryName}")
	public int contentTotalPageSearch(String countryName);
	
	//占쏙옙占쏙옙占쏙옙 占싯삼옙占쏙옙占쏙옙占쏙옙, 占쏙옙占쏙옙占쏙옙占쏙옙占싱쇽옙
	@Select("SELECT tour_id, title, subTitle, img, num FROM "
			+"(SELECT tour_id, title, subTitle, img, rownum as num FROM "
			+"(SELECT DISTINCT t.tour_id, t.title, t.subTitle, t.img FROM "
			+"tour t, detail_schedule d, place p, city ct, country cy "
			+"WHERE t.tour_id=d.tour_id "
			+"AND d.place_id=p.place_id "
			+"AND p.city_id=ct.city_id "
			+"AND ct.country_id=cy.country_id "
			+"AND cy.name=#{countryName} " 
			+"ORDER BY t.tour_id DESC)) WHERE num BETWEEN #{start} AND #{end}")
	public List<MainContentVO> contentDataSearch(Map map);
	
	//占쏙옙占쏙옙화占쏙옙 占쏙옙 5占쏙옙占쏙옙 占쏙옙占쏙옙
	@Select("SELECT tour_id, title, subTitle, img FROM tour WHERE tour_id BETWEEN 2 AND 7")
	public List<MainContentVO> contentDataMain();
	
	//占쏙옙占� 占쏙옙占쏙옙 찾占쏙옙
	@Select("SELECT name FROM country WHERE continent_id=(SELECT continent_id FROM continent WHERE name=#{continentName})")
	public List<String> countryFromContinent(String continentName);
}
