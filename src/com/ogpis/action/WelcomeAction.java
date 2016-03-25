package com.ogpis.action;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.service.MenuItemService;

@Controller
public class WelcomeAction {
	
	@Autowired 
	MenuItemService menuItemService;
	

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
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		System.out.println("main_nav");
		return "main";
	}

	/**
	 * 准备导航栏数据：json格式
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping(value = "/menuPrepared", method = RequestMethod.POST)
	@ResponseBody
	public void menuPrepared(HttpServletResponse resp) throws IOException {
		String menuToJson = menuItemService.menuToJson();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(menuToJson);		
	}	
}
