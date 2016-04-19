package com.ogpis.plan.dao.impl;

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

}
