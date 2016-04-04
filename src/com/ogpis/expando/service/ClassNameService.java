package com.ogpis.expando.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ClassName;

public interface ClassNameService extends BaseService<ClassName, String> {

	/**
	 * 根据类名查找ClassName对象,如果没有找到则新建一个
	 * @param className
	 * @return
	 */
	public ClassName findByClassName(String className);
}
