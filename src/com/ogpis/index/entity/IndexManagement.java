package com.ogpis.index.entity;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.index.entity.base.IndexManagementEntity;

@Entity
@Table(name = "ogpis_index")
public class IndexManagement extends IndexManagementEntity implements Comparable{

	public int compareTo(Object o) {
		// TODO Auto-generated method stub
		IndexManagement indexManagement=(IndexManagement)o;
		return this.getIndexType().compareTo(indexManagement.getIndexType());
	}
	
	public List<IndexDataManagement> getOrderedData() {
		List<IndexDataManagement> list = super.getIndexData();
		Collections.sort(list);
		return list;
	}

}
