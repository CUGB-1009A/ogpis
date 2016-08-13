package com.ogpis.international.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class InternationalEntity extends BaseEntity {

	@Column(name = "companyName")
	protected String companyName;

	@Column(columnDefinition="TEXT", name = "description")
	protected String content;
	
	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
