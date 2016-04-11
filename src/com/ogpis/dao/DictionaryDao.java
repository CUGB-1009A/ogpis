package com.ogpis.dao;

import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.Dictionary;

public interface DictionaryDao extends BaseDao<Dictionary, String> {

 public	List<Dictionary> getAllDictionaries();
 
 public IPageList<Dictionary> getAllDcitonaries(int pageNo,int pageSize);

}
