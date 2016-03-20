package com.ogpis.service;

import java.util.List;

import com.ogpis.base.service.BaseService;
import com.ogpis.entity.MenuItem;

public interface MenuItemService extends BaseService<MenuItem, String> {

	List<MenuItem> findTopMenu();

	List<MenuItem> findByParentId(String id);

}
