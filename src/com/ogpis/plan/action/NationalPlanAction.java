package com.ogpis.plan.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.service.NationalPlanService;
import com.ogpis.plan.service.PlanDocumentService;


@Controller
public class NationalPlanAction {
	

	@Autowired
	private NationalPlanService nationalPlanService;
	@Autowired
	private PlanDocumentService planDocumentService;
	
	@SuppressWarnings("rawtypes")
	private ArrayList idList=new ArrayList();
	
	@RequestMapping(value = "/plan/national/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<NationalPlan> nationalPlans = nationalPlanService
				.getNationalPlans(pageNo, pageSize);
		model.addAttribute("nationalPlans", nationalPlans);	
		return "/plan/national/list";
	}
	
	@RequestMapping(value = "/plan/national/add")
	public String add(HttpServletRequest request, ModelMap model) {		
		return "/plan/national/edit";
	
	}
	
	@RequestMapping(value = "/plan/national/edit")
	public String edit(HttpServletRequest request, ModelMap model,String id) {		
		NationalPlan nationalPlan = this.nationalPlanService.findById(id);
		model.addAttribute("nationalPlan", nationalPlan);
		return "/plan/national/edit";
	
	}
	
	@RequestMapping(value = "/plan/national/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model,boolean isAdd,String id,NationalPlan nationalPlan) {		

		System.out.println(nationalPlan.getEndTime());
		NationalPlan bean = null;
		if(isAdd){
			bean = new NationalPlan();
		}
		else{
			bean = this.nationalPlanService.findById(id);
		}
		bean.setPlanName(nationalPlan.getPlanName());
		bean.setPlanCode(nationalPlan.getPlanCode());
		bean.setPlanDescription(nationalPlan.getPlanDescription());
		bean.setReleaseUnit(nationalPlan.getReleaseUnit());
		bean.setStartTime(nationalPlan.getStartTime());
		bean.setEndTime(nationalPlan.getEndTime());		
		bean.setReleaseDate(nationalPlan.getReleaseDate());
				
		if (isAdd) {
			nationalPlanService.add(bean);
		} 
		else {
			nationalPlanService.update(bean);
		}		
		model.addAttribute("nationalPlan", nationalPlan);
		return "redirect:list";
	
	}
	
	@RequestMapping(value = "/plan/national/delete")
	public String delete(HttpServletRequest request, ModelMap model,String id) {		
		NationalPlan nationalPlan = this.nationalPlanService.findById(id);
		nationalPlan.setDeleted(true);
		nationalPlanService.update(nationalPlan);
		return "redirect:list";
	
	}
	
	@RequestMapping(value = "/plan/national/show")
	public String show(HttpServletRequest request, ModelMap model,String id,String flag) {		
		
		NationalPlan nationalPlan =  this.nationalPlanService.findById(id);		
		/*Set<PlanDocument> planDocumentSet = nationalPlan.getPlanDocument();
		model.addAttribute("planDocumentSet", planDocumentSet);*/
		model.addAttribute("nationalPlan", nationalPlan);
		model.addAttribute("flag",flag);
		return  "/plan/national/detail";
	
	}
	
	@RequestMapping(value = "/plan/national/editOverview")
	public String editOverview(HttpServletRequest request, ModelMap model,String id,NationalPlan nationalPlan) {		

		NationalPlan bean = this.nationalPlanService.findById(id);
		bean.setPlanName(nationalPlan.getPlanName());
		bean.setReleaseUnit(nationalPlan.getReleaseUnit());
		bean.setReleaseDate(nationalPlan.getReleaseDate());
		bean.setPlanDescription(nationalPlan.getPlanDescription());
		nationalPlanService.update(bean);
		return "redirect:list";
	
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/plan/national/deleteBatch" ,method = RequestMethod.POST)
	public void deleteBatch(HttpServletResponse resp,HttpServletRequest request, ModelMap model) throws IOException {		
	 String Ids = request.getParameter("Ids");
	 String idTemp;
	 while(Ids.length()>1)
	 {
		 idTemp = Ids.substring(0,Ids.indexOf(","));
		 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
		 idList.add("\'"+idTemp+"\'");
	 }
	 nationalPlanService.updateAll(idList);
	 String success = "{\"flag1\":\"success\"}";     
     resp.setCharacterEncoding("utf-8");
	 resp.getWriter().write(success);		
	}

	@RequestMapping(value = "/plan/national/uploadFiles",method = RequestMethod.POST)
	public void uploadFiles(@RequestParam MultipartFile[] file ,HttpServletResponse resp,HttpServletRequest request, ModelMap model,String id) throws IOException {				
		NationalPlan nationalPlan = nationalPlanService.findById(id);
		Set<PlanDocument> planDocumentList = new HashSet<PlanDocument>();
		PlanDocument bean = null;
		
		for(MultipartFile fileTemp:file)
		{
			bean = new PlanDocument();
			String fileName = request.getServletContext().getRealPath("/")+"planFileUpload\\national\\"+fileTemp.getOriginalFilename();
			File localFile = new File(fileName);
			fileTemp.transferTo(localFile);
			bean.setDocumentAddress("planFileUpload\\national\\"+fileTemp.getOriginalFilename());
			bean.setDocumentDescription(request.getParameter("fileDescription"));
			bean.setUploadDate(new Date());
			bean.setDocumentSize(fileTemp.getSize()+"");
			bean.setDocumentName(fileTemp.getOriginalFilename());
			planDocumentService.add(bean);
			planDocumentList.add(bean);			
		}
		nationalPlan.setPlanDocument(planDocumentList);
		nationalPlanService.update(nationalPlan);
		resp.sendRedirect("show?id="+id+"&&flag=2");
	}	
}
