package com.ogpis.service;

import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.service.BaseService;
import com.ogpis.entity.User;

public interface UserService extends BaseService<User, String> {
	//
	// public String addUser(User user);
	//
	// public void deleteUser(String id);
	//
	// public User getUserById(String id);

	public List<User> getAllUsers();

	public IPageList<User> getAllUsers(int pageNo, int pageSize);
}
