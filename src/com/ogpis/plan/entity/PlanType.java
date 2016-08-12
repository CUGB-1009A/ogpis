package com.ogpis.plan.entity;

public enum PlanType {
	全国("QC"), 中石油("QC"), 中石化("QC"), 中海油("QC"), 延长石油("QC"), 中联煤("QC"), 其他("QC"), 全部(
			"ALL"), ;

	// 定义私有变量
	private String planType;

	// 构造函数，枚举类型只能为私有
	private PlanType(String planType) {
		this.planType = planType;
	}

	public String getPlanType() {
		return planType;
	}

	public void setPlanType(String planType) {
		this.planType = planType;
	}

	@Override
	public String toString() {
		return this.planType;
	}

}
