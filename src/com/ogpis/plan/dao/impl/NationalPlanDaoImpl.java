package com.ogpis.plan.dao.impl;

import java.util.Date;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.NationalPlanDao;
import com.ogpis.plan.entity.NationalPlan;

@Repository
public class NationalPlanDaoImpl extends BaseDaoImpl<NationalPlan, String>
		implements NationalPlanDao {

	@Override
	protected Class<NationalPlan> getEntityClass() {
		// TODO Auto-generated method stub
		return NationalPlan.class;
	}

	@Override
	public NationalPlan addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG) {
		NationalPlan newNationalPlan = new NationalPlan();

		newNationalPlan.setPlanPeriod(planPeriod);
		newNationalPlan.setPlanCode(planCode);
		newNationalPlan.setPlanName(planName);
		newNationalPlan.setExplore_oil(explore_oil);
		newNationalPlan.setExplore_gas(explore_gas);
		newNationalPlan.setExplore_CBM(explore_CBM);
		newNationalPlan.setExplore_SG(explore_SG);
		newNationalPlan.setProduction_oil(production_oil);
		newNationalPlan.setProduction_gas(production_gas);
		newNationalPlan.setProduction_CBM(production_CBM);
		newNationalPlan.setProduction_SG(production_SG);
		this.save(newNationalPlan);
		return newNationalPlan;
	}

}
