package com.ogpis.plan.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.plan.entity.base.PlanEntity;


@Entity
@Table(name = "ogpis_plan")
public class Plan extends PlanEntity {
	
/*	public List<IndexManagement> getOrderedIndex() {
		List<IndexManagement> list = (List<IndexManagement>) super.getIndex();
		Collections.sort(list);
		return list;
	}*/
	//为了画十年的历史数据（规划起始年份前十年的数据）和规划期内每年目标
	@SuppressWarnings({ "unchecked"})
	public String getTenHistoryIndexData() {
		int yearNumber = Integer.parseInt(super.endTime.toString().substring(0, 4))-Integer.parseInt(super.startTime.toString().substring(0, 4))+1;
		StringBuilder result = new StringBuilder();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataTen =  new ArrayList<IndexDataManagement>();;//对应的规划外的十年完成情况
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		/*index =(List<IndexManagement>) super.getIndex();
		Collections.sort(index);*/
		result.append("[");
		for(IndexManagement tempIndex : super.getIndex())
		{
			indexDataAll.clear();
			indexDataTen.clear();
			year.clear();
			indexValue.clear();
			//找出历史（规划起始年份前）十年数据
			indexDataAll =tempIndex.getIndexData();
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement temp:indexDataAll) //确保只有十个完成记录
			{
				if(temp.getCollectedTime().getTime()<super.startTime.getTime())
					indexDataTen.add(temp);
				if(indexDataTen.size()>10)
					indexDataTen.remove(0);
			}
			/*if(indexData.size()>10)//超过十个截取后十个记录
				indexData = indexData.subList(indexData.size()-10, indexData.size());*/
			for(IndexDataManagement indexDataTemp : indexDataTen)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexUnit\":\"" + tempIndex.getIndexUnit() + "\",\"indexName\":\"" + tempIndex.getIndexName()
			+ "\",\"indexValue\":" + tempIndex.getIndexValue()/yearNumber + ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	@SuppressWarnings("unchecked")
	public String getPlanYearIndexData() {
		int yearNumber = Integer.parseInt(super.endTime.toString().substring(0, 4))-Integer.parseInt(super.startTime.toString().substring(0, 4))+1;
		StringBuilder result = new StringBuilder();
		List<IndexManagement> index = null;
		List<IndexDataManagement> indexData = null;
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		/*index =(List<IndexManagement>) super.getIndex();
		Collections.sort(index);*/
		result.append("[");
		for(IndexManagement tempIndex : super.getIndex())
		{
			year.clear();
			indexValue.clear();

			//找出历史（规划起始年份前）十年数据 参数三为历史数据记录条数
			indexData =tempIndex.getIndexData();
			Collections.sort(indexData); //根据年份排序
			for(IndexDataManagement indexDataTemp : indexData)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexUnit\":\"" + tempIndex.getIndexUnit() + "\",\"indexName\":\"" + tempIndex.getIndexName()
			+ "\",\"indexValue\":" + tempIndex.getIndexValue()/yearNumber + ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
}
