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

	@Override
	public ClassName findByClassName(String className) {
		String hql = "from ClassName where className= ?";
		return (ClassName) this.findUnique(hql, className);
	}

	@Override
	public ClassName add(Class clazz) {
		ClassName className = new ClassName();
		className.setClassName(clazz.toString());
		String id = this.save(className);
		return this.findById(id);

	}
}
