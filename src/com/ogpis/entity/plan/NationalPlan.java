package com.ogpis.entity.plan;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.entity.plan.base.NationalPlanEntity;

@Entity
@Table(name = "ogpis_nationalplan")
public class NationalPlan extends NationalPlanEntity{

}
