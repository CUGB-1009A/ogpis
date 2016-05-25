package com.ogpis.plan.service;

import java.util.ArrayList;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.plan.entity.NationalPlan;

public interface NationalPlanService extends BaseService<NationalPlan, String>{

	IPageList<NationalPlan> getNationalPlans(int pageNo, int pageSize);

	void updateAll(ArrayList<String> idList);

	IPageList<NationalPlan> getNationalPlansByCondition(String condition,int pageNo, int pageSize);

}
