package com.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.NationalPlanDao;
import com.ogpis.plan.entity.NationalPlan;


@Repository
public class NationalPlanDaoImpl extends BaseDaoImpl<NationalPlan, String>
		implements NationalPlanDao {

	@Override
	protected Class<NationalPlan> getEntityClass() {
		// TODO Auto-generated method stub
		return NationalPlan.class;
	}

	@Override
	public IPageList<NationalPlan> getNationalPalns(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		int first = (pageNo - 1) * pageSize;
		@SuppressWarnings("unchecked")
		List<NationalPlan> items = this
				.queryByHql(
						"from NationalPlan where deleted=false order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from NationalPlan where deleted=false", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		// TODO Auto-generated method stub
		String temp="";
		System.out.println(idList.toString());
		for(int i=0;i<idList.size();i++)
		{
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "update NationalPlan as m set m.deleted=true where m.id in ("+temp+")";
		this.getHibernateTemplate().bulkUpdate(hql,null);
		
	}

}