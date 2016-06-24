package com.ogpis.plan.service;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.plan.entity.Plan;

public interface PlanService extends BaseService<Plan, String>{

	IPageList<Plan> getPlans(int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan> getAllPlans();

}
