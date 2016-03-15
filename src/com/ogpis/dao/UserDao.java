package com.ogpis.dao;

import java.util.List;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.entity.User;

public interface UserDao extends BaseDao<User, String> {

	List<User> getAllUsers();

//	public String saveUser(User user);
//	
//	public User getUserById(String id);
//
//	public void deleteUser(String id);
}
