package com.ogpis.system.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.system.entity.base.DictionaryEntity;

@Entity
@Table(name = "ogpis_dictionary")
public class Dictionary extends DictionaryEntity {

}
