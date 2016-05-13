package com.ogpis.plan.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.plan.dao.PlanDocumentDao;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.service.PlanDocumentService;

@Service
public class PlanDocumentServiceImpl extends BaseServiceImpl<PlanDocument, String> 
implements PlanDocumentService{
	
	@Autowired
	protected void setPlanDocumentDao(PlanDocumentDao planDocument) {
		setBaseDao(planDocument);
	}

	protected PlanDocumentDao getPlanDocumentDao() {
		return (PlanDocumentDao) this.baseDao;
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		System.out.println("enter the service ");
		getPlanDocumentDao().updateAll(idList);
		
	}

}
