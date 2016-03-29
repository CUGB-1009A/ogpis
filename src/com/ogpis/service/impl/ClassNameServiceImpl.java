package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.ClassNameDao;
import com.ogpis.dao.UserDao;
import com.ogpis.entity.ClassName;
import com.ogpis.service.ClassNameService;

@Service
public class ClassNameServiceImpl extends BaseServiceImpl<ClassName, String>
		implements ClassNameService {

	@Autowired
	protected void setClassNameDao(ClassNameDao classNameDao) {
		setBaseDao(classNameDao);
	}

	protected ClassNameDao getClassNameDao() {
		return (ClassNameDao) this.baseDao;
	}

	@Override
	public ClassName findByClassName(String className) {
		return getClassNameDao().findByClassName(className);
	}

}
