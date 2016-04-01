package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.entity.MenuItem;
import com.ogpis.entity.User;
import com.ogpis.service.MenuItemService;

@Service
public class MenuItemServiceImpl extends BaseServiceImpl<MenuItem, String>
		implements MenuItemService {
	
	@Autowired
	private MenuItemDao MenuItemDao;


	@Autowired
	protected void setMenuItemDao(MenuItemDao menuItemDao) {
		setBaseDao(menuItemDao);
	}

	@Override
	public List<MenuItem> findTopMenu() {
		return MenuItemDao.findTopMenu();
	}

	@Override
	public List<MenuItem> findByParentId(String id) {
		// TODO Auto-generated method stub
		return MenuItemDao.findByParentId(id);
	}
	

	@Override
	public void updateAll(List<String> list) {
		// TODO Auto-generated method stub
		MenuItemDao.updateAll(list);
	}
	
	@Override
	public String menuToJson() {
		return MenuItemDao.menuToJson();
	}

	@Override
	public IPageList<MenuItem> getByParentId(String id, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return (IPageList<MenuItem> ) MenuItemDao.getByParentId(id,pageNo,pageSize);
	}
}
