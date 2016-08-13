package com.ogpis.international.dao;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.international.entity.International;

public interface InternationalDao extends BaseDao<International,String>{

	International findByCompanyName(String companyName);

}
