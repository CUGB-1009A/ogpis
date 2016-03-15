package com.ogpis.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.entity.User;
import com.ogpis.service.UserService;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user/list", method = RequestMethod.GET)
	public String list(ModelMap model) {
		List<User> users = userService.getAllUsers();
		System.out.println("users.size()" + users.size());
		model.addAttribute("users", users);
		return "user/list";
	}
	
	@RequestMapping(value = "/user/add", method = RequestMethod.GET)
	public String add(){
		return "user/add";
	}
	

	@RequestMapping(value = "/user/save", method = RequestMethod.GET)
	public String save(){
		System.out.println("save");
		return "user/list";
	}
}
