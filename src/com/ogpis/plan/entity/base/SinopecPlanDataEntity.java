package com.ogpis.plan.entity.base;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class SinopecPlanDataEntity extends CompanyPlanEntity {

	@Column(name = "油田勘探")
	private String ytkt;
	@Column(name = "油气集输")
	private String yqjs;
	@Column(name = "油田开发")
	private String ytkf;
	@Column(name = "炼油工程")
	private String lygc;
	@Column(name = "化工生产")
	private String hgsc;
	@Column(name = "水电设施规划")
	private String sdszgh;
	@Column(name = "产品销售")
	private String cpxs;

	/**
	 * @return the ytkt
	 */
	public String getYtkt() {
		return ytkt;
	}

	/**
	 * @param ytkt
	 *            the ytkt to set
	 */
	public void setYtkt(String ytkt) {
		this.ytkt = ytkt;
	}

	/**
	 * @return the yqjs
	 */
	public String getYqjs() {
		return yqjs;
	}

	/**
	 * @param yqjs
	 *            the yqjs to set
	 */
	public void setYqjs(String yqjs) {
		this.yqjs = yqjs;
	}

	/**
	 * @return the ytkf
	 */
	public String getYtkf() {
		return ytkf;
	}

	/**
	 * @param ytkf
	 *            the ytkf to set
	 */
	public void setYtkf(String ytkf) {
		this.ytkf = ytkf;
	}

	/**
	 * @return the lygc
	 */
	public String getLygc() {
		return lygc;
	}

	/**
	 * @param lygc
	 *            the lygc to set
	 */
	public void setLygc(String lygc) {
		this.lygc = lygc;
	}

	/**
	 * @return the hgsc
	 */
	public String getHgsc() {
		return hgsc;
	}

	/**
	 * @param hgsc
	 *            the hgsc to set
	 */
	public void setHgsc(String hgsc) {
		this.hgsc = hgsc;
	}

	/**
	 * @return the sdszgh
	 */
	public String getSdszgh() {
		return sdszgh;
	}

	/**
	 * @param sdszgh
	 *            the sdszgh to set
	 */
	public void setSdszgh(String sdszgh) {
		this.sdszgh = sdszgh;
	}

	/**
	 * @return the cpxs
	 */
	public String getCpxs() {
		return cpxs;
	}

	/**
	 * @param cpxs
	 *            the cpxs to set
	 */
	public void setCpxs(String cpxs) {
		this.cpxs = cpxs;
	}

}
