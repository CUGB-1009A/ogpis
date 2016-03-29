package com.ogpis.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.entity.ClassName;
import com.ogpis.entity.ExpandoColumn;
import com.ogpis.entity.ExpandoRow;
import com.ogpis.entity.ExpandoTable;
import com.ogpis.entity.ExpandoValue;
import com.ogpis.service.ClassNameService;
import com.ogpis.service.ExpandoColumnService;
import com.ogpis.service.ExpandoRowService;
import com.ogpis.service.ExpandoTableService;
import com.ogpis.service.ExpandoValueService;

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
		ExpandoTable table = expandoTableService.findByT_C("testET1",
				className.getClassName());
		ExpandoColumn column = expandoColumnService.findByT_N(table.getId(),
				"expandoColumn1");
		String classPK = "classPK";
		String data = "data";
		expandoValueService.addValue(className, table, column, classPK, data);
	}
}
