package com.ogpis.plan.entity.base;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import org.springframework.format.annotation.DateTimeFormat;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.system.entity.User;

/**
 * 规划信息的基类，定义了规划信息的公有字段
 * 
 * @author Danny
 *
 */
@MappedSuperclass
public class PlanEntity extends BaseEntity {
	
	@Column(name = "规划名称")
	private String planName;

	@Column(name = "规划代号")
	private String planCode;

	@Column(name = "规划描述")
	private String planDescription;
	
	@Column(name = "规划维度")
	private String planDimension;
	
	@Column(name = "规划关键词")
	private String keyWords;
	
	@Column(name = "是否已发布")
	private boolean released;

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
	
	@Column(name = "规划类型")
	private String planType;
	
	@OneToMany(fetch=FetchType.EAGER,cascade = { CascadeType.ALL }, mappedBy = "plan")
	private Set<PlanDocument> planDocument;
	
	@OneToMany(fetch=FetchType.EAGER,cascade = { CascadeType.ALL }, mappedBy = "plan")
	private Set<IndexManagement> index;
	
	/*
	 * 规划对应被哪些用户收藏 many-to-many
	 */
	@ManyToMany(targetEntity = User.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_plan", joinColumns = @JoinColumn(name = "PLAN_ID"), inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	protected Set<User> users = new HashSet<User>();

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<IndexManagement> getIndex() {
		return index;
	}

	public void setIndex(Set<IndexManagement> index) {
		this.index = index;
	}

	public Set<PlanDocument> getPlanDocument() {
		return planDocument;
	}

	public void setPlanDocument(Set<PlanDocument> planDocument) {
		this.planDocument = planDocument;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

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
	
	public String getPlanDimension() {
		return planDimension;
	}

	public void setPlanDimension(String planDimension) {
		this.planDimension = planDimension;
	}
	
	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
	
	public boolean getReleased() {
		return released;
	}

	public void setReleased(boolean released) {
		this.released = released;
	}

}
