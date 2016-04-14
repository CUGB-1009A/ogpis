package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class NationalPlanDataEntity extends BaseEntity {

	/**
	 * 规划时间段
	 */
	@Column(name = "规划时间段")
	private Date planPeriod;
	/**
	 * 规划唯一标识
	 */
	@Column(name = "规划唯一标识")
	private int planCode;
	/**
	 * 规划名称
	 */
	@Column(name = "规划名称")
	private String planName;
	/**
	 * 石油探明地质储量
	 */
	@Column(name = "石油探明地质储量")
	private double explore_oil;
	/**
	 * 天然气探明地质储量
	 */
	@Column(name = "天然气探明地质储量")
	private double explore_gas;
	/**
	 * 煤层气探明地质储量
	 */
	@Column(name = "煤层气探明地质储量")
	private double explore_CBM;
	/**
	 * 页岩气探明地质储量
	 */
	@Column(name = "页岩气探明地质储量")
	private double explore_SG;

	/**
	 * 石油产量
	 */
	@Column(name = "石油产量")
	private double production_oil;
	/**
	 * 天然气产量
	 */
	@Column(name = "天然气产量")
	private double production_gas;
	/**
	 * 煤层气产量
	 */
	@Column(name = "煤层气产量")
	private double production_CBM;
	/**
	 * 页岩气产量
	 */
	@Column(name = "页岩气产量")
	private double production_SG;

	/**
	 * @return the planDate
	 */
	public Date getPlanPeriod() {
		return planPeriod;
	}

	/**
	 * @param planDate
	 *            the planDate to set
	 */
	public void setPlanPeriod(Date planPeriod) {
		this.planPeriod = planPeriod;
	}

	/**
	 * @return the planCode
	 */
	public int getPlanCode() {
		return planCode;
	}

	/**
	 * @param planCode
	 *            the planCode to set
	 */
	public void setPlanCode(int planCode) {
		this.planCode = planCode;
	}

	/**
	 * @return the planName
	 */
	public String getPlanName() {
		return planName;
	}

	/**
	 * @param planName
	 *            the planName to set
	 */
	public void setPlanName(String planName) {
		this.planName = planName;
	}

	/**
	 * @return the explore_oil
	 */
	public double getExplore_oil() {
		return explore_oil;
	}

	/**
	 * @param explore_oil
	 *            the explore_oil to set
	 */
	public void setExplore_oil(double explore_oil) {
		this.explore_oil = explore_oil;
	}

	/**
	 * @return the explore_gas
	 */
	public double getExplore_gas() {
		return explore_gas;
	}

	/**
	 * @param explore_gas
	 *            the explore_gas to set
	 */
	public void setExplore_gas(double explore_gas) {
		this.explore_gas = explore_gas;
	}

	/**
	 * @return the explore_CBM
	 */
	public double getExplore_CBM() {
		return explore_CBM;
	}

	/**
	 * @param explore_CBM
	 *            the explore_CBM to set
	 */
	public void setExplore_CBM(double explore_CBM) {
		this.explore_CBM = explore_CBM;
	}

	/**
	 * @return the explore_SG
	 */
	public double getExplore_SG() {
		return explore_SG;
	}

	/**
	 * @param explore_SG
	 *            the explore_SG to set
	 */
	public void setExplore_SG(double explore_SG) {
		this.explore_SG = explore_SG;
	}

	/**
	 * @return the production_oil
	 */
	public double getProduction_oil() {
		return production_oil;
	}

	/**
	 * @param production_oil
	 *            the production_oil to set
	 */
	public void setProduction_oil(double production_oil) {
		this.production_oil = production_oil;
	}

	/**
	 * @return the production_gas
	 */
	public double getProduction_gas() {
		return production_gas;
	}

	/**
	 * @param production_gas
	 *            the production_gas to set
	 */
	public void setProduction_gas(double production_gas) {
		this.production_gas = production_gas;
	}

	/**
	 * @return the production_CBM
	 */
	public double getProduction_CBM() {
		return production_CBM;
	}

	/**
	 * @param production_CBM
	 *            the production_CBM to set
	 */
	public void setProduction_CBM(double production_CBM) {
		this.production_CBM = production_CBM;
	}

	/**
	 * @return the production_SG
	 */
	public double getProduction_SG() {
		return production_SG;
	}

	/**
	 * @param production_SG
	 *            the production_SG to set
	 */
	public void setProduction_SG(double production_SG) {
		this.production_SG = production_SG;
	}


}
