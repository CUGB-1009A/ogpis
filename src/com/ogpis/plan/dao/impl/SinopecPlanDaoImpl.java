package com.ogpis.plan.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.SinopecPlanDao;
import com.ogpis.plan.entity.SinopecPlan;

@Repository
public class SinopecPlanDaoImpl extends BaseDaoImpl<SinopecPlan, String>
		implements SinopecPlanDao {

	@Override
	protected Class<SinopecPlan> getEntityClass() {
		// TODO Auto-generated method stub
		return SinopecPlan.class;
	}

}
