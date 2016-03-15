package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.DictionaryDao;
import com.ogpis.entity.Dictionary;
import com.ogpis.service.DictionaryService;

@Service
public class DictionaryServiceImpl extends BaseServiceImpl<Dictionary, String>
		implements DictionaryService {
	@Autowired
	protected void setDictionaryDao(DictionaryDao dictionaryDao) {
		setBaseDao(dictionaryDao);
	}
}
