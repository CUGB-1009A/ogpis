package com.ogpis.index.service;

import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.index.entity.IndexManagement;

public interface IndexManagementService extends BaseService<IndexManagement,String>{

	IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id);

	List<IndexManagement> getOnePlanIndexs(String id);

	List<IndexManagement> findAll();

	List<IndexManagement> findAllIndexByPriority(String type);

	List<IndexManagement> findByMineType(String mineType);

	List<IndexManagement> findByIds(String[] ids);

}
