package com.ogpis.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.entity.MenuItem;
import com.ogpis.entity.User;

@Repository
public class MenuItemDaoImpl extends BaseDaoImpl<MenuItem, String> implements
		MenuItemDao {

	@Override
	protected Class<MenuItem> getEntityClass() {
		return MenuItem.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * 进入菜单管理时，显示所有的一级菜单
	*/
	public List<MenuItem> findTopMenu() {
		return (List<MenuItem>) this.queryByHql("from MenuItem where deleted=false and father.id is null order by priority ASC",
				null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuItem> findByParentId(String id) {		
		String hql = "from MenuItem where deleted=false and father.id="+"\'"+id+"\'"+" order by priority ASC";
		return (List<MenuItem>) this.queryByHql(hql,
				null);
	}
}
