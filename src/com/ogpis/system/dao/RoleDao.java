package com.ogpis.system.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.system.entity.Role;

public interface RoleDao extends BaseDao<Role, String> {

	public List<Role> getList();

}
