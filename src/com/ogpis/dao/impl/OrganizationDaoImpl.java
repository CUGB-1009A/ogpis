package com.ogpis.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.OrganizationDao;
import com.ogpis.entity.Organization;

@Repository
public class OrganizationDaoImpl extends BaseDaoImpl<Organization, String>
		implements OrganizationDao {

	@Override
	protected Class<Organization> getEntityClass() {
		return Organization.class;
	}
}
