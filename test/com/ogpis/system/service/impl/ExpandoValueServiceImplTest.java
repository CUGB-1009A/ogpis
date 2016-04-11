package com.ogpis.system.service.impl;

import javax.annotation.Resource;

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

;;;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ExpandoValueServiceImplTest {

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

	@Test
	public void test() {

		ClassName className = classNameService.findByClassName("className");
		ExpandoTable table = expandoTableService.getTable("testET1",
				className.getClassName());
		ExpandoColumn column = expandoColumnService.getColumn(table.getId(),
				"expandoColumn1");
		String classPK = "classPK";
		String data = "data";
		expandoValueService.addValue(className, table, column, classPK, data);
	}
}
