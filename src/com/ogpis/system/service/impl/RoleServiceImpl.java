package com.ogpis.system.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.system.dao.RoleDao;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;
import com.ogpis.system.service.UserService;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, String> implements
		RoleService {

	@Autowired
	protected void setUserDao(RoleDao roleDao) {
		setBaseDao(roleDao);
	}

	protected RoleDao getRoleDao() {
		return (RoleDao) this.baseDao;
	}
	
	@Override
	public Role save(Role role,Set<String> perms){
		role.setPerms(perms);
		this.getRoleDao().save(role);
		return role;
	}

	@Override
	public List<Role> getList() {
		return (List<Role>) getRoleDao().getList();
	}

	@Override
	public void deleteMembers(Role role, String[] userIds) {
		if (userIds != null) {
			User user;
			for (String uid : userIds) {
				user = userService.findById(uid);
				role.deleteFromUsers(user);
			}
		}
		System.out.println(role.getUsers().size());
		getRoleDao().update(role);
	}

	@Autowired
	private UserService userService;

}