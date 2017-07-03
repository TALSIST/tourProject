package com.tour.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void login(){}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void signup(){}
	
	@RequestMapping(value="/uploadData", method=RequestMethod.GET)
	public void uploadData(){}
	
	@RequestMapping(value="/dataCheck", method=RequestMethod.GET)
	public void dataCheck(){}
}
