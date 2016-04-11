package com.ogpis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.DictionaryDao;
import com.ogpis.entity.Dictionary;

@Repository
public class DictionaryDaoImpl extends BaseDaoImpl<Dictionary, String>
		implements DictionaryDao {
	public String saveDictionary(Dictionary dictionary) {
		return save(dictionary);
	}

	@Override
	protected Class<Dictionary> getEntityClass() {
		return Dictionary.class;
	}

	@Override
	public List<Dictionary> getAllDictionaries() {
		return (List<Dictionary>) this.queryByHql("from Dictionary where deleted=false", null);
	}

	@Override
	public IPageList<Dictionary> getAllDcitonaries(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int first=(pageNo-1)*pageSize;
		List<Dictionary> items = this.queryByHql("from Dictionary where deleted=false order by createTime desc", null, first, pageSize);
		int count = Integer.parseInt(this.findUnique("select count(*) from Dictionary where deleted=false", null).toString());
		System.out.println("count: " + count);		
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

}
