package com.ogpis.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.document.entity.PlanDocument;
import com.ogpis.plan.entity.Plan;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.MenuItemService;
import com.ogpis.system.service.UserService;

@Controller
public class WelcomeAction {
	
	@Autowired 
	MenuItemService menuItemService;
	@Autowired
	UserService userService;
	

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
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletResponse resppose,HttpServletRequest request,ModelMap model) {
		HashMap map ;
		List<HashMap> mapList = new ArrayList<HashMap>();
		String currentUserName = request.getUserPrincipal().getName();
	  	User user = userService.findByUserName(currentUserName);	
	  	Set<Plan> planConcern = user.getPlans();
	  	model.addAttribute("plansNumber",planConcern.size());
	  	for(Plan temp:planConcern)
		{
			map = new HashMap();
			map.put(temp, true);
			Set<PlanDocument> document = temp.getPlanDocument();
			map.put("12", document);
			mapList.add(map);
		}
		model.addAttribute("mapList", mapList);//返回规划
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
