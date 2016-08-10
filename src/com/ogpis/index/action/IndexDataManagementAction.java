package com.ogpis.index.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.index.service.IndexDataManagementService;
import com.ogpis.index.service.IndexManagementService;

@Controller
public class IndexDataManagementAction {
	
	@Autowired
	private IndexDataManagementService indexDataManagementService;
	
	@Autowired
	private IndexManagementService indexManagementService;
	
	//只显示一个指标项(通过id判断显示哪个)，通过下来列表来选择显示哪个指标项
	@RequestMapping(value = "/indexData/list")
	public String list(HttpServletRequest request, ModelMap model,String id){
		List<IndexManagement> indexList = indexManagementService.findAllIndexByPriority("QG");
		List<IndexDataManagement> indexDataList ;
		if(id.equals("0"))
			 {
				indexDataList = indexList.get(0).getOrderedIndexData();
				id = indexList.get(0).getId();
			 }
		else
			indexDataList = indexManagementService.findById(id).getOrderedIndexData();
		model.addAttribute("id",id);
		model.addAttribute("indexDataList",indexDataList);
		model.addAttribute("indexList",indexList);
		return "indexData/list";		
	}
	
	@RequestMapping(value = "/indexData/save")
	public void save(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException{
		String id = request.getParameter("id");
		String value = request.getParameter("value");
		IndexDataManagement indexData = indexDataManagementService.findById(id);
		indexData.setFinishedWorkload(Float.parseFloat(value));
		indexDataManagementService.update(indexData);
		String result = "{\"result\":\"success\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
	}
	
	@RequestMapping(value = "/indexData/delete")
	public void delete(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException{
		String id = request.getParameter("id");
		indexDataManagementService.delete(id);
		String result = "{\"result\":\"success\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
	}
	
	@RequestMapping(value = "/indexData/addIndexData")
	public String addIndexData(HttpServletRequest request, ModelMap model,String indexId,IndexDataManagement indexDataTemp){
		IndexDataManagement indexData = new IndexDataManagement();
		IndexManagement index = indexManagementService.findById(indexId);
		indexData.setCollectedTime(indexDataTemp.getCollectedTime());
		indexData.setFinishedWorkload(indexDataTemp.getFinishedWorkload());
		System.out.println(indexDataTemp.getCollectedTime());
		indexData.setIndex(index);
		indexDataManagementService.save(indexData);
		model.addAttribute("id",indexId);
		return "redirect:list";		
	}
	
	@RequestMapping(value = "/indexData/add")
	public void add(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws ParseException, IOException {	
		String planId = request.getParameter("planId");
		String type = request.getParameter("type");
		String indexIds = request.getParameter("indexIds");
		String indexValues = request.getParameter("indexValues");
		String collectTime = request.getParameter("collectTime");
		System.out.println(collectTime);
		IndexManagement indexManagement ;
		IndexDataManagement indexDataManagement = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] tempId = indexIds.split(";");
		String[] tempValue = indexValues.split(";");
		System.out.println("总共改了多少个指标记录"+tempId.length);
		for(int i=0;i<tempId.length;i++)
		{
			indexDataManagement = new IndexDataManagement();
			System.out.println(tempId[i]);
			indexIds = indexIds.substring(indexIds.indexOf(";")+1,indexIds.length());
			indexManagement = indexManagementService.findById(tempId[i]);
			indexDataManagement = new IndexDataManagement();
			indexDataManagement.setIndex(indexManagement);
			indexDataManagement.setFinishedWorkload(Float.parseFloat(tempValue[i]));
			indexDataManagement.setCollectedTime(sdf.parse(collectTime));
			indexDataManagementService.save(indexDataManagement);
		}
		String success = "{\"planId\":\""+planId+"\",\"flag\":\"4\","+"\"type\":\""+type+"\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);	
	}
	
	@RequestMapping(value = "/indexData/edit")
	public void edit(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws ParseException, IOException {	
		String planId = request.getParameter("planId");
		String type = request.getParameter("type");
		String indexIds = request.getParameter("indexIds");
		String indexValues = request.getParameter("indexValues");
		IndexDataManagement indexDataManagement = null;
		String[] tempId = indexIds.split(";");
		String[] tempValue = indexValues.split(";");
		System.out.println("============="+tempValue.length);
		for(int i=0;i<tempId.length;++i)
		{
			indexDataManagement = indexDataManagementService.findById(tempId[i]);
			indexIds = indexIds.substring(indexIds.indexOf(";")+1,indexIds.length());
			indexDataManagement.setFinishedWorkload(Float.parseFloat(tempValue[i]));
			indexDataManagementService.update(indexDataManagement);
		}

		String success = "{\"planId\":\""+planId+"\",\"flag\":\"4\","+"\"type\":\""+type+"\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);	
	}

}
