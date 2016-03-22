package com.ogpis.dao.impl;

import java.util.List;

import org.junit.Test;
import org.springframework.stereotype.Repository;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.entity.MenuItem;


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

	@Override
	public void updateAll(List<String> list) {
		// TODO Auto-generated method stub
		String temp="";
		for(int i=0;i<list.size();i++)
		{
			temp+=list.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "update MenuItem as m set m.deleted=true where m.id in ("+temp+")";
		this.getHibernateTemplate().bulkUpdate(hql,null);
	}

}
