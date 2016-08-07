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
	public void testAdd() {
		add("9772c10a-ce63-461c-8bec-996db132b19b","21e51140-c14f-476b-9ee3-1aa619a4ec6f",800);
		add("9772c10a-ce63-461c-8bec-996db132b19b","9f33380a-dcf5-469c-ae9e-cb69d73991c8",6925);
		add("9772c10a-ce63-461c-8bec-996db132b19b","a3987ae2-5782-46c8-b0dd-b988773b51ce",8500);
		add("9772c10a-ce63-461c-8bec-996db132b19b","a9baad83-3958-4865-ad1e-664bd73776b6",65);
		add("9772c10a-ce63-461c-8bec-996db132b19b","af276698-4d49-47ae-b92e-bab912e7a4e7",35000);
		add("9772c10a-ce63-461c-8bec-996db132b19b","af62d6c4-0530-41c5-a909-e1e5bfa53a10",10);
		add("9772c10a-ce63-461c-8bec-996db132b19b","c57d6c43-8ba0-4eec-9dbf-76ed8b0bf650",6000);
		add("9772c10a-ce63-461c-8bec-996db132b19b","eb1cd271-d2e9-4246-83ee-4823f5779456",325);
	}

	public void add(String planId, String indexId, float targetValue) {
		Plan plan = planDao.findById(planId);
		IndexManagement index = indexManagementDao.findById(indexId);
		plan_indexDao.add(plan, index, targetValue);
	}
}
