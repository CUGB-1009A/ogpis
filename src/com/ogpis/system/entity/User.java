package com.ogpis.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.UserEntity;

@Entity
@Table(name = "ogpis_user")
public class User extends UserEntity {

	/**
	 * 给用户添加角色
	 * 
	 * @param role
	 *            要添加的角色
	 */
	public void addToRoles(Role role) {
		if (role == null) {
			return;
		}
		Set<Role> roles = getRoles();
		if (roles == null) {
			roles = new HashSet<Role>();
			setRoles(roles);
		}
		roles.add(role);
	}
}
