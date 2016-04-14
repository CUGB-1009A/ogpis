package com.ogpis.plan.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.NationalPlanDataDao;
import com.ogpis.plan.entity.NationalPlanData;
import com.ogpis.system.entity.User;

@Repository
public class NationalPlanDaoDataImpl extends BaseDaoImpl<NationalPlanData, String>
		implements NationalPlanDataDao {

	@Override
	protected Class<NationalPlanData> getEntityClass() {
		// TODO Auto-generated method stub
		return NationalPlanData.class;
	}

	@Override
	public NationalPlanData addNationalPlan(Date planPeriod, int planCode,
			String planName, double explore_oil, double explore_gas,
			double explore_CBM, double explore_SG, double production_oil,
			double production_gas, double production_CBM, double production_SG) {
		NationalPlanData newNationalPlan = new NationalPlanData();

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

	@Override
	public IPageList<NationalPlanData> getNationalPlans(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		List<NationalPlanData> items = this
				.queryByHql(
						"from NationalPlanData where deleted=false order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from NationalPlanData where deleted=false", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

}
