package com.ogpis.index.dao;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.index.entity.IndexManagement;

public interface IndexManagementDao extends BaseDao< IndexManagement,String> {

	IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id);

}
