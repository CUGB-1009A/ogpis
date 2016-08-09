package com.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.dao.Plan_IndexDao;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;
import com.ogpis.plan.service.Plan_IndexService;

@Service
public class Plan_IndexServiceImpl extends BaseServiceImpl<Plan_Index, String>
		implements Plan_IndexService {

	@Autowired
	protected void setPlan_IndexDao(Plan_IndexDao plan_IndexDao) {
		setBaseDao(plan_IndexDao);
	}

	protected Plan_IndexDao getPlan_IndexDao() {
		return (Plan_IndexDao) this.baseDao;
	}

	@Override
	public Plan_Index add(Plan plan, IndexManagement index, float targetValue) {
		return getPlan_IndexDao().add(plan, index, targetValue);
	}

	@Override
	public Plan_Index findByP_I(String planId, String indexId) {
		return getPlan_IndexDao().findByP_I(planId, indexId);
	}

	@Override
	public void batchAdd(Plan plan, List<IndexManagement> indexs) {
		List<IndexManagement> addIndexs = new ArrayList<IndexManagement>();
		List<IndexManagement> deleteIndexs = new ArrayList<IndexManagement>();
		for (IndexManagement index : indexs) {
			if (!plan.getIndexIds().contains(index.getId())) {
				addIndexs.add(index);
			}
		}
		getPlan_IndexDao().batchAdd(plan, addIndexs);
	}
}
