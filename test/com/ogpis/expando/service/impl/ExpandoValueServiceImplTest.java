package com.ogpis.expando.service.impl;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
public class ExpandoValueServiceImplTest {

	@Test
	public void testAddValues() {
		String classPK = "c1276fa4-d47b-4120-b9cd-e20b22bb0175";
		ClassName className = classNameService
				.findByClassName(NationalPlanData.class.toString());
		ExpandoTable table = ExpandoTableService
				.getDefaultTable(NationalPlanData.class.toString());
		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(NationalPlanData.class.toString());
		Map<String, String> data = new HashedMap();
		for (ExpandoColumn column : columns) {
			String value = column.getName() + "-testValue0";
			data.put(column.getName(), value);
		}
		System.out.println("addValues");
		expandoValueService.addValues(className, table, columns, classPK, data);
	}

	@Resource
	private NationalPlanDataService nationalPlanService;
	@Resource
	private ClassNameService classNameService;
	@Resource
	private ExpandoTableService ExpandoTableService;
	@Resource
	private ExpandoColumnService expandoColumnService;
	@Resource
	private ExpandoValueService expandoValueService;

}
