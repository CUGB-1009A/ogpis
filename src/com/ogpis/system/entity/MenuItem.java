package com.ogpis.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.MenuItemEntity;

@Entity
@Table(name = "ogpis_menu")
public class MenuItem extends MenuItemEntity {

}
