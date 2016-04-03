package com.ogpis.system.action;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class LoginAction {

	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String test() {
		System.out.println("index");
		return "index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String username, String password,HttpServletRequest request) {
		System.out.println("login");
		System.out.println("username:" + username);
		System.out.println("password:" + password);
    	return "main";
	
	}

}
