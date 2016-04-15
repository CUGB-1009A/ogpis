package com.ogpis.plan.service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.plan.entity.SinopecPlan;

public interface SinopecPlanService extends BaseService<SinopecPlan, String> {

	IPageList<SinopecPlan> getSinopeclPlans(int pageNo, int pageSize);

}
