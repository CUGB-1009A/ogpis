package com.ogpis.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.dao.OrganizationDao;
import com.ogpis.entity.MenuItem;
import com.ogpis.service.MenuItemService;

@Service
public class MenuItemServiceImpl extends BaseServiceImpl<MenuItem, String>
		implements MenuItemService {

	@Autowired
	protected void setMenuItemDao(MenuItemDao menuItemDao) {
		setBaseDao(menuItemDao);
	}
}
