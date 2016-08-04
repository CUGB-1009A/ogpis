package com.ogpis.index.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.index.dao.IndexDataManagementDao;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.plan.entity.Plan;

@Repository
public class IndexDataManagementDaoImpl extends BaseDaoImpl<IndexDataManagement,String> implements IndexDataManagementDao{

	@Override
	protected Class< IndexDataManagement> getEntityClass() {
		return  IndexDataManagement.class;
	}

	@Override
	public List<IndexDataManagement> findByIndexId(String indexId) {
		@SuppressWarnings("unchecked") 
		List<IndexDataManagement> items = this 
 				.queryByHql( 
 						"from IndexDataManagement where deleted=false and index.id='"+indexId+"' order by collectedTime asc", 
 						null); 
		return items; 
	}

	@Override
	public List<IndexDataManagement> findByIndexId(String id, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked") 
		List<IndexDataManagement> items = this 
 				.queryByHql( 
 						"from IndexDataManagement where deleted=false and index.id='"+id+"' and collectedTime between '"+startTime+"' and '"+endTime+"' order by collectedTime", 
 						null); 
		return items;
	}
}
