package com.ogpis.plan.dao;

import java.util.ArrayList;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.entity.NationalPlanData;


public interface NationalPlanDao extends BaseDao<NationalPlan, String>   {

	IPageList<NationalPlan> getNationalPalns(int pageNo, int pageSize);

	void updateAll(ArrayList<String> idList);

}
