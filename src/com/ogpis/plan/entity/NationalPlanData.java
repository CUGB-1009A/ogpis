package com.ogpis.plan.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.plan.entity.base.NationalPlanDataEntity;

@Entity
@Table(name = "ogpis_nationalplan")
public class NationalPlanData extends NationalPlanDataEntity{

}
