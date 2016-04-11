package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.paging.IPageList;
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

	@Override
	public IPageList<Dictionary> getAllDictionaries(int pageNo, int pageSize) {
		return (IPageList<Dictionary> ) getDictionaryDao().getAllDcitonaries(pageNo, pageSize);
	}

	protected DictionaryDao getDictionaryDao()
	{
		return (DictionaryDao)this.baseDao;		
	}

	@Override
	public List<Dictionary> getAllDictionaries() {
		return (List<Dictionary>)getDictionaryDao().getAllDictionaries();
	}
}

