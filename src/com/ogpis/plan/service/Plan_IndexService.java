package com.ogpis.plan.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;

public interface Plan_IndexService extends BaseService<Plan_Index, String>{

	Plan_Index add(Plan plan, IndexManagement index, float targetValue);

	Plan_Index findByP_I(String planId, String indexId);

}
