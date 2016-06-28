package com.ogpis.index.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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