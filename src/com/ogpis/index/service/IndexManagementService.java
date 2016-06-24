package com.ogpis.index.service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.index.entity.IndexManagement;

public interface IndexManagementService extends BaseService<IndexManagement,String>{

	IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id);

}
