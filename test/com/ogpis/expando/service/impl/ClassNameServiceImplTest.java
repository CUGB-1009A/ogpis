package com.ogpis.expando.service.impl;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.service.ClassNameService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class ClassNameServiceImplTest {

	@Resource
	private ClassNameService classNameService;
	
	@Test
	public void test() {
		ClassName className = new ClassName();
		className.setClassName("className1");
		classNameService.add(className);
	}

}
