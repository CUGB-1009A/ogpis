package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class CompanyPlanEntity extends BaseEntity {

	/**
	 * 公司名称
	 */
	@Column(name="公司名称")
	private String companyName;
	/**
	 * 公司唯一标示
	 */
	@Column(name="公司代码")
	private int companyCode;
	/**
	 * 规划期内石油公司的勘探投资
	 */
	@Column(name="勘探投资")
	private double investment;
	/**
	 * 规划的时间段
	 */
	@Column(name="规划时间段")
	private Date planPeriod;
	/**
	 * 石油探明储量
	 */
	@Column(name="石油探明地质储量")
	private double explore_oil;
	/**
	 * 天然气探明地质储量
	 */
	@Column(name="天然气探明地质储量")
	private double explore_gas;
	/**
	 * 石油产量
	 */
	@Column(name="石油产量")
	private double production_oil;
	/**
	 * 天然气产量
	 */
	@Column(name="天然气产量")
	private double production_gas;

	/**
	 * 二维地震勘探公里数
	 */
	@Column(name="勘探工程(地震勘探)")
	private double exploration;

	/**
	 * 规划期内销售收入
	 */
	@Column(name="销售收入")
	private double revenue;

	/**
	 * @return the companyName
	 */
	public String getCompanyName() {
		return companyName;
	}

	/**
	 * @param companyName
	 *            the companyName to set
	 */
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	/**
	 * @return the companyCode
	 */
	public int getCompanyCode() {
		return companyCode;
	}

	/**
	 * @param companyCode
	 *            the companyCode to set
	 */
	public void setCompanyCode(int companyCode) {
		this.companyCode = companyCode;
	}

	/**
	 * @return the investment
	 */
	public double getInvestment() {
		return investment;
	}

	/**
	 * @param investment
	 *            the investment to set
	 */
	public void setInvestment(double investment) {
		this.investment = investment;
	}

	/**
	 * @return the planPeriod
	 */
	public Date getPlanPeriod() {
		return planPeriod;
	}

	/**
	 * @param planPeriod
	 *            the planPeriod to set
	 */
	public void setPlanPeriod(Date planPeriod) {
		this.planPeriod = planPeriod;
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
	 * @return the exploration
	 */
	public double getExploration() {
		return exploration;
	}

	/**
	 * @param exploration
	 *            the exploration to set
	 */
	public void setExploration(double exploration) {
		this.exploration = exploration;
	}

	/**
	 * @return the revenue
	 */
	public double getRevenue() {
		return revenue;
	}

	/**
	 * @param revenue
	 *            the revenue to set
	 */
	public void setRevenue(double revenue) {
		this.revenue = revenue;
	}

}
