package com.ogpis.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.RoleEntity;

@Entity
@Table(name = "ogpis_role")
public class Role extends RoleEntity {

}
