package com.ogpis.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.system.dao.DictionaryDao;
import com.ogpis.system.entity.Dictionary;

@Repository
public class DictionaryDaoImpl extends BaseDaoImpl<Dictionary, String>
		implements DictionaryDao {

	@Override
	protected Class<Dictionary> getEntityClass() {
		return Dictionary.class;
	}

}
