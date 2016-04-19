package com.ogpis.plan.entity.base;

import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.plan.entity.PlanDocument;

/**
 * 规划信息的基类，定义了规划信息的公有字段
 * 
 * @author Danny
 *
 */
@MappedSuperclass
public class BasePlanEntity extends BaseEntity {
	
	@Column(name = "规划名称")
	private String planName;

	@Column(name = "规划代号")
	private String planCode;

	@Column(name = "规划描述")
	private String planDescription;

	@OneToMany(cascade = { CascadeType.ALL })
	@Column(name = "规划文档")
	private Set<PlanDocument> planDocument;
	
	
	@Column(name = "开始时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date startTime;
	
	@Column(name = "结束时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date endTime;

	@Column(name = "发布单位")
	private String releaseUnit;

	@Column(name = "发布时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date releaseDate;

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getPlanCode() {
		return planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	public String getPlanDescription() {
		return planDescription;
	}

	public void setPlanDescription(String planDescription) {
		this.planDescription = planDescription;
	}

	public Set<PlanDocument> getPlanDocument() {
		return planDocument;
	}

	public void setPlanDocument(Set<PlanDocument> planDocument) {
		this.planDocument = planDocument;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getReleaseUnit() {
		return releaseUnit;
	}

	public void setReleaseUnit(String releaseUnit) {
		this.releaseUnit = releaseUnit;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}




}
