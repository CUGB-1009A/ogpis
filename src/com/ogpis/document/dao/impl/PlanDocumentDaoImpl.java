package com.ogpis.document.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.document.dao.PlanDocumentDao;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.plan.entity.NationalPlan;


@Repository
public class PlanDocumentDaoImpl extends BaseDaoImpl<PlanDocument,String>implements PlanDocumentDao{

	@Override
	protected Class<PlanDocument> getEntityClass() {
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

	@Override
	public IPageList<PlanDocument> getPlanDocuments(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		@SuppressWarnings("unchecked")
		List<PlanDocument> items = this
				.queryByHql(
						"from PlanDocument where deleted=false order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from PlanDocument where deleted=false", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public IPageList<PlanDocument> getDeletedDocuments(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		@SuppressWarnings("unchecked")
		List<PlanDocument> items = this
				.queryByHql(
						"from PlanDocument where deleted=true order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from PlanDocument where deleted=true", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public void removeAllDocument(ArrayList<String> idList) {
		String temp="";
		for(int i=0;i<idList.size();i++)
		{
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "delete from PlanDocument m where m.id in ("+temp+")";
		this.getHibernateTemplate().bulkUpdate(hql,null);
		
	}

	@Override
	public IPageList<PlanDocument> getDocumentsByPlan(String selectCondition, String inputValue, String selectValue,
			int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		String hql="";
		String hqlCount="";
		if(selectCondition.equals("1"))
		{
			System.out.println("按规划查询的");
			hql = "from PlanDocument where deleted=false and fatherNational='"+selectValue+"' order by createTime desc";
			hqlCount = "select count(*) from PlanDocument where deleted=false and fatherNational='"+selectValue+"'";
		}
		if(selectCondition.equals("2"))
		{
			System.out.println("按文档名称查询的");
			hql = "from PlanDocument where deleted=false and documentName like '%"+inputValue+"%' order by createTime desc";
			hqlCount = "select count(*) from PlanDocument where deleted=false and documentName like '%"+inputValue+"%'";
		}
		@SuppressWarnings("unchecked")
		List<PlanDocument> items = this
				.queryByHql(hql,null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				hqlCount, null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

}