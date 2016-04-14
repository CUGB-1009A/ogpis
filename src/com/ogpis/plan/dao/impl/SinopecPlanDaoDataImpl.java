package com.ogpis.plan.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.SinopecPlanDataDao;
import com.ogpis.plan.entity.SinopecPlanData;

@Repository
public class SinopecPlanDaoDataImpl extends BaseDaoImpl<SinopecPlanData, String>
		implements SinopecPlanDataDao {

	@Override
	protected Class<SinopecPlanData> getEntityClass() {
		// TODO Auto-generated method stub
		return SinopecPlanData.class;
	}

}
