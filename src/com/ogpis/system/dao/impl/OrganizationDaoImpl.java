package com.ogpis.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.system.dao.OrganizationDao;
import com.ogpis.system.entity.Organization;

@Repository
public class OrganizationDaoImpl extends BaseDaoImpl<Organization, String>
		implements OrganizationDao {

	@Override
	protected Class<Organization> getEntityClass() {
		return Organization.class;
	}
}
