package com.ogpis.plan.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.NationalPlanDao;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.system.entity.User;

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

	@Override
	public IPageList<NationalPlan> getNationalPlans(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		List<NationalPlan> items = this
				.queryByHql(
						"from NationalPlan where deleted=false order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from NationalPlan where deleted=false", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

}
