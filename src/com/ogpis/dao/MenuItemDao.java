package com.ogpis.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.MenuItem;

public interface MenuItemDao extends BaseDao<MenuItem, String> {

	List<MenuItem> findTopMenu();

	List<MenuItem> findByParentId(String id);

	void updateAll(List<String> list);
}
