package com.ogpis.plan.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.NationalPlanDataDao;
import com.ogpis.plan.entity.NationalPlanData;
import com.ogpis.plan.service.NationalPlanDataService;

@Service
public class NationalPlanDataServiceImpl extends
		BaseServiceImpl<NationalPlanData, String> implements NationalPlanDataService {

	@Autowired
	protected void setNationalPlanDao(NationalPlanDataDao nationalPlanDao) {
		setBaseDao(nationalPlanDao);
	}

	protected NationalPlanDataDao getNationalPlanDao() {
		return (NationalPlanDataDao) this.baseDao;
	}

	@Override
	public NationalPlanData addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG) {

		return getNationalPlanDao().addNationalPlan(planPeriod, planCode,
				planName, explore_oil, explore_gas, explore_CBM, explore_SG,
				production_oil, production_gas, production_CBM, production_SG);
	}

	@Override
	public IPageList<NationalPlanData> getNationalPlans(int pageNo, int pageSize) {
		return getNationalPlanDao().getNationalPlans(pageNo, pageSize);
	}

}
