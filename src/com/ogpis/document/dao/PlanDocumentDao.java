package com.ogpis.document.dao;

import java.util.ArrayList;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.document.entity.PlanDocument;

public interface PlanDocumentDao extends BaseDao<PlanDocument,String> {

	void updateAll(ArrayList<String> idList);

	IPageList<PlanDocument> getPlanDocuments(int pageNo, int pageSize);

	IPageList<PlanDocument> getDeletedDocuments(int pageNo, int pageSize);

	void removeAllDocument(ArrayList<String> idList);

	IPageList<PlanDocument> getDocumentsByPlan(String selectCondition, String inputValue, String selectValue,
			int pageNo, int pageSize);

	IPageList<PlanDocument> getDocumentsByPlan(String condition, int pageNo, int pageSize);

}
