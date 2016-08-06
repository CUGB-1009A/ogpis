package com.ogpis.index.service;

import java.util.Date;
import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.index.entity.IndexDataManagement;

public interface IndexDataManagementService extends BaseService<IndexDataManagement,String>{

	List<IndexDataManagement> findByIndexId(String indexId);

	List<IndexDataManagement> sumTheIndex(String id, Date startTime, Date endTime);

	List<IndexDataManagement> findHistoryData(String id, Date startTime, int i);


}
