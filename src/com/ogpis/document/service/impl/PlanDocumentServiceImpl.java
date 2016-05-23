package com.ogpis.document.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.document.dao.PlanDocumentDao;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.document.service.PlanDocumentService;

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
		getPlanDocumentDao().updateAll(idList);
		
	}

	@Override
	public IPageList<PlanDocument> getPlanDocuments(int pageNo, int pageSize) {
		return getPlanDocumentDao().getPlanDocuments(pageNo, pageSize);
	}

	@Override
	public IPageList<PlanDocument> getDeletedDocuments(int pageNo, int pageSize) {
		return getPlanDocumentDao().getDeletedDocuments(pageNo, pageSize);
	}

	@Override
	public void removeAllDocument(ArrayList<String> idList) {
		getPlanDocumentDao().removeAllDocument(idList);

		
	}

}
