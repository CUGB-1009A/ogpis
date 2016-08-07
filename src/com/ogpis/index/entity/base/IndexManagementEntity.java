package com.ogpis.index.entity.base;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;
import com.ogpis.system.entity.User;

@MappedSuperclass
public class IndexManagementEntity extends BaseEntity {

	public static final String FREQUENCY_YEAR = "year";
	public static final String FREQUENCY_QUARTER = "quarter";
	public static final String FREQUENCY_MONTH = "month";

	@Column(name = "指标名称")
	protected String indexName;
	
	@Column(name = "指标类型")
	protected String indexType;
	
	@Column(name = "优先级")
	protected Integer priority;
	
	@Column(name = "指标单位")
	protected String indexUnit;

	@OneToMany(mappedBy = "index")
	private Set<Plan_Index> plan_indexs;
	
	@Column(name = "指标采集频率")
	private String frequency;
	
	@OneToMany(fetch=FetchType.LAZY,cascade = { CascadeType.ALL }, mappedBy = "index")
	protected List<IndexDataManagement> indexData;
	
	@Deprecated
	@Column(name = "目标值")
	protected float indexValue;

	@Deprecated
	@ManyToOne
	@JoinColumn(name = "对应规划id")
	protected Plan plan;
	
	
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
	@Deprecated
	public float getIndexValue() {
		return indexValue;
	}
	@Deprecated
	public void setIndexValue(float indexValue) {
		this.indexValue = indexValue;
	}
	@Deprecated
	public Plan getPlan() {
		return plan;
	}
	@Deprecated
	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	/**
	 * @return the plan_indexs
	 */
	public Set<Plan_Index> getPlan_indexs() {
		return plan_indexs;
	}

	/**
	 * @param plan_indexs the plan_indexs to set
	 */
	public void setPlan_indexs(Set<Plan_Index> plan_indexs) {
		this.plan_indexs = plan_indexs;
	}

	/**
	 * @return the frequency
	 */
	public String getFrequency() {
		return frequency;
	}

	/**
	 * @param frequency the frequency to set
	 */
	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	/**
	 * @return the priority
	 */
	public Integer getPriority() {
		return priority;
	}

	/**
	 * @param priority the priority to set
	 */
	public void setPriority(Integer priority) {
		this.priority = priority;
	}
	
	


}
