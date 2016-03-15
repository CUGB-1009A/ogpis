package com.ogpis.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WelcomeAction {

	@RequestMapping(value = "/main_center", method = RequestMethod.GET)
	public String main_center() {
		System.out.println("main_center");

		return "main/main_center";
	}

	@RequestMapping(value = "/main_header", method = RequestMethod.GET)
	public String main_left() {
		System.out.println("main_header");

		return "main/main_header";
	}
	
	@RequestMapping(value = "/main_nav", method = RequestMethod.GET)
	public String main_nav() {
		System.out.println("main_nav");

		return "main/main_nav";
	}
}
