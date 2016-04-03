package com.ogpis.expando.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.expando.entity.ClassName;

public interface ClassNameService extends BaseService<ClassName, String> {

	public ClassName findByClassName(String className);
}
