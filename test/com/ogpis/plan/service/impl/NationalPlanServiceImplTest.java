package com.ogpis.plan.service.impl;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoRowService;
import com.ogpis.expando.service.ExpandoTableService;
import com.ogpis.expando.service.ExpandoValueService;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.service.NationalPlanService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class NationalPlanServiceImplTest {

	@Resource
	private NationalPlanService nationalPlanService;
	@Resource
	private ClassNameService classNameService;
	@Resource
	private ExpandoTableService expandoTableService;
	@Resource
	private ExpandoColumnService expandoColumnService;
	@Resource
	private ExpandoRowService expandoRowService;
	@Resource
	private ExpandoValueService expandoValueService;

	@Ignore
	@Test
	public void test() {
		NationalPlan nationalPlan = new NationalPlan();
		nationalPlan.setExplore_SG(11d);
		nationalPlanService.add(nationalPlan);
	}

	@Ignore
	@Test
	public void testAddNationalPlan() {

		Date planPeriod = new Date();
		int planCode = 11;
		String planName = "test";
		double explore_oil = 10;
		double explore_gas = 10;
		double explore_CBM = 10;
		double explore_SG = 10;
		double production_oil = 10;
		double production_gas = 10;
		double production_CBM = 10;
		double production_SG = 10;
		nationalPlanService.addNationalPlan(planPeriod, planCode, planName,
				explore_oil, explore_gas, explore_CBM, explore_SG,
				production_oil, production_gas, production_CBM, production_SG);
	}

	@Test
	public void testAddExpandoValue() {

		String classPK = "60c762b2-863a-46fa-9b3f-2c8aafeed6aa";
		NationalPlan np = nationalPlanService.findById(classPK);

		ClassName className = classNameService
				.findByClassName(NationalPlan.class.toString());
		ExpandoTable table = expandoTableService
				.getDefaultTable(NationalPlan.class.toString());

		ExpandoColumn column = expandoColumnService.getColumn(table.getId(),
				"testColumn1");
		if (column == null) {
			column = expandoColumnService.addColumn(table, "testColumn",
					"String", "");
		}
		String data = "testData1";

		ExpandoValue value = expandoValueService.addValue(className, table,
				column, classPK, data);

	}

	@Test
	public void testGetExpandoValue() {

		String classPK = "60c762b2-863a-46fa-9b3f-2c8aafeed6aa";

		ExpandoTable table = expandoTableService
				.getDefaultTable(NationalPlan.class.toString());
		ExpandoColumn column = expandoColumnService.getColumn(table.getId(),
				"testColumn");

		ExpandoValue value = expandoValueService.getValue(table.getId(),
				column.getId(), classPK);
		System.out.println("value :" + value.getData());

	}

	@Test
	public void testGetRowValues() {
		String classPK = "60c762b2-863a-46fa-9b3f-2c8aafeed6aa";

		ExpandoTable table = expandoTableService
				.getDefaultTable(NationalPlan.class.toString());

		List<ExpandoValue> values = expandoValueService.getRowValues(
				table.getId(), classPK);
		for (ExpandoValue value : values) {
			System.out.println("value :" + value.getData());
		}

	}

}
