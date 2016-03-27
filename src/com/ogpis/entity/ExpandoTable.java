package com.ogpis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.base.ExpandoTableEntity;

@Entity
@Table(name = "ogpis_expandotable")
public class ExpandoTable extends ExpandoTableEntity {

}
