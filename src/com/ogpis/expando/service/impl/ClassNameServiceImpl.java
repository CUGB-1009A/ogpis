package com.ogpis.expando.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.expando.dao.ClassNameDao;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.system.dao.UserDao;

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
		ClassName cn = getClassNameDao().findByClassName(className);
		// 如果没有找到对应的ClassName 则新建一个，保证每个类都有对应的ClassName
		if (cn == null) {
			getClassNameDao().addClassName(className);
		}
		return cn;
	}
}
