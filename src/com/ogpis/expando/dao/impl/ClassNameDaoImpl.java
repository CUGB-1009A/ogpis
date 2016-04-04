package com.ogpis.expando.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.expando.dao.ClassNameDao;
import com.ogpis.expando.entity.ClassName;

@Repository
public class ClassNameDaoImpl extends BaseDaoImpl<ClassName, String> implements
		ClassNameDao {

	@Override
	protected Class<ClassName> getEntityClass() {
		return ClassName.class;
	}

	@Override
	public ClassName findByClassName(String className) {
		String hql = "from ClassName where className= ?";
		return (ClassName) this.findUnique(hql, className);
	}

	@Override
	public ClassName addClassName(String className) {
		ClassName newClassName = new ClassName();
		newClassName.setClassName(className);
		this.save(newClassName);
		return newClassName;

	}
}
