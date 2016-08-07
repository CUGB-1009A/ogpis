package com.ogpis.index.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.index.entity.base.IndexManagementEntity;

@Entity
@Table(name = "ogpis_index")
public class IndexManagement extends IndexManagementEntity {

	/*public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexManagement indexManagement=(IndexManagement)o;
		return this.getPriority().compareTo(indexManagement.getPriority());
	}*/
}
