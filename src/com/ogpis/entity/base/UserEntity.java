package com.ogpis.entity.base;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.entity.Organization;


@MappedSuperclass
public abstract class UserEntity extends BaseEntity {
	
	protected String loginId;
	protected String name;
	protected String password;
	
	@ManyToOne
	@JoinColumn(name="organization_id")
	protected Organization organization;
	
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
