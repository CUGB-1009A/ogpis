package com.ogpis.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.UserEntity;

@Entity
@Table(name = "ogpis_user")
public class User extends UserEntity {

}
