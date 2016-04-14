package com.ogpis.plan.dao;

import java.util.Date;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.NationalPlanData;

public interface NationalPlanDataDao extends BaseDao<NationalPlanData, String> {

	public NationalPlanData addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG);

	public IPageList<NationalPlanData> getNationalPlans(int pageNo, int pageSize);

}
