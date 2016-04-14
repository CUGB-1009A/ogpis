package com.ogpis.plan.entity.base;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.system.entity.User;

/**
 * 规划文档，定义了规划文档实体的字段信息
 * 
 * @author Danny
 *
 */
@MappedSuperclass
public class PlanDocumentEntity extends BaseEntity {

//	@ManyToOne
//	@JoinColumn(name = "对应规划Id")
//	private BasePlanEntity plan;

	@Column(name = "文档名称")
	private String documentName;

	@Column(name = "文档概述")
	private String documentDescription;

	@Column(name = "文档容量")
	private String documentSize;

	@Column(name = "文档地址")
	private String documentAddress;

	@Column(name = "上传时间")
	private Date uploadDate;

	@Column(name = "上传用户")
	private User uploadUser;

}
