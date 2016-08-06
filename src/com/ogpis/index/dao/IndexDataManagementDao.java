package com.ogpis.index.dao;

import java.util.Date;
import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.index.entity.IndexDataManagement;

public interface IndexDataManagementDao extends BaseDao<IndexDataManagement , String> {

	List<IndexDataManagement> findByIndexId(String indexId);

	List<IndexDataManagement> findByIndexId(String id, Date startTime, Date endTime);

	List<IndexDataManagement> findHistoryData(String id, Date startTime, int i);

}
