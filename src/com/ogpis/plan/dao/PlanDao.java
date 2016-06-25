package com.ogpis.plan.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.Plan;


public interface PlanDao extends BaseDao<Plan, String>   {

	IPageList<Plan> getPlans(int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan> getAllPlans();

	List<Plan> getPlansByType(String type);

}
