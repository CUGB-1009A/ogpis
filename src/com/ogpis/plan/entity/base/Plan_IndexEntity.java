package com.ogpis.plan.entity.base;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;

/**
 * 规划和指标的对应表
 * 
 * @author Danny
 */
@MappedSuperclass
public class Plan_IndexEntity extends BaseEntity {

	@ManyToOne
    @JoinColumn(name = "plan_id")
	private Plan plan;

	@ManyToOne
    @JoinColumn(name = "index_id")
	private IndexManagement index;
	
	@Column(name = "目标值")
	private float targetValue;

	/**
	 * @return the plan
	 */
	public Plan getPlan() {
		return plan;
	}

	/**
	 * @param plan the plan to set
	 */
	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	/**
	 * @return the index
	 */
	public IndexManagement getIndex() {
		return index;
	}

	/**
	 * @param index the index to set
	 */
	public void setIndex(IndexManagement index) {
		this.index = index;
	}

	/**
	 * @return the targetValue
	 */
	public float getTargetValue() {
		return targetValue;
	}

	/**
	 * @param targetValue the targetValue to set
	 */
	public void setTargetValue(float targetValue) {
		this.targetValue = targetValue;
	}
}
