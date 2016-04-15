package com.ogpis.plan.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.SinopecPlanDao;
import com.ogpis.plan.entity.SinopecPlan;

@Repository
public class SinopecPlanDaoImpl extends BaseDaoImpl<SinopecPlan, String>
		implements SinopecPlanDao {

	@Override
	protected Class<SinopecPlan> getEntityClass() {
		// TODO Auto-generated method stub
		return SinopecPlan.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	public IPageList<SinopecPlan> getSinopecPlans(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int first = (pageNo - 1) * pageSize;
		List<SinopecPlan> items = this
				.queryByHql(
						"from SinopecPlan where deleted=false order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from SinopecPlan where deleted=false", null)
				.toString());
		System.out.println("=============="+count);
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	
	}
	
	

}
