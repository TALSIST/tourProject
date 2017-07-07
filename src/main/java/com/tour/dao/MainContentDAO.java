package com.tour.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tour.persistence.MainContentVO;

@Repository
public class MainContentDAO {
	@Autowired
	private MainContentMapper mcMapper;
	
	public int contentTotalPage(){
		return mcMapper.contentTotalPage();
	}
	public int contentTotalPage(String countryName){
		return mcMapper.contentTotalPageSearch(countryName);
	}
	
	public List<MainContentVO> contentData(Map map){
		return mcMapper.contentData(map);
	}
	
	public List<MainContentVO> contentDataSearch(Map map){
		return mcMapper.contentDataSearch(map);
	}
	
	public List<MainContentVO> contentDataMain(){ //�������������� ���°�~!
		return mcMapper.contentDataMain();
	}
	
	public List<String> countryFromContinent(String continentName){
		return mcMapper.countryFromContinent(continentName);
	}
}
