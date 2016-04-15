package com.ogpis.plan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.SinopecPlanDao;
import com.ogpis.plan.entity.SinopecPlan;
import com.ogpis.plan.service.SinopecPlanService;

@Service
public class SinopecPlanServiceImpl extends BaseServiceImpl<SinopecPlan, String>
		implements SinopecPlanService {

	@Autowired
	protected void setSinopecPlanDao(SinopecPlanDao sinopecPlanDao) {
		setBaseDao(sinopecPlanDao);
	}

	protected SinopecPlanDao getSinopecPlanDao() {
		return (SinopecPlanDao) this.baseDao;
	}

	@Override
	public IPageList<SinopecPlan> getSinopeclPlans(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return getSinopecPlanDao().getSinopecPlans(pageNo,pageSize);
	}
}
