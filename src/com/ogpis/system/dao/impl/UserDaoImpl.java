package com.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.system.dao.UserDao;
import com.ogpis.system.entity.User;

@Repository
public class UserDaoImpl extends BaseDaoImpl<User, String> implements UserDao {
	public User saveUser(User user) {
		return save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		return (List<User>) this.queryByHql("from User where deleted=false",
				null);
	}

	@Override
	public IPageList<User> getAllUsers(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		List<User> items = this.queryByHql(
				"from User where deleted=false order by createTime desc", null,
				first, pageSize);
		// int count = this.queryByHql("select count(*) from User where
		// deleted=false", null).indexOf(0);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from User where deleted=false", null)
				.toString());
		System.out.println("count: " + count);
		// http://www.cnblogs.com/mabaishui/archive/2009/10/16/1584510.html
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public User findByUserName(String userName) {
		String hql = "from User where name=?";
		User user = (User) this.findUnique(hql, userName);
		return user;
	}

	@Override
	protected Class<User> getEntityClass() {
		return User.class;
	}
}
