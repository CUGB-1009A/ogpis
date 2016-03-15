package com.ogpis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.dao.UserDao;
import com.ogpis.entity.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, String> implements UserDao {
	public String saveUser(User user) {
		return save(user);
	}

	@Override
	public List<User> getAllUsers() {

		return (List<User>) this.queryByHql("from User where deleted=false",
				null);
	}

	@Override
	protected Class<User> getEntityClass() {
		return User.class;
	}
}
