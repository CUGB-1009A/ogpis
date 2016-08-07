package com.ogpis.plan.dao.impl;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.index.dao.IndexManagementDao;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.dao.Plan_IndexDao;
import com.ogpis.plan.entity.Plan;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
public class Plan_IndexDaoImplTest {

	@Autowired
	private Plan_IndexDao plan_indexDao;

	@Autowired
	private PlanDao planDao;

	@Autowired
	private IndexManagementDao indexManagementDao;

	@Test
	public void testAdd()
	{
		String planId="a99d5b0f-55ab-437e-931c-0b4512a0d75e";
		String indexId="4b460135-ccc6-4140-abac-e435cf279805";
		float targetValue=99;
		Plan plan = planDao.findById(planId);
		IndexManagement index  =indexManagementDao.findById(indexId);
		plan_indexDao.add(plan, index, targetValue);
	}
}
