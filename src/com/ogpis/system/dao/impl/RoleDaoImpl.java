package com.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.system.dao.RoleDao;
import com.ogpis.system.entity.Role;

@Repository
public class RoleDaoImpl extends BaseDaoImpl<Role, String> implements RoleDao {

	@Override
	@SuppressWarnings("unchecked")
	public List<Role> getList() {
		return (List<Role>) this.queryByHql("from Role where deleted=false",
				null);
	}

	@Override
	protected Class<Role> getEntityClass() {
		return Role.class;
	}
}
