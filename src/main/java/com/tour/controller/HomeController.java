package com.tour.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.MainContentDAO;
import com.tour.persistence.MainContentVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private MainContentDAO dao;
	
	@RequestMapping("/main1")
	public String main1_page(Model model){
		List<MainContentVO> list = dao.contentDataMain();
		model.addAttribute("list", list);
		return "main/main1";
	}
	
	@RequestMapping("/list")
	public String main_list(Model model){
		List<String> eList=dao.countryFromContinent("유럽");
		List<String> sList=dao.countryFromContinent("남태평양");
		List<String> nList=dao.countryFromContinent("북미");
		List<String> mList=dao.countryFromContinent("중남미");
		List<String> aList=dao.countryFromContinent("아시아");
		model.addAttribute("eList", eList);
		model.addAttribute("sList", sList);
		model.addAttribute("nList", nList);
		model.addAttribute("mList", mList);
		model.addAttribute("aList", aList);
		return "main/list";
	}
	
	@RequestMapping("/result")
	public String main_result(String countryName, int page, Model model){ //占쏙옙占쏙옙트占쏙옙占쏙옙 占쏙옙탈占쏙옙 占쏙옙占시울옙 占쏙옙타트占쏙옙 end占쏙옙 占쏙옙占� 占싼댐옙! 
		int totalpage=0;
		if(countryName == null){//占쏙옙트占쏙옙占싱몌옙占쏙옙 占쏙옙占� 占쏙옙占�,
			totalpage=dao.contentTotalPage();
		}else{//占쏙옙트占쏙옙 占싱몌옙占쏙옙 占쌍댐옙 占쏙옙占�,
			totalpage=dao.contentTotalPage(countryName);
		}
		model.addAttribute("totalpage", totalpage);
		int rowSize=9;
		int blockSize=3;
		int startPage=page-(page-1)%blockSize;//start page
		int endPage=startPage+blockSize-1;//end page
		if(endPage>totalpage){
			endPage=totalpage;//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십듸옙占쏙옙
		}
		int startContent = (page*rowSize)-(rowSize-1);//start content
		int endContent = page*rowSize;//end content 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏘떻占쏙옙 占쏙옙占쏙옙 확占쏙옙占십울옙
		
		List<MainContentVO> list = new ArrayList<MainContentVO>();
		Map map = new HashMap();
		if(countryName == null){//占쏙옙트占쏙옙占싱몌옙占쏙옙 占쏙옙占� 占쏙옙占�,
			map.put("start", startContent);
			map.put("end", endContent);
			list = dao.contentData(map);
		}else{//占쏙옙트占쏙옙占싱몌옙占쏙옙 占쌍댐옙 占쏙옙占�,
			map.put("start", startContent);
			map.put("end", endContent);
			map.put("countryName", countryName);
			list = dao.contentDataSearch(map);
		}
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "main/result";
	}
	
	
	/*@RequestMapping("/mypage")
	public String mypage_page(){
		return "mypage/mypage";
	}*/
	
	@RequestMapping("/login")
	public String login(){
		return "main/login";
	}
	
	/*@RequestMapping("/dayselect")
	public String dayselect(){
		return "plan/dayselect";
	}*/
	
	@RequestMapping("/cityselect")
	public String cityselect(){
		return "plan/cityselect";
	}
	
}