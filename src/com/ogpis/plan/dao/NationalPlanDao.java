package com.ogpis.plan.dao;

import java.util.Date;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.NationalPlan;

public interface NationalPlanDao extends BaseDao<NationalPlan, String> {

	public NationalPlan addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG);

}
