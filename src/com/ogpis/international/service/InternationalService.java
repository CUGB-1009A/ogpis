package com.ogpis.international.service;

import com.ogpis.base.service.BaseService;
import com.ogpis.international.entity.International;

public interface InternationalService extends BaseService<International,String>{

	International findByCompanyName(String companyName);

}
