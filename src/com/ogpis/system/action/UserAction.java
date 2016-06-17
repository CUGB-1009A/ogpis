package com.ogpis.system.action;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;
import com.ogpis.system.service.UserService;

@Controller
public class UserAction {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;

	@RequiresPermissions(value={"user:list"})
	@RequestMapping(value = "/system/user/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<User> users = userService.getAllUsers(pageNo, pageSize);
		model.addAttribute("users", users);
		return "system/user/list";
	}

	@RequiresPermissions(value={"user:view"})
	@RequestMapping(value = "/system/user/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, ModelMap model, String id) {
		User user = this.userService.findById(id);
		model.addAttribute("user", user);
		return "system/user/view";
	}

	@RequiresPermissions(value={"user:add"})
	@RequestMapping(value = "/system/user/add", method = RequestMethod.GET)
	public String add() {
		return "system/user/edit";
	}

	@RequiresPermissions(value={"user:edit"})
	@RequestMapping(value = "/system/user/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		User user = this.userService.findById(id);
		List<Role> roleList = roleService.getList();
		Set<Role> userRoleList = user.getRoles();
		model.addAttribute("user", user);
		model.addAttribute("roleList", roleList);
		model.addAttribute("userRoleList", userRoleList);
		return "system/user/edit";
	}

	@RequiresPermissions(value={"user:add","user:edit"},logical=Logical.OR)
	@RequestMapping(value = "/system/user/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model, User user,
			String id, String[] roleIds, boolean isAdd) {
		User bean = null;
		if (isAdd) {
			bean = new User();
			bean.setPassword(user.getPassword());
		} else {
			bean = this.userService.findById(id);
		}
		bean.setLoginId(user.getLoginId());
		bean.setName(user.getName());
		// 更新角色
		bean.getRoles().clear();// 先清空角色
		if (roleIds != null) {
			for (String rid : roleIds) {
				System.out.println("rid: "+rid);
				bean.addToRoles(roleService.findById(rid));
			}
		}

		if (isAdd) {
			userService.save(bean);
		} else {
			userService.update(bean);
		}
		return "redirect:list";
	}

	@RequiresPermissions(value={"user:delete"})
	@RequestMapping(value = "/system/user/delete")
	public String delete(HttpServletRequest request, ModelMap model, String id) {
		System.out.println("delete");
		System.out.println("id: " + id);
		this.userService.batchMarkDelete(new String[] { id });
		return list(request, model);
	}

}
