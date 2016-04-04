package com.ogpis.expando.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.expando.entity.base.ExpandoTableEntity;

@Entity
@Table(name = "ogpis_expandotable")
public class ExpandoTable extends ExpandoTableEntity {

	public static final String DEFAULT_TABLE_NAME = "CUSTOM_FIELDS";
}
