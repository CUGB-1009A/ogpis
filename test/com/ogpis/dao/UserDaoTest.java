package com.ogpis.dao;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.security.RunAs;

import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.system.entity.Organization;
import com.ogpis.system.entity.User;
import com.ogpis.system.entity.base.UserEntity;
import com.ogpis.system.service.OrganizationService;
import com.ogpis.system.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
public class UserDaoTest {

	@Autowired
	private UserService userService;

	@Autowired
	private OrganizationService organizationService;

	// @BeforeClass
	// public static void init() {
	// @SuppressWarnings("resource")
	// ApplicationContext context = new FileSystemXmlApplicationContext(
	// "classpath:config/application-context.xml");
	// // ApplicationContext context = new ClassPathXmlApplicationContext(
	// // "application-context.xml");
	// @SuppressWarnings("unused")
	// SessionFactory sessionFactory = (SessionFactory) context
	// .getBean("sessionFactory");
	// userService = context.getBean(UserService.class);
	// organizationService = context.getBean(OrganizationService.class);
	//
	// }

	@Test
	public void testSaveUser() throws SQLException {
		Organization org = organizationService
				.findById("5fa94114-1e6a-47bb-aa17-27a123ff58d0");

		for (int i = 0; i < 50; i++) {
			User user = new User();
			user.setName("niexiao" + i);
			user.setPassword("password");
			user.setOraganzation(org);
			user = userService.add(user);
			System.out.println("userId :" + user.getId());
		}
	}

	@Test
	public void testSaveOrg() throws SQLException {
		Organization org = new Organization();
		org.setName("new org");
		org = organizationService.add(org);
		System.out.println("organizationId :" + org.getId());
	}

	@Test
	public void testGetUser() {
		User user = userService
				.findById("4163d4d5-c8fd-436b-9b76-0306908a0382");
		System.out.println("userName :" + user.getName());
		System.out.println("organizationId :"
				+ user.getOraganzation().getName());
	}

	@Test
	public void testDeleteUser() {
		String id = "90";
		userService.delete(id);
	}

	@Test
	public void testUpdateUser() {
		User user = userService
				.findById("4163d4d5-c8fd-436b-9b76-0306908a0382");
		user.setName("ndnd");
		userService.update(user);
		System.out.println("organizationId :"
				+ user.getOraganzation().getName());
	}

	@Test
	public void testGetAllUser() {

		List<User> users = userService.getAllUsers();
		System.out.println("users.size():" + users.size());
		System.out.println("users.get(0).getOraganzation().getName():"
				+ users.get(0).getOraganzation().getName());
	}
}
