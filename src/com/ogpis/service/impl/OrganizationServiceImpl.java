package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.OrganizationDao;
import com.ogpis.entity.Organization;
import com.ogpis.entity.User;
import com.ogpis.service.OrganizationService;

@Service
public class OrganizationServiceImpl extends BaseServiceImpl<Organization, String> implements OrganizationService {

	@Autowired
	protected void setOrganizationDao(OrganizationDao organizationDao) {
		setBaseDao(organizationDao);
	}

}
