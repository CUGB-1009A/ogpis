package com.ogpis.system.action;

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
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;

@Controller
public class RoleAction {

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/system/role/list")
	public String list(HttpServletRequest request, ModelMap model) {
		List<Role> roles = roleService.getList();
		model.addAttribute("roles", roles);
		return "system/role/list";
	}

	@RequestMapping(value = "/system/role/add", method = RequestMethod.GET)
	public String add() {
		return "system/role/edit";
	}

	@RequestMapping(value = "/system/role/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		Role role = this.roleService.findById(id);
		model.addAttribute("role", role);
		return "system/role/edit";
	}

	@RequestMapping(value = "/system/role/save", method = RequestMethod.GET)
	public String save(Role role, String[] perms, String id, boolean isAdd,
			HttpServletRequest request, ModelMap model) {
		Role bean = null;
		if (isAdd) {
			bean = new Role();
			// bean.setPassword(user.getPassword());
		} else {
			bean = this.roleService.findById(id);
		}
		bean.setName(role.getName());
		bean.setPriority(role.getPriority());
		bean.setIsSuper(role.getIsSuper());
		if (isAdd) {
			roleService.save(bean,Role.splitPerms(perms));
		} else {
			roleService.update(bean,Role.splitPerms(perms));
		}
		return "redirect:list";
	}

	@RequestMapping(value = "/system/role/delete")
	public String delete(HttpServletRequest request, ModelMap model, String id) {
		this.roleService.batchMarkDelete(new String[] { id });
		return list(request, model);
	}

}
