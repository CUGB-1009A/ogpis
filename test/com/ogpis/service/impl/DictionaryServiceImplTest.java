package com.ogpis.service.impl;

import static org.junit.Assert.fail;

import org.junit.BeforeClass;
import org.junit.Test;

import com.ogpis.TestUtil;
import com.ogpis.entity.Dictionary;
import com.ogpis.service.DictionaryService;

public class DictionaryServiceImplTest {

	private static DictionaryService dictionaryService;

	@BeforeClass
	public static void init() {
		dictionaryService = TestUtil.getApplicationContext().getBean(
				DictionaryService.class);
	}

	@Test
	public void testAdd() {
		Dictionary dic = new Dictionary();
		dic.setName("dic_name");
		dic.setValue("dic_value");
		dic.setPriority(0);
		dic.setType("dic_type");
		dictionaryService.add(dic);
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
