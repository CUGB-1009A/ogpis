package com.ogpis.plan.dao;

import java.util.ArrayList;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.plan.entity.PlanDocument;

public interface PlanDocumentDao extends BaseDao<PlanDocument,String> {

	void updateAll(ArrayList<String> idList);

}
