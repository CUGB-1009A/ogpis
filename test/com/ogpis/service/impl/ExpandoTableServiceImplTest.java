package com.ogpis.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.entity.ClassName;
import com.ogpis.entity.ExpandoTable;
import com.ogpis.service.ClassNameService;
import com.ogpis.service.ExpandoTableService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ExpandoTableServiceImplTest {

	@Resource
	private ExpandoTableService expandoTableService;
	@Resource
	private ClassNameService classNameService;

	@Test
	public void test() {

		ClassName className = classNameService
				.findById("68d338d9-da3d-4c34-888f-4e57bb8bc824");

		ExpandoTable expandoTable = new ExpandoTable();
		expandoTable.setClassName(className);
		expandoTable.setName("testET");
		expandoTableService.add(expandoTable);
	}

}
