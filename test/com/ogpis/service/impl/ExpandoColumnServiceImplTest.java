package com.ogpis.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoTableService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ExpandoColumnServiceImplTest {

	@Resource
	private ExpandoTableService expandoTableService;
	@Resource
	private ClassNameService classNameService;
	@Resource
	private ExpandoColumnService expandoColumnService;

	@Test
	public void test() {
		ExpandoTable table = expandoTableService.findByT_C(
				"testET", "className");
		ExpandoColumn expandoColumn = new ExpandoColumn();
		expandoColumn.setTable(table);
		expandoColumn.setName("expandoColumn3");
		expandoColumn.setType("15");
		expandoColumn.setDefalutData("default");

		expandoColumnService.add(expandoColumn);
	}

	@Test
	public void testFindExpandoColumn() {
		ExpandoColumn expandoColumn = expandoColumnService
				.findById("fd995f24-e64e-44df-9653-47e689e93d53");

		String test = expandoColumn.getTable().getClassName().getClassName();
		System.out.println(test);
	}

}
