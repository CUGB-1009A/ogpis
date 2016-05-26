package com.ogpis.system.service.impl;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.system.entity.Role;
import com.ogpis.system.service.RoleService;

//用于配置spring中测试的环境
@RunWith(SpringJUnit4ClassRunner.class)
// 用于指定配置文件所在的位置
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
public class RoleServiceImplTest {

	@Resource
	private RoleService roleService;

	@Test
	public void testAddRole() {
		Role role = new Role();
		role.setName("testRole");
		role.setPriority(1);
		role.setSuper(false);
		Set<String> perms = new HashSet<String>();
		perms.add("perm1");
		perms.add("perm2");
		perms.add("perm3");
		role.setPerms(perms);
		roleService.add(role);
	}

	@Test
	public void testDeleteMembers() {
		Role role = roleService
				.findById("9a070819-1821-4d35-99ee-0ef2dc91917e");
		String[] userIds = new String[] { "f67bc80e-a4fa-4641-8211-fd0862e3b1a0" };
		roleService.deleteMembers(role, userIds);
	}
}
