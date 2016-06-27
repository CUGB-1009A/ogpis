package com.ogpis.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.index.dao.IndexDataManagementDao;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.index.service.IndexDataManagementService;

@Service
public class IndexDataManagementServiceImpl extends BaseServiceImpl<IndexDataManagement, String> implements IndexDataManagementService{

	@Autowired
	protected void setIndexDataManagementDao(IndexDataManagementDao indexDataManagement) {
		setBaseDao(indexDataManagement);
	}

	protected IndexDataManagementDao getIndexDataManagementDao() {
		return (IndexDataManagementDao) this.baseDao;
	}

	@Override
	public List<IndexDataManagement> findByIndexId(String indexId) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findByIndexId(indexId);
	}
}
