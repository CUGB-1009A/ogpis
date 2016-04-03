package com.ogpis.system.dao;

import java.util.List;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.dao.BaseDao;
import com.ogpis.system.entity.User;

public interface UserDao extends BaseDao<User, String> {

	public List<User> getAllUsers();

	public IPageList<User> getAllUsers(int pageNo, int pageSize);

//	public String saveUser(User user);
//	
//	public User getUserById(String id);
//
//	public void deleteUser(String id);
}
