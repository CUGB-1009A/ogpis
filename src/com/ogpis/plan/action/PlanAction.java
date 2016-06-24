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
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.service.PlanService;


@Controller
public class PlanAction  {
	Logger log = Logger.getLogger(PlanAction.class);  

	@Autowired
	private PlanService planService;
	@Autowired
	private PlanDocumentService planDocumentService;
	
	@SuppressWarnings("rawtypes")
	private ArrayList idList=new ArrayList();
	
	/*
	 * 读取规划列表函数,根据type查询不同类型的规划
	 */
	@RequiresPermissions(value={"nationalPlan:list"})
	@RequestMapping(value = "/plan/list")
	public String list(HttpServletRequest request, ModelMap model, String type, String condition) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<Plan> plans = planService
				.getPlans(pageNo, pageSize, type, condition);
		model.addAttribute("plans", plans);
		model.addAttribute("type", type);
		model.addAttribute("condition", condition);
		System.out.println(type+condition);
		return "plan/list";
	}
	
	/*
	 * 普通用户查看规划响应函数
	 */
	@RequestMapping(value = "/plan/showDetail")
	public String showDetail(HttpServletRequest request, ModelMap model,String id) {	
		Plan plan = planService.findById(id);
		model.addAttribute("plan", plan);
		Set<PlanDocument> planDocuments = plan.getPlanDocument();
		model.addAttribute("planDocuments", planDocuments);
		return "/plan/showDetail";	
	}
	
	/*
	 * 到添加规划页面
	 */
	@RequiresPermissions(value={"national:add"})
	@RequestMapping(value = "/plan/toEditPage")
	public String toEditPage(HttpServletRequest request, ModelMap model,String id,String type) {
		System.out.println("添加的规划为"+type);
		model.addAttribute("type", type);
		return "/plan/edit";	
	}
	
	/*
	 * 添加、修改规划函数
	 */
	@RequestMapping(value = "/plan/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, boolean isAdd,ModelMap model,String id,Plan plan,String type) {		

		Plan bean = null;
		if(isAdd){
			bean = new Plan();
			bean.setPlanType(type);
		}
		else{
			bean = planService.findById(id);
		}
		bean.setPlanName(plan.getPlanName());
		bean.setPlanCode(plan.getPlanCode());
		bean.setPlanDescription(plan.getPlanDescription());
		bean.setReleaseUnit(plan.getReleaseUnit());
		bean.setStartTime(plan.getStartTime());
		bean.setEndTime(plan.getEndTime());		
		bean.setReleaseDate(plan.getReleaseDate());
		bean.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		model.addAttribute("type", type);
		model.addAttribute("condition", "");		
		if (isAdd) {
			planService.save(bean);
		} 
		else {
			planService.update(bean);
			model.addAttribute("id", bean.getId());
			model.addAttribute("flag", 1);
			return "redirect:show";
		}
		return "redirect:list";
	
	}
	
	/*
	 * 单个删除规划函数,同时软删除对应规划文档
	 */
	@RequiresPermissions(value={"national:delete"})
	@RequestMapping(value = "/plan/delete")
	public String delete(HttpServletRequest request, ModelMap model,String id,String type) {		
		Plan plan = planService.findById(id);
		plan.setDeleted(true);
		Set<PlanDocument> planDocumentSet = plan.getPlanDocument();
		for(PlanDocument temp:planDocumentSet)
		{
			temp.setDeleted(true);
			temp.setPlan(null);
			planDocumentService.update(temp);
		}
		planService.update(plan);
		model.addAttribute("type", type);
		model.addAttribute("condition", "");
		return "redirect:list";
	
	}
	
	@RequiresPermissions(value={"national:toEditPage"})
	@RequestMapping(value = "/plan/show")
	public String show(HttpServletRequest request, ModelMap model,String id,String type,String flag) {	
		Plan plan =  this.planService.findById(id);
		String hasPage = request.getParameter("pageNo");
		model.addAttribute("plan", plan);
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<PlanDocument> planDocumentSet = planDocumentService
				.getOnePlanDocument(pageNo, pageSize, plan.getId());
		model.addAttribute("planDocumentSet", planDocumentSet);
		model.addAttribute("type",type);
		/*这个判断条件是为了分页的时候，将flag强制赋予2，停留在文档页上*/
		if(hasPage==null)
			model.addAttribute("flag",flag);
		else
			model.addAttribute("flag",2);
		return  "/plan/detail";
	}

	/*
	 * 批量删除规划函数
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value={"national:deleteBatch"})
	@RequestMapping(value = "/plan/deleteBatch" ,method = RequestMethod.POST)
	public void deleteBatch(HttpServletResponse resp,HttpServletRequest request, ModelMap model) throws IOException {		
	 String Ids = request.getParameter("Ids");
	 String type = request.getParameter("type");
	 String idTemp;
	 while(Ids.length()>1)
	 {
		 idTemp = Ids.substring(0,Ids.indexOf(","));
		 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
		 idList.add("\'"+idTemp+"\'");
	 }
	 planService.updateAll(idList);
	 
	 for(int i=0;i<idList.size();i++)
	 {
		 System.out.println(idList.get(i).toString().substring(1,idList.get(i).toString().length()-1));
		 Plan plan = planService.findById(idList.get(i).toString().substring(1,idList.get(i).toString().length()-1));
		 Set<PlanDocument> planDocumentSet = plan.getPlanDocument();
		 for(PlanDocument temp : planDocumentSet)
		 {
			 temp.setDeleted(true);
			 temp.setPlan(null);
			 planDocumentService.update(temp);
		 }
	 }
	 String success = "{\"type\":\""+type+"\"}";
	 resp.setContentType("application/json");
     resp.setCharacterEncoding("utf-8");
	 resp.getWriter().write(success);		
	}

	/*
	 * 提交上传文件表单函数
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/plan/uploadFiles",method = RequestMethod.POST)
	public String uploadFiles(String id,HttpServletResponse resp,HttpServletRequest request,ModelMap model) throws Exception {	
		final HttpSession hs = request.getSession();
		Plan plan = planService.findById(id);
		String type = request.getParameter("type");
		Set<PlanDocument> planDocumentList = new HashSet<PlanDocument>();
		planDocumentList.addAll(plan.getPlanDocument());
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
                File uploadedFile = new File( request.getServletContext().getRealPath("/")+"planFileUpload\\"+type+"\\"+prefix+fileName);           	
                item.write(uploadedFile);  
      	        bean.setDocumentAddress("planFileUpload\\"+type+"\\"+prefix+fileName);
    			bean.setDocumentDescription(fileDescription);
    			bean.setUploadDate(new Date());
    			bean.setDocumentSize(item.getSize()+"");
    			bean.setDocumentName(fileName);
    			bean.setPlan(plan);
    			planDocumentList.add(bean);	
    			planDocumentService.save(bean);
          }  
    }  		
	plan.setPlanDocument(planDocumentList);
	planService.update(plan);
	System.out.println(id+"----"+type);
	model.addAttribute("id", id);
	model.addAttribute("type",type);
	model.addAttribute("flag",2);
	return "redirect:show";
}
	
	/*
	 * Ajax获取进度函数
	 */
	  @RequestMapping(value = "/plan/process.json", method = RequestMethod.POST)  
	  public void process(HttpServletRequest request,HttpServletResponse response) throws Exception 
	  { 	       
	     response.setContentType("application/json");
	     response.setCharacterEncoding("utf-8");
	     response.getWriter().write("{\"rate\":"+request.getSession().getAttribute("proInfo")+"}");         
	  }
	  
	  /*
	   * 单个删除文件函数
	   */
	  @RequestMapping(value = "/plan/deleteDoc")
	  public String deleteDoc(HttpServletRequest request,HttpServletResponse response, ModelMap model,String id,String type,String flag) throws IOException
	  {
		  PlanDocument planDocument = planDocumentService.findById(id);
		  String planId = planDocument.getPlan().getId();
		  planDocument.setPlan(null);
		  planDocument.setDeleted(true);
		  planDocumentService.update(planDocument);	  
		  model.addAttribute("flag", flag);
		  model.addAttribute("type", type);
		  model.addAttribute("id", planId);
		  return "redirect:show";
	  }
	  
	/*批量删除文件函数*/
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/plan/deleteDocBatch" ,method = RequestMethod.POST)
	public void deleteDocBatch(HttpServletResponse resp,HttpServletRequest request, ModelMap model,String flag) throws IOException {		
	 String Ids = request.getParameter("Ids");
	 String type = request.getParameter("type");
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
	 String success = "{\"type\":\""+type+"\"}";
	 resp.setContentType("application/json");
     resp.setCharacterEncoding("utf-8");
	 resp.getWriter().write(success);		
   }
}