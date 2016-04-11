package com.ogpis.service;

import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.entity.Dictionary;

public interface DictionaryService extends BaseService<Dictionary, String> {

	public IPageList<Dictionary> getAllDictionaries(int pageNo, int pageSize);

	public List<Dictionary> getAllDictionaries();
	
	


}
