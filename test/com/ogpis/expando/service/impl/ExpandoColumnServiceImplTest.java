package com.ogpis.expando.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoTableService;
import com.ogpis.expando.service.ExpandoValueService;
import com.ogpis.plan.entity.NationalPlanData;
import com.ogpis.plan.service.NationalPlanDataService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ExpandoColumnServiceImplTest {

	@Test
	public void test() {
		ExpandoTable table = expandoTableService.getTable(
				"testET", "className");
		ExpandoColumn expandoColumn = new ExpandoColumn();
		expandoColumn.setTable(table);
		expandoColumn.setName("expandoColumn3");
		expandoColumn.setType("15");
		expandoColumn.setDefalutData("default");

		expandoColumnService.save(expandoColumn);
	}

	@Test
	public void testFindExpandoColumn() {
		ExpandoColumn expandoColumn = expandoColumnService
				.findById("fd995f24-e64e-44df-9653-47e689e93d53");

		String test = expandoColumn.getTable().getClassName().getClassName();
		System.out.println(test);
	}
	
	@Test
	public void testAddColumn(){
	
		ExpandoTable table = expandoTableService
				.getDefaultTable(NationalPlanData.class.toString());
		String name="testColumn2";
		String type="String";
		String defalutData="defaultData";
		expandoColumnService.addColumn(table, name, type, defalutData);
	}
	
	@Resource
	private NationalPlanDataService nationalPlanService;
	@Resource
	private ClassNameService classNameService;
	@Resource
	private ExpandoTableService expandoTableService;
	@Resource
	private ExpandoColumnService expandoColumnService;
	@Resource
	private ExpandoValueService expandoValueService;

}
