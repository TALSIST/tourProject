package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface MainContentMapper {
	@Select("SELECT CEIL(COUNT(*)/9) FROM tour")
	public int contenttotalpage();
	
	@Select("SELECT tour_id, title, subTitle, img, num FROM "
			+ "(SELECT tour_id, title, subTitle, img, rownum as num FROM "
			+ "(SELECT tour_id, title, subTitle, img FROM tour "
			+ "ORDER BY tour_id DESC)) WHERE num BETWEEN #{start} AND #{end}")
	public List<MainContentVO> contentData(Map map);
	
	@Select("SELECT tour_id, title, subTitle, img FROM tour WHERE tour_id BETWEEN 1 AND 6")
	public List<MainContentVO> contentDataMain();
}
