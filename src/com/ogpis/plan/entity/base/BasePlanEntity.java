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
	private int planCode;

	@Column(name = "规划描述")
	private String planDescription;

	@OneToMany(cascade = { CascadeType.ALL })
	@Column(name = "规划文档")
	private Set<PlanDocument> planDocument;
	
	@Column(name = "开始时间")
	private Date startTime;
	
	@Column(name = "结束时间")
	private Date endTime;

	@Column(name = "发布单位")
	private String releaseUnit;

	@Column(name = "发布时间")
	private Date releaseDate;


}
