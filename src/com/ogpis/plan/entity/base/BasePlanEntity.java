package com.ogpis.plan.entity.base;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import org.springframework.format.annotation.DateTimeFormat;
import com.ogpis.base.entity.BaseEntity;

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

	@Column(columnDefinition="DATE",name = "开始时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date startTime;
	
	@Column(columnDefinition="DATE",name = "结束时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date endTime;

	@Column(name = "发布单位")
	private String releaseUnit;

	@Column(columnDefinition="DATE",name = "发布时间")
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
