package com.ogpis.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.OrganizationEntity;

@Entity
@Table(name = "ogpis_organization")
public class Organization extends OrganizationEntity {

}
