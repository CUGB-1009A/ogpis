package com.ogpis.system.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String login(String username, String password,ModelMap model,
			HttpServletRequest request) {
		System.out.println("login");
		System.out.println("username:" + username);
		System.out.println("password:" + password);
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
		// 登录后存放进shiro token
		UsernamePasswordToken token = new UsernamePasswordToken(
				username, password);
		try {
			System.out.println("login");
			Subject subject = SecurityUtils.getSubject();
			subject.login(token);
			request.getSession().setAttribute("username", token.getUsername());
			return "main";
		} catch (AuthenticationException e) {
			e.printStackTrace();
			model.addAttribute("isSuccess", "0");
			return "index";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(String username, String password,ModelMap model,
			HttpServletRequest request) {
		System.out.println("logout");
		SecurityUtils.getSecurityManager().logout(SecurityUtils.getSubject());
			return "index";
		}
}
