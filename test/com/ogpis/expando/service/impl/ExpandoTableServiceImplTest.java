package com.ogpis.expando.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoTableService;

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
		ClassName className = classNameService.findByClassName("className");
		ExpandoTable expandoTable = new ExpandoTable();
		expandoTable.setClassName(className);
		expandoTable.setName("testET1");
		expandoTableService.add(expandoTable);
	}

}
