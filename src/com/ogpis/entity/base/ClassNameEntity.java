package com.ogpis.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.junit.ClassRule;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class ClassNameEntity extends BaseEntity {

	/**
	 * 对应类的全称
	 */
	@Column(name = "className", nullable = true, unique = true)
	private String className;

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}
