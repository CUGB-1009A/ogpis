package com.ogpis.system.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.system.entity.Role;

public interface RoleService extends BaseService<Role, String> {
	
	/**
	 * 获得角色列表
	 * @return
	 */
	public List<Role> getList();

	/**
	 * 删除角色中的成员
	 * @param role 角色
	 * @param userIds 要删除的成员id
	 */
	public void deleteMembers(Role role, String[] userIds);

}
