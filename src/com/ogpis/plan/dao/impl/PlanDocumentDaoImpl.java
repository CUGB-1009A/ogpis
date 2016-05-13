package com.ogpis.plan.dao.impl;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.plan.dao.PlanDocumentDao;
import com.ogpis.plan.entity.PlanDocument;

@Repository
public class PlanDocumentDaoImpl extends BaseDaoImpl<PlanDocument,String>implements PlanDocumentDao{

	@Override
	protected Class<PlanDocument> getEntityClass() {
		// TODO Auto-generated method stub
		return PlanDocument.class;
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		String temp="";
		System.out.println("enter the dao implement");
		for(int i=0;i<idList.size();i++)
		{
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "update PlanDocument as m set m.deleted=true , m.fatherNational=null where m.id in ("+temp+")";
		this.getHibernateTemplate().bulkUpdate(hql,null);
		
	}

}
