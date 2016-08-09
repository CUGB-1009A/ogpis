package com.ogpis.index.dao;

import java.util.List;
import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.index.entity.IndexManagement;

public interface IndexManagementDao extends BaseDao< IndexManagement,String> {

	IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id);

	List<IndexManagement> getOnePlanIndexs(String id);

	List<IndexManagement> findAll();

	List<IndexManagement> findAllIndexByPriority();

}
