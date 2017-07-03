package com.tour.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tour.dao.MainContentDAO;
import com.tour.dao.MainContentVO;

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
	public String main_list(int page, Model model){ //����Ʈ���� ��Ż�� ���ÿ� ��ŸƮ�� end�� ��� �Ѵ�! 
		int totalpage=dao.contenttotalpage();
		model.addAttribute("totalpage", totalpage);
		int rowSize=9;
		int blockSize=3;
		int startPage=page-(page-1)%blockSize;//start page
		int endPage=startPage+blockSize-1;//end page
		if(endPage>totalpage){
			endPage=totalpage;//������ �������� �������� �ʵ���
		}
		
		int startContent = (page*rowSize)-(rowSize-1);//start content
		int endContent = page*rowSize;//end content ������ ������������ ��� ���� Ȯ���ʿ�
		
		Map map = new HashMap();
		map.put("start", startContent);
		map.put("end", endContent);
		List<MainContentVO> list = dao.contentData(map);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "main/list";
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