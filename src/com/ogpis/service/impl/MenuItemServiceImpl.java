package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.dao.OrganizationDao;
import com.ogpis.entity.MenuItem;
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
}
