package com.ogpis.plan.dao;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.SinopecPlan;

public interface SinopecPlanDao  extends BaseDao<SinopecPlan, String>{

	IPageList<SinopecPlan> getSinopecPlans(int pageNo, int pageSize);

}
