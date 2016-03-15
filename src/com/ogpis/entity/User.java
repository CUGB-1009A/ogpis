package com.ogpis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.base.UserEntity;

@Entity
@Table(name = "test_user")
public class User extends UserEntity {

}
