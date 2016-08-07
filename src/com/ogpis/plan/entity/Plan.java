package com.ogpis.plan.entity;

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
	
	public List<IndexManagement> getOrderedIndex() {
		List<IndexManagement> list = (List<IndexManagement>) this.getIndexs();
		Collections.sort(list);
		return list;
	}
	//为了画十年的历史数据（规划起始年份前十年的数据）和规划期内每年目标
	@SuppressWarnings({ "unchecked"})
	public String getTenHistoryIndexData() {
		int yearNumber = Integer.parseInt(super.endTime.toString().substring(0, 4))-Integer.parseInt(super.startTime.toString().substring(0, 4))+1;
		StringBuilder result = new StringBuilder();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataTen =  new ArrayList<IndexDataManagement>();;//对应的规划外的十年完成情况
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<String> year = new ArrayList<String>();
		List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		indexTemp.addAll(this.getIndexs());
		Collections.sort(indexTemp);
		result.append("[");
		for(IndexManagement tempIndex : indexTemp)
		{
			indexDataAll.clear();
			indexDataTen.clear();
			year.clear();
			indexValue.clear();
			//找出历史（规划起始年份前）十年数据
			indexDataAll.addAll(tempIndex.getIndexData());	
			Collections.sort(indexDataAll); //根据年份排序（小到大）
			for(IndexDataManagement temp:indexDataAll) //确保只有十个完成记录
			{
				if(temp.getCollectedTime().getTime()<super.startTime.getTime())
					indexDataTen.add(temp);
				if(indexDataTen.size()>10)
					indexDataTen.remove(0);
			}
			for(IndexDataManagement indexDataTemp : indexDataTen)
			{
				year.add("'"+indexDataTemp.getCollectedTime().toString().substring(0, 4)+"'");
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			year.add("'目标值'");
			indexValue.add(tempIndex.getIndexValue()/yearNumber);
			result.append("{\"indexUnit\":\"" + tempIndex.getIndexUnit() + "\",\"indexName\":\"" + tempIndex.getIndexName()
			+ "\",\"indexValue\":" + tempIndex.getIndexValue()/yearNumber + ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	//这个是取规划年间的完成情况（在规划年间，完成情况有几年，算几年）
	@SuppressWarnings("unchecked")
	public String getIndexDataInPlanYear() {
		float hasFinished ;
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataInPlanYear =  new ArrayList<IndexDataManagement>();//对应的规划外的十年完成情况
		List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		indexTemp.addAll(this.getIndexs());
		Collections.sort(indexTemp);
		result.append("[");
		for(IndexManagement tempIndex : indexTemp)
		{
			hasFinished = 0;
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInPlanYear.clear();
			indexDataAll.addAll(tempIndex.getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()>super.startTime.getTime()&&temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInPlanYear.add(temp);
			}
			for(IndexDataManagement indexDataTemp : indexDataInPlanYear)
			{
				hasFinished = hasFinished + indexDataTemp.getFinishedWorkload();
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"hasFinished\":"+hasFinished+",\"indexUnit\":\"" + tempIndex.getIndexUnit() + "\",\"indexName\":\"" + tempIndex.getIndexName()
			+ "\",\"indexValue\":" + tempIndex.getIndexValue()+ ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}
	
	@SuppressWarnings("unchecked")
	public String getIndexDataInBoth() {
		StringBuilder result = new StringBuilder();
		ArrayList<Float> indexValue = new ArrayList<Float>();
		ArrayList<Integer> year = new ArrayList<Integer>();
		List<IndexDataManagement> indexDataAll =  new ArrayList<IndexDataManagement>();//对应所有的完成情况
		List<IndexDataManagement> indexDataInBoth =  new ArrayList<IndexDataManagement>();//对应的规划截止时间的最新10年数据
		List<IndexManagement> indexTemp = new ArrayList<IndexManagement>();
		indexTemp.addAll(this.getIndexs());
		Collections.sort(indexTemp);
		result.append("[");
		for(IndexManagement tempIndex : indexTemp)
		{
			year.clear();
			indexValue.clear();
			indexDataAll.clear();
			indexDataInBoth.clear();
			indexDataAll.addAll(tempIndex.getIndexData());		
			Collections.sort(indexDataAll); //根据年份排序（2000----2010）
			for(IndexDataManagement temp:indexDataAll) //记录处在规划期内的完成记录
			{
				if(temp.getCollectedTime().getTime()<super.endTime.getTime())
					indexDataInBoth.add(temp);
				if(indexDataInBoth.size()>10)
					indexDataInBoth.remove(0);
			}
			for(IndexDataManagement indexDataTemp : indexDataInBoth)
			{
				year.add(Integer.parseInt(indexDataTemp.getCollectedTime().toString().substring(0, 4)));
				indexValue.add(indexDataTemp.getFinishedWorkload());
			}
			result.append("{\"indexUnit\":\"" + tempIndex.getIndexUnit() + "\",\"indexName\":\"" + tempIndex.getIndexName()
			+ "\",\"indexValue\":" + tempIndex.getIndexValue()+ ",\"year\":"
			+ year.toString() + ",\"value\":" + indexValue.toString() + "},");
		}
		result.deleteCharAt(result.length() - 1);
		result.append("]");
		return result.toString();
	}

	public List<IndexManagement> getIndexs() {
		List<IndexManagement> result = new ArrayList();
		for (Plan_Index p_i : this.getPlan_indexs()) {
			result.add(p_i.getIndex());
		}
		return result;
	}

}
