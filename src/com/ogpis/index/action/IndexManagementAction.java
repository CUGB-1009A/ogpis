package com.ogpis.index.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.index.service.IndexManagementService;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.service.PlanService;

@Controller
public class IndexManagementAction {
	
	@Autowired IndexManagementService indexManagementService ;
	@Autowired PlanService planService ;
	
	@RequestMapping(value = "/index/add")
	public String add(HttpServletRequest request, ModelMap model,String planId) {	
		model.addAttribute("planId", planId);
		return "index/indexEdit";	
	}
	
	@RequestMapping(value = "/index/edit")
	public String edit(HttpServletRequest request, ModelMap model,String id,String planId) {		
		IndexManagement index = indexManagementService.findById(id);
		model.addAttribute("index",index);
		model.addAttribute("planId",index.getPlan().getId());
		return "index/indexEdit";	
	}
	
	@RequestMapping(value = "/index/back")
	public String back(HttpServletRequest request, ModelMap model,String planId) {		
		Plan plan = planService.findById(planId);
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		return "redirect:/plan/show";	
	}
	
	@RequestMapping(value = "/index/detail")
	public void detail  (HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException {
		String planId = request.getParameter("planId");
		Plan plan = planService.findById(planId);
		List<IndexManagement> indexs =  plan.getIndex();
		String result = "";
		System.out.println(indexs.size());
		if(indexs.size()== 0)
		{
	
			result = "{\"flag\":\"failed\"}";
		}
		else
		{
			result += "{\"planIndex\":[";
			for(IndexManagement tempIndex:indexs)
			{
				result += "{\"indexName\":\""+tempIndex.getIndexName()+"\",\"indexType\":\""+tempIndex.getIndexType()+"\",\"indexUnit\":\""+tempIndex.getIndexUnit()+"\",\"indexValue\":\""+tempIndex.getIndexValue()+"\"},";
			}
			result = result.substring(0, result.length()-1);
			result += "]}";
		}
		
		System.out.println(result);
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);			
	}
	
	@RequestMapping(value = "/index/save" , method = RequestMethod.POST)
	public String save(HttpServletRequest request, ModelMap model,String id,boolean isAdd,IndexManagement indexManagement,String planId) {		
		IndexManagement bean = null;
		Plan plan = planService.findById(planId);
		if(isAdd)
			{
			bean = new IndexManagement();
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setIndexValue(indexManagement.getIndexValue());
			bean.setPlan(plan);
			indexManagementService.save(bean);
			}
		else		
			{
			bean = indexManagementService.findById(id);
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setIndexValue(indexManagement.getIndexValue());
			indexManagementService.update(bean);
			}
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		return "redirect:/plan/show";	
	}
	
	@RequestMapping(value = "/index/delete")
	public String delete(HttpServletRequest request, ModelMap model,String planId,String id) {	
		Plan plan = planService.findById(planId);
		IndexManagement bean = indexManagementService.findById(id);
		bean.setDeleted(true);
		bean.setPlan(null);
		indexManagementService.update(bean);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		model.addAttribute("id", planId);
		return "redirect:/plan/show";
	}
	
	@RequestMapping(value = "/index/toImportPage")
	public String toImportPage(HttpServletRequest request, ModelMap model,String planId) {		
		Plan plan = planService.findById(planId);
		String type = plan.getPlanType();
		List<Plan> plans = planService.getPlansByType(type);
		model.addAttribute("plans", plans);
		model.addAttribute("planId", planId);
		return "index/importIndex";	
	}
	
	@RequestMapping(value = "/index/importIndex")
	public String importIndex(HttpServletRequest request, ModelMap model,String planId,String theChosedPlanId) {		
		Plan plan = planService.findById(planId);
		Plan theChosedPlan = planService.findById(theChosedPlanId);
		IndexManagement index ;
		for(IndexManagement temp:theChosedPlan.getIndex())
		{
			index = new IndexManagement();
			index.setIndexName(temp.getIndexName());
			index.setIndexType(temp.getIndexType());
			index.setIndexUnit(temp.getIndexUnit());
			index.setIndexValue(temp.getIndexValue());
			index.setPlan(plan);
			indexManagementService.save(index);
		}
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		return "redirect:/plan/show";	
	}
	
	

}
