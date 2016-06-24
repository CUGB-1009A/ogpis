package com.ogpis.document.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import com.ogpis.document.entity.base.PlanDocumentEntity;


@Entity
@Table(name = "ogpis_plandocument")
public class PlanDocument extends PlanDocumentEntity {

}
