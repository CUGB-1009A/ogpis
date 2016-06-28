package com.ogpis.index.entity.base;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import org.springframework.format.annotation.DateTimeFormat;
import com.ogpis.base.entity.BaseEntity;
import com.ogpis.index.entity.IndexManagement;


@MappedSuperclass
public class IndexDataManagementEntity extends BaseEntity{
	@ManyToOne
	@JoinColumn(name = "对应指标id")
	private IndexManagement index;
	
	@Column(columnDefinition="DATE",name = "采集时间")
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date collectedTime;
	
	@Column(name = "完成量")
	private float finishedWorkload ;
	
	public IndexManagement getIndex() {
		return index;
	}

	public void setIndex(IndexManagement index) {
		this.index = index;
	}

	public Date getCollectedTime(){
		
		return collectedTime;
	}

	public void setCollectedTime(Date collectedTime) {
		
		this.collectedTime = collectedTime;
	}

	public float getFinishedWorkload() {
		return finishedWorkload;
	}

	public void setFinishedWorkload(float finishedWorkload) {
		this.finishedWorkload = finishedWorkload;
	}


}
