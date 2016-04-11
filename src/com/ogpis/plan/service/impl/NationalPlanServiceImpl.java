package com.ogpis.plan.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.NationalPlanDao;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.service.NationalPlanService;

@Service
public class NationalPlanServiceImpl extends
		BaseServiceImpl<NationalPlan, String> implements NationalPlanService {

	@Autowired
	protected void setNationalPlanDao(NationalPlanDao nationalPlanDao) {
		setBaseDao(nationalPlanDao);
	}

	protected NationalPlanDao getNationalPlanDao() {
		return (NationalPlanDao) this.baseDao;
	}

	@Override
	public NationalPlan addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG) {

		return getNationalPlanDao().addNationalPlan(planPeriod, planCode,
				planName, explore_oil, explore_gas, explore_CBM, explore_SG,
				production_oil, production_gas, production_CBM, production_SG);
	}

	@Override
	public IPageList<NationalPlan> getNationalPlans(int pageNo, int pageSize) {
		return getNationalPlanDao().getNationalPlans(pageNo, pageSize);
	}

}
