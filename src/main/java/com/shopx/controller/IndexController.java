package com.shopx.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping(value = {"","/","/home"})
	public String Index() {
		return "index";
	}
	
	@RequestMapping("/aboutus")
	public String Aboutus() { 
		return "aboutus";
	}
	
	@RequestMapping("/contactus")
	public String Contactus() {
		return "contactus";
	}
	
	@RequestMapping("/emptyPage")
	public String EmptyPage() {
		return "EmptyPage";
	}
}
