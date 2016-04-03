package com.ogpis.base.dao.impl;

import static org.junit.Assert.*;

import org.hibernate.SessionFactory;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.ogpis.base.dao.BaseDao;
import com.ogpis.system.dao.UserDao;
import com.ogpis.system.service.OrganizationService;
import com.ogpis.system.service.UserService;

public class BaseDaoImplTest {

	private static UserDao userDao;

	@BeforeClass
	public static void init() {
		@SuppressWarnings("resource")
		ApplicationContext context = new FileSystemXmlApplicationContext("classpath:config/application-context.xml");
		// ApplicationContext context = new ClassPathXmlApplicationContext(
		// "application-context.xml");
		
		
		@SuppressWarnings("unused")
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		userDao = context.getBean(UserDao.class);

	}

	@Test
	public void testSave() {

	}

	@Test
	public void testSaveEntities() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteT() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteID() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteClassOfTID() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindById() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryEntityByExampleT() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryEntityByExampleTIntInt() {
		fail("Not yet implemented");
	}

	@Test
	public void testBatchMarkDelete() {
		this.userDao.batchMarkDelete(new String[] { "74936b2c-c514-453b-9d28-1203f97ef3b5",
				"0edd51a3-a9d3-404c-bbdd-2b4e9b423feb", "464888ef-65a7-4504-a383-97eb8bc99513" });
	}

	@Test
	public void testGetEntityClass() {

	}

}
