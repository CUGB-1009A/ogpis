package com.ogpis.plan.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.plan.entity.SinopecPlanData;
import com.ogpis.plan.service.SinopecPlanDataService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class SinopecPlanServiceImplTest {

	@Resource
	private SinopecPlanDataService sinopecPlanSevice;

	@Test
	public void test() {
		sinopecPlanSevice.add(new SinopecPlanData());
	}

}
