package com.ogpis.plan.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.SinopecPlanDataDao;
import com.ogpis.plan.entity.SinopecPlanData;
import com.ogpis.plan.service.SinopecPlanDataService;

@Service
public class SinopecPlanDataServiceImpl extends BaseServiceImpl<SinopecPlanData, String>
		implements SinopecPlanDataService {

	@Autowired
	protected void setSinopecPlanDao(SinopecPlanDataDao sinopecPlanDao) {
		setBaseDao(sinopecPlanDao);
	}

	protected SinopecPlanDataDao getSinopecPlanDao() {
		return (SinopecPlanDataDao) this.baseDao;
	}
}
