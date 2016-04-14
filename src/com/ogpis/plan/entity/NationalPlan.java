package com.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.NationalPlanEntity;

@Entity
@Table(name = "ogpis_nationalplan")
public class NationalPlan extends NationalPlanEntity {

}
