package com.ogpis.expando.service.impl;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ExpandoRow;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoRowService;
import com.ogpis.expando.service.ExpandoTableService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ExpandoRowServiceImplTest {

	@Resource
	private ExpandoTableService expandoTableService;
	@Resource
	private ClassNameService classNameService;
	@Resource
	private ExpandoColumnService expandoColumnService;
	@Resource
	private ExpandoRowService expandoRowService;

	@Test
	public void test() {
		ExpandoTable table = expandoTableService.getTable(
				"testET", "className");
		ExpandoRow expandoRow = new ExpandoRow();
		expandoRow.setTable(table);
		expandoRow.setClassPK("classpk");
		expandoRowService.add(expandoRow);
	}

}
