package com.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@RequestMapping("/main")
	public String main_page(Model model){
		model.addAttribute("main_jsp", "/bus");
		return "main/main";
	}
	@RequestMapping("/bus")
	public String bus_page(){
		return "main/bus";
	}
	
	@RequestMapping("/main1")
	public String main1_page(){
		return "main/main1";
	}
	@RequestMapping("/content")
	public String main_content_section(){
		return "main/content";
	}
	
	@RequestMapping("/mypage")
	public String mypage_page(){
		return "mypage/mypage";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "main/login";
	}
	
	@RequestMapping("/dayselect")
	public String dayselect(){
		return "plan/dayselect";
	}
	
	@RequestMapping("/cityselect")
	public String cityselect(){
		return "plan/cityselect";
	}
	
}
