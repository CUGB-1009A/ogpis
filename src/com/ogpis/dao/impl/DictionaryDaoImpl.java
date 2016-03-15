package com.ogpis.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.DictionaryDao;
import com.ogpis.entity.Dictionary;

@Repository
public class DictionaryDaoImpl extends BaseDaoImpl<Dictionary, String>
		implements DictionaryDao {

	@Override
	protected Class<Dictionary> getEntityClass() {
		return Dictionary.class;
	}

}
