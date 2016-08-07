package com.ogpis.index.entity.base;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.plan.entity.Plan;

@MappedSuperclass
public class IndexManagementEntity extends BaseEntity {
	

	@Column(name = "指标名称")
	protected String indexName;
	
	@Column(name = "指标类型")
	protected String indexType;
	
	@Column(name = "指标单位")
	protected String indexUnit;
	
	@Column(name = "目标值")
	protected float indexValue;
	
	@ManyToOne
	@JoinColumn(name = "对应规划id")
	protected Plan plan;
	
	@OneToMany(fetch=FetchType.LAZY,cascade = { CascadeType.ALL }, mappedBy = "index")
	protected List<IndexDataManagement> indexData;


	public List<IndexDataManagement> getIndexData() {
		return indexData;
	}

	public void setIndexData(List<IndexDataManagement> indexData) {
		this.indexData = indexData;
	}

	public String getIndexName() {
		return indexName;
	}

	public void setIndexName(String indexName) {
		this.indexName = indexName;
	}

	public String getIndexType() {
		return indexType;
	}

	public void setIndexType(String indexType) {
		this.indexType = indexType;
	}

	public String getIndexUnit() {
		return indexUnit;
	}

	public void setIndexUnit(String indexUnit) {
		this.indexUnit = indexUnit;
	}

	public float getIndexValue() {
		return indexValue;
	}

	public void setIndexValue(float indexValue) {
		this.indexValue = indexValue;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	
	

}
