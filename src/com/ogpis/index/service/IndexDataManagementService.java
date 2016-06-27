package com.ogpis.index.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.index.entity.IndexDataManagement;

public interface IndexDataManagementService extends BaseService<IndexDataManagement,String>{

	List<IndexDataManagement> findByIndexId(String indexId);

}
