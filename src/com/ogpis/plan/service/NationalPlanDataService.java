package com.ogpis.plan.service;

import java.util.Date;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.plan.entity.NationalPlanData;

public interface NationalPlanDataService extends BaseService<NationalPlanData, String> {

	public NationalPlanData addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG);

	public IPageList<NationalPlanData> getNationalPlans(int pageNo, int pageSize);

}
