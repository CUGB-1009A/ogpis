package com.ogpis.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.entity.User;
import com.ogpis.service.UserService;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user/list")
	public String list(ModelMap model) {
		// List<User> users = userService.getAllUsers();
		IPageList<User> users = userService.getAllUsers(1, 10);
		// System.out.println("users.size()" + users.size());
		model.addAttribute("users", users);
		return "user/listTest";
	}

	@RequestMapping(value = "/user/add", method = RequestMethod.GET)
	public String add() {
		// 用户管理提交测试
		// 用户管理提交测试2
		return "user/add";
	}

	@RequestMapping(value = "/user/save", method = RequestMethod.GET)
	public String save(String loginId, String username, String password) {
		System.out.println("save");
		System.out.println("loginId: " + loginId + " username: " + username + "password: " + password);
		User user = new User();
		user.setLoginId(loginId);
		user.setName(username);
		user.setPassword(password);
		userService.add(user);
		return "redirect:list";
	}

	@RequestMapping(value = "/user/del")
	public String delete(String id, ModelMap model) {
		System.out.println("delete");
		System.out.println("id: " + id);
		this.userService.batchMarkDelete(new String[] { id });
		return list(model);
	}

}
