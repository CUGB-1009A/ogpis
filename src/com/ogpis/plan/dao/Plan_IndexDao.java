package com.ogpis.plan.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;

public interface Plan_IndexDao extends BaseDao<Plan_Index, String> {

	Plan_Index add(Plan plan, IndexManagement index, float targetValue);

	Plan_Index findByP_I(String planId, String indexId);

	void batchAdd(Plan tempPlan, List<IndexManagement> indexs, float[] target);

}
