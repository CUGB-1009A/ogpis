package com.ogpis.system.entity.base;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.system.entity.Organization;
import com.ogpis.system.entity.Role;


@MappedSuperclass
public abstract class UserEntity extends BaseEntity {
	
	protected String loginId;
	protected String name;
	protected String password;
	
	@ManyToOne
	@JoinColumn(name="organization_id")
	protected Organization organization;
	
	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)  
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))  
	protected Set<Role> roles = new HashSet<Role>();  
	
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Organization getOraganzation() {
		return organization;
	}

	public void setOraganzation(Organization oraganzation) {
		this.organization = oraganzation;
	}
	
}
