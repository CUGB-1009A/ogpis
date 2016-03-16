package com.ogpis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.base.DictionaryEntity;

@Entity
@Table(name = "ogpis_dictionary")
public class Dictionary extends DictionaryEntity {

}
