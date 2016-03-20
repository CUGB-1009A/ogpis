package com.ogpis.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
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

		return (List<User>) this.queryByHql("from User where deleted=false", null);
	}

	@Override
	public IPageList<User> getAllUsers(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		List<User> items = this.queryByHql("from User where deleted=false", null, first, pageSize);
//		int count = this.queryByHql("count(User) from User where deleted=false", null, first, pageSize).indexOf(0);
//		System.out.println("count: " + count);
		return PageListUtil.getPageList(10, pageNo, items, pageSize);
	}

	@Override
	protected Class<User> getEntityClass() {
		return User.class;
	}
}
