package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainContentDAO {
	@Autowired
	private MainContentMapper mcMapper;
	
	public int contenttotalpage(){
		return mcMapper.contenttotalpage();
	}
	
	public List<MainContentVO> contentData(Map map){
		return mcMapper.contentData(map);
	}
	
	public List<MainContentVO> contentDataMain(){ //메인페이지에서 띄우는거~!
		return mcMapper.contentDataMain();
	}
}
