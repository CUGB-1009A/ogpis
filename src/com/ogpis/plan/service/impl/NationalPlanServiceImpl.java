package com.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.NationalPlanDao;

import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.service.NationalPlanService;

@Service
public class NationalPlanServiceImpl extends BaseServiceImpl<NationalPlan, String> 
		implements NationalPlanService{
	
	@Autowired
	protected void setNationalPlanDao(NationalPlanDao nationalPlanDao) {
		setBaseDao(nationalPlanDao);
	}

	protected NationalPlanDao getNationalPlanDao() {
		return (NationalPlanDao) this.baseDao;
	}

	@Override
	public IPageList<NationalPlan> getNationalPlans(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return getNationalPlanDao().getNationalPalns(pageNo,pageSize);
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		// TODO Auto-generated method stub
		getNationalPlanDao().updateAll(idList);
		
	}

	@Override
	public IPageList<NationalPlan> getNationalPlansByCondition(String condition,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		 return getNationalPlanDao().getNationalPlansByCondition(condition,pageNo,pageSize);
	}

	@Override
	public List<NationalPlan> getAllPlans() {
		// TODO Auto-generated method stub
		return getNationalPlanDao().getAllPlans();
	}

}
