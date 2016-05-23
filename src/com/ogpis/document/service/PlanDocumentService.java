package com.ogpis.document.service;

import java.util.ArrayList;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.document.entity.PlanDocument;

public interface PlanDocumentService extends BaseService<PlanDocument,String>{

	void updateAll(ArrayList<String> idList);

	IPageList<PlanDocument> getPlanDocuments(int pageNo, int pageSize);

	IPageList<PlanDocument> getDeletedDocuments(int pageNo, int pageSize);

	void removeAllDocument(ArrayList<String> idList);

}
