package com.ogpis.international.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.international.dao.InternationalDao;
import com.ogpis.international.entity.International;
import com.ogpis.plan.entity.Plan_Index;

@Repository
public class InternationalDaoImpl extends BaseDaoImpl<International , String> implements InternationalDao {

	@Override
	protected Class<International> getEntityClass() {
		return International.class;
	}

	@Override
	public International findByCompanyName(String companyName) {
		String hql = "from International where deleted=false and companyName=?";
		International international = (International) this.findUnique(hql,companyName);
		return international;
	}
}
