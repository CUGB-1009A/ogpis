package com.ogpis.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.base.ExpandoValueEntity;

@Entity
@Table(name = "ogpis_expandovalue")
public class ExpandoValue extends ExpandoValueEntity {
	
//	
//	public ExpandoValue(ExpandoColumn expandoColumn, ExpandoRow expandoRow) {
//		super();
//		this.setColumn(expandoColumn);
//		this.setRow(expandoRow);
//		if(expandoColumn.getTable()!=expandoRow.getTable()){
//			
//		}else{
//			this.setTable(expandoRow.getTable());
//			this.setClassName(expandoRow.getTable().getClassName());
//		}
//	}
}
