package com.ogpis.plan.service;

import java.util.ArrayList;

import com.ogpis.base.service.BaseService;
import com.ogpis.plan.entity.PlanDocument;

public interface PlanDocumentService extends BaseService<PlanDocument,String>{

	void updateAll(ArrayList<String> idList);

}
