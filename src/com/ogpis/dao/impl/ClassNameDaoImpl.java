package com.ogpis.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.ClassNameDao;
import com.ogpis.entity.ClassName;

@Repository
public class ClassNameDaoImpl extends BaseDaoImpl<ClassName, String> implements
		ClassNameDao {

	@Override
	protected Class<ClassName> getEntityClass() {
		return ClassName.class;
	}

}
