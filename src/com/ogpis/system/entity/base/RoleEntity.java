package com.ogpis.system.entity.base;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.system.entity.User;

@MappedSuperclass
public class RoleEntity extends BaseEntity {

	/**
	 * 角色名
	 */
	protected String name;
	/**
	 * 优先级，用于排序
	 */
	protected int priority;
	/**
	 * 是否是超级管理员
	 */
	protected boolean isSuper;

	/**
	 * 该角色对应的用户
	 */
	@ManyToMany(targetEntity = User.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "ROLE_ID"), inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	protected Set<User> users = new HashSet<User>();

	/**
	 * 该角色对应的权限url
	 */
	@ElementCollection(fetch=FetchType.EAGER)
	@CollectionTable(name = "ogpis_role_permission", joinColumns = @JoinColumn(name = "role_id"))
	@Column(name = "perm_url")
	protected Set<String> perms;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the priority
	 */
	public int getPriority() {
		return priority;
	}

	/**
	 * @param priority
	 *            the priority to set
	 */
	public void setPriority(int priority) {
		this.priority = priority;
	}

	/**
	 * @return the isSuper
	 */
	public boolean isSuper() {
		return isSuper;
	}

	/**
	 * @param isSuper
	 *            the isSuper to set
	 */
	public void setSuper(boolean isSuper) {
		this.isSuper = isSuper;
	}

	/**
	 * @return the users
	 */
	public Set<User> getUsers() {
		return users;
	}

	/**
	 * @param users
	 *            the users to set
	 */
	public void setUsers(Set<User> users) {
		this.users = users;
	}

	/**
	 * @return the perms
	 */
	public Set<String> getPerms() {
		return perms;
	}

	/**
	 * @param perms
	 *            the perms to set
	 */
	public void setPerms(Set<String> perms) {
		this.perms = perms;
	}

}