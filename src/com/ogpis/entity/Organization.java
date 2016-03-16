package com.ogpis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.base.OrganizationEntity;

@Entity
@Table(name = "ogpis_organization")
public class Organization extends OrganizationEntity {

}
