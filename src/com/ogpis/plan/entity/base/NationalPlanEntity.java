package com.ogpis.plan.entity.base;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import com.ogpis.document.entity.PlanDocument;

/**
 * 全国规划
 * @author Danny
 *
 */
@MappedSuperclass
public class NationalPlanEntity extends BaseNationalPlanEntity {
	
	@OneToMany(fetch=FetchType.EAGER,cascade = { CascadeType.ALL }, mappedBy = "fatherNational")
	private Set<PlanDocument> children;

	public Set<PlanDocument> getChildren() {
		return children;
	}

	public void setChildren(Set<PlanDocument> children) {
		this.children = children;
	}


}
