package com.ogpis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.entity.User;
import com.ogpis.service.UserService;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/user/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<User> users = userService.getAllUsers(pageNo, pageSize);
		model.addAttribute("users", users);
		return "user/list";
	}

	@RequestMapping(value = "/user/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, ModelMap model, String id) {
		User user = this.userService.findById(id);
		model.addAttribute("user", user);
		return "user/view";
	}

	@RequestMapping(value = "/user/add", method = RequestMethod.GET)
	public String add() {
		return "user/edit";
	}

	@RequestMapping(value = "/user/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		User user = this.userService.findById(id);
		model.addAttribute("user", user);
		return "user/edit";
	}

	@RequestMapping(value = "/user/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model, User user,
			String id, boolean isAdd) {
		User bean = null;
		if (isAdd) {
			bean = new User();
			bean.setPassword(user.getPassword());
		} else {
			bean = this.userService.findById(id);
		}
		bean.setLoginId(user.getLoginId());
		bean.setName(user.getName());
		if (isAdd) {
			userService.add(bean);
		} else {
			userService.update(bean);
		}
		return "redirect:list";
	}

	@RequestMapping(value = "/user/delete")
	public String delete(HttpServletRequest request, ModelMap model, String id) {
		System.out.println("delete");
		System.out.println("id: " + id);
		this.userService.batchMarkDelete(new String[] { id });
		return list(request, model);
	}

}
