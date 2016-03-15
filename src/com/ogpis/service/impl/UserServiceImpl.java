package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.UserDao;
import com.ogpis.entity.User;
import com.ogpis.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User, String> implements
		UserService {
	@Autowired
	protected void setUserDao(UserDao userDao) {
		setBaseDao(userDao);
	}

	protected UserDao getUserDao() {
		return (UserDao) this.baseDao;
	}

	@Override
	public List<User> getAllUsers() {
		return (List<User>) getUserDao().getAllUsers();
	}
}
