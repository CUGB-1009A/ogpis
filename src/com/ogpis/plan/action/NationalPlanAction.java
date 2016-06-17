package com.ogpis.plan.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.document.service.PlanDocumentService;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.service.NationalPlanService;


@Controller
public class NationalPlanAction  {
	Logger log = Logger.getLogger(NationalPlanAction.class);  

	@Autowired
	private NationalPlanService nationalPlanService;
	@Autowired
	private PlanDocumentService planDocumentService;
	
	@SuppressWarnings("rawtypes")
	private ArrayList idList=new ArrayList();
	
	/*
	 * 读取全国规划列表函数
	 */
	@RequiresPermissions(value={"nationalPlan:list"})
	@RequestMapping(value = "/plan/national/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<NationalPlan> nationalPlans = nationalPlanService
				.getNationalPlans(pageNo, pageSize);
		model.addAttribute("nationalPlans", nationalPlans);	
		return "plan/national/list";
	}
	
	/*
	 * 普通用户查看规划响应函数
	 */
	@RequestMapping(value = "/plan/national/showDetail")
	public String showDetail(HttpServletRequest request, ModelMap model,String id) {	
		NationalPlan nationalPlan = nationalPlanService.findById(id);
		model.addAttribute("nationalPlan", nationalPlan);
		Set<PlanDocument> planDocuments = nationalPlan.getChildren();
		model.addAttribute("planDocuments", planDocuments);
		return "/plan/national/showDetail";	
	}
	
	/*
	 * 到添加规划页面
	 */
	@RequiresPermissions(value={"national:add"})
	@RequestMapping(value = "/plan/national/toEditPage")
	public String toEditPage(HttpServletRequest request, ModelMap model,String id) {	
		return "/plan/national/edit";	
	}
	
	/*
	 * 添加、修改规划函数
	 */
	@RequestMapping(value = "/plan/national/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, boolean isAdd,ModelMap model,String id,NationalPlan nationalPlan) {		

		NationalPlan bean = null;
		if(isAdd){
			bean = new NationalPlan();
		}
		else{
			bean = nationalPlanService.findById(id);
		}
		bean.setPlanName(nationalPlan.getPlanName());
		bean.setPlanCode(nationalPlan.getPlanCode());
		bean.setPlanDescription(nationalPlan.getPlanDescription());
		bean.setReleaseUnit(nationalPlan.getReleaseUnit());
		bean.setStartTime(nationalPlan.getStartTime());
		bean.setEndTime(nationalPlan.getEndTime());		
		bean.setReleaseDate(nationalPlan.getReleaseDate());
		bean.setModifiedTime(new Timestamp(System.currentTimeMillis()));
				
		if (isAdd) {
			nationalPlanService.save(bean);
		} 
		else {
			nationalPlanService.update(bean);
		}		
		return "redirect:list";
	
	}
	
	/*
	 * 单个删除规划函数,同时软删除对应规划文档
	 */
	@RequiresPermissions(value={"national:delete"})
	@RequestMapping(value = "/plan/national/delete")
	public String delete(HttpServletRequest request, ModelMap model,String id) {		
		NationalPlan nationalPlan = this.nationalPlanService.findById(id);
		nationalPlan.setDeleted(true);
		Set<PlanDocument> planDocumentSet = nationalPlan.getChildren();
		for(PlanDocument temp:planDocumentSet)
		{
			temp.setDeleted(true);
			temp.setFatherNational(null);
			planDocumentService.update(temp);
		}
		nationalPlanService.update(nationalPlan);
		return "redirect:list";
	
	}
	
	/*显示tab页1-5函数*/
	@RequiresPermissions(value={"national:toEditPage"})
	@RequestMapping(value = "/plan/national/show")
	public String show(HttpServletRequest request, ModelMap model,String id,String flag) {	
		NationalPlan nationalPlan =  this.nationalPlanService.findById(id);
		model.addAttribute("nationalPlan", nationalPlan);
		Set<PlanDocument> planDocumentSet = nationalPlan.getChildren();
		model.addAttribute("planDocumentSet", planDocumentSet);
		model.addAttribute("flag",flag);
		return  "/plan/national/detail";
	
	}
	
	/*
	 * 批量删除规划函数
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value={"national:deleteBatch"})
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
	 
	 for(int i=0;i<idList.size();i++)
	 {
		 System.out.println(idList.get(i).toString().substring(1,idList.get(i).toString().length()-1));
		 NationalPlan nationalPlan = nationalPlanService.findById(idList.get(i).toString().substring(1,idList.get(i).toString().length()-1));
		 Set<PlanDocument> planDocumentSet = nationalPlan.getChildren();
		 for(PlanDocument temp : planDocumentSet)
		 {
			 temp.setDeleted(true);
			 temp.setFatherNational(null);
			 planDocumentService.update(temp);
		 }
	 }
	 String success = "{\"flag1\":\"success\"}";     
     resp.setCharacterEncoding("utf-8");
	 resp.getWriter().write(success);		
	}

	/*
	 * 提交上传文件表单函数
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/plan/national/uploadFiles",method = RequestMethod.POST)
	public void uploadFiles(String id,HttpServletResponse resp,HttpServletRequest request) throws Exception {	
		final HttpSession hs = request.getSession();
		NationalPlan nationalPlan = nationalPlanService.findById(id);
		Set<PlanDocument> planDocumentList = new HashSet<PlanDocument>();
		planDocumentList.addAll(nationalPlan.getChildren());
		PlanDocument bean = null;
		request.setCharacterEncoding("utf-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
		
        if(!isMultipart)
        {  
        	resp.sendRedirect("show?id="+id+"&&flag=2");
        }  
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		upload.setProgressListener(new ProgressListener()
		{
			public void update(long pBytesRead , long pContentLength ,int pItems)
			{
				int rate = Math.round(new Float(pBytesRead)/new Float(pContentLength)*100);
				hs.setAttribute("proInfo", rate);
			}			
		});
		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		Iterator iter1 = items.iterator();
		String  fileDescription ="";
		while(iter1.hasNext())
		{
			FileItem item = (FileItem) iter1.next(); 
			if (item.isFormField()) 
	          {  
	        	  if(item.getFieldName().equals("fileDescription"))
	        		  fileDescription = item.getString("UTF-8");	        		  
	          } 
		}
      while (iter.hasNext())  //表单中有几个input标签，就循环几次
      {  	    	     	 
          FileItem item = (FileItem) iter.next(); 
          if (item.isFormField()) 
          {  
        	  
          } 
          else 
          {  	bean = new PlanDocument();          
                String fileName = item.getName();
                /*
                 * 这里发现ie获取的是路径加文件名，chrome获取的是文件名，这里我们只需要文件名，所以有路径的要先去路径
                 */
                if(fileName.contains("\\"));
                	fileName = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.length());
                String prefix= System.currentTimeMillis()+"";
                File uploadedFile = new File( request.getServletContext().getRealPath("/")+"planFileUpload\\national"+"\\"+prefix+fileName);           	
                item.write(uploadedFile);  
      	        bean.setDocumentAddress("planFileUpload\\national\\"+prefix+fileName);
    			bean.setDocumentDescription(fileDescription);
    			bean.setUploadDate(new Date());
    			bean.setDocumentSize(item.getSize()+"");
    			bean.setDocumentName(fileName);
    			bean.setFatherNational(nationalPlan);
    			planDocumentList.add(bean);	
    			planDocumentService.save(bean);
          }  
    }  		
	nationalPlan.setChildren(planDocumentList);
	nationalPlanService.update(nationalPlan);
	resp.sendRedirect("show?id="+id+"&&flag=2");
}
	
	/*
	 * Ajax获取进度函数
	 */
	  @RequestMapping(value = "/plan/national/process.json", method = RequestMethod.POST)  
	  public void process(HttpServletRequest request,HttpServletResponse response) throws Exception 
	  { 	       
	     response.setContentType("application/json");
	     response.setCharacterEncoding("utf-8");
	     response.getWriter().write("{\"rate\":"+request.getSession().getAttribute("proInfo")+"}");         
	  }
	  
	  /*
	   * 单个删除文件函数
	   */
	  @RequestMapping(value = "/plan/national/deleteDoc")
	  public void deleteDoc(HttpServletRequest request,HttpServletResponse response, ModelMap model,String id,String nationalPlanId) throws IOException
	  {
		  PlanDocument planDocument = planDocumentService.findById(id);
		  planDocument.setFatherNational(null);
		  planDocument.setDeleted(true);
		  planDocumentService.update(planDocument);
		  response.sendRedirect("show?id="+nationalPlanId+"&&flag=2");
	  }
	  
		/*批量删除文件函数*/
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "/plan/national/deleteDocBatch" ,method = RequestMethod.POST)
		public void deleteDocBatch(HttpServletResponse resp,HttpServletRequest request, ModelMap model) throws IOException {		
		 String Ids = request.getParameter("Ids");
		 String idTemp;
		 while(Ids.length()>1)
		 {
			 idTemp = Ids.substring(0,Ids.indexOf(","));
			 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
			 idList.add("\'"+idTemp+"\'");
		 }
		 System.out.println(idList.toString());
		 System.out.println(idList.size());
		 planDocumentService.updateAll(idList);
		 System.out.println(idList.toString());
		 String success = "{\"flag1\":\"success\"}";     
	     resp.setCharacterEncoding("utf-8");
		 resp.getWriter().write(success);		
		}
		@RequiresPermissions(value={"national:fuzzyQuery"})
		@RequestMapping(value = "/plan/national/fuzzyQuery")
		public String fuzzyQuery(HttpServletRequest request, ModelMap model,String condition) {
			int pageNo = ServletRequestUtils.getIntParameter(request,
					PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
			int pageSize = 6;
			IPageList<NationalPlan> nationalPlans = nationalPlanService
					.getNationalPlansByCondition(condition,pageNo, pageSize);
			model.addAttribute("nationalPlans", nationalPlans);
			model.addAttribute("condition",condition);
			return "plan/national/list";
		}
}
