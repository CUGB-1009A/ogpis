package com.ogpis.index.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.index.dao.IndexManagementDao;
import com.ogpis.index.entity.IndexManagement;
@Repository
public class IndexManagementDaoImpl extends BaseDaoImpl< IndexManagement,String> implements IndexManagementDao {

	@Override
	protected Class< IndexManagement> getEntityClass() {
		return  IndexManagement.class;
	}

	@Override
	public IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id) {
		
		int first = (pageNo - 1) * pageSize;
		List<IndexManagement> items = this
				.queryByHql(
						"from IndexManagement m where m.plan.id='"+id+"' order by createTime desc",
						null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from IndexManagement m where m.plan.id='"+id+"'", null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public List<IndexManagement> getOnePlanIndexs(String id) {
		
		List<IndexManagement> items = this
				.queryByHql(
						"from IndexManagement m where m.plan.id='"+id+"' order by createTime desc",null);
		return items;
	}
}