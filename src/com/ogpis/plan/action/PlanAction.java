package com.ogpis.plan.action;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
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
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.document.entity.PlanPicture;
import com.ogpis.document.service.PlanDocumentService;
import com.ogpis.index.entity.IndexDataManagement;
import com.ogpis.index.entity.IndexManagement;
import com.ogpis.index.service.IndexDataManagementService;
import com.ogpis.index.service.IndexManagementService;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.service.PlanService;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;


@Controller
public class PlanAction  {
	Logger log = Logger.getLogger(PlanAction.class);  

	@Autowired
	private PlanService planService;
	@Autowired
	private PlanDocumentService planDocumentService;
	@Autowired
	private IndexManagementService indexManagementService;
	@Autowired
	private IndexDataManagementService indexDataManagementService;
	@Autowired
	private UserService userService;
	
	@SuppressWarnings("rawtypes")
	private ArrayList idList=new ArrayList();
	
	/*
	 * 读取规划列表函数,根据type查询不同类型的规划
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/plan/list")
	public String list(HttpServletRequest request, ModelMap model, String type, String condition) {		
		 LinkedHashMap map ;
		 List<LinkedHashMap> mapList = new ArrayList<LinkedHashMap>();
		 //先判断当前用户是不是管理员 
		 String currentUserName = request.getUserPrincipal().getName();
	  	 User user = userService.findByUserName(currentUserName);
	  	 Set<Role> roles = user.getRoles();
	  	 boolean isManager = false ;
	  	 for(Role role:roles)
	  	 {
	  		 if(role.getIsSuper())
	  			 isManager = true;
	  	 }
		List<Plan> plans = planService.findAll(isManager,type, condition);//查询用户（或管理员）所有能看到的规划
		String conceredPlanId = ""; //将用户关注的规划用字符串连接起来
		for(Plan concern : user.getPlans())
		{
			conceredPlanId += concern.getId();
		}
		model.addAttribute("plansNumber", plans.size());//规划数量
		for(Plan temp:plans)
		{
			map = new LinkedHashMap();
			if(conceredPlanId.contains(temp.getId()))
				map.put(temp, true);//value = true 说明用户已经关注该规划
			else
				map.put(temp, false);//value = false 说明用户还没有关注该规划
			Set<PlanDocument> document = temp.getPlanDocument();
			map.put("planDocument", document);
			Set<PlanPicture> picture = temp.getPlanPicture();
			map.put("规划图片", picture);
			mapList.add(map);
		}
		model.addAttribute("mapList", mapList);//返回规划
		model.addAttribute("type", type);//返回公司名称
		model.addAttribute("condition", condition);//查询条件回显到前台
		return "plan/list";
	}
	
	/*
	 * 发布规划Ajax
	 * id 发布规划的id
	 */
	@RequiresPermissions(value={"plan:release"})
	@RequestMapping(value = "/plan/release")
	public void release(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("planId");
		Plan plan = planService.findById(id);
		plan.setReleased(true);
		planService.update(plan);
		String result = "{\"result\":\"success\"}";
	 	response.setContentType("application/json");
	 	response.setCharacterEncoding("utf-8");
	 	response.getWriter().write(result);		
	}
	
	/*
	 * 取消发布规划Ajax
	 *  id 取消发布规划的id
	 */
	@RequiresPermissions(value={"plan:release"})
	@RequestMapping(value = "/plan/disrelease")
	public void disrelease(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("planId");
		Plan plan = planService.findById(id);
		plan.setReleased(false);
		planService.update(plan);
		String result = "{\"result\":\"success\"}";
	 	response.setContentType("application/json");
	 	response.setCharacterEncoding("utf-8");
	 	response.getWriter().write(result);
	}
	
	/*
	 * 普通用户查看规划响应函数
	 */
	@RequestMapping(value = "/plan/showDetail")
	public String showDetail(HttpServletRequest request, ModelMap model,String id) {	
		Plan plan = planService.findById(id);
		model.addAttribute("plan", plan);
		Set<PlanDocument> planDocuments = plan.getPlanDocument();
		Set<IndexManagement> indexs = plan.getIndex();
		HashMap hasMap = new HashMap();
		List<IndexDataManagement> indexDataManagement;
		for(IndexManagement temp:indexs)
		{
			indexDataManagement = indexDataManagementService.findByIndexId(temp.getId());
			hasMap.put(temp,indexDataManagement);
		}
		request.setAttribute("map", hasMap);
		model.addAttribute("planDocuments", planDocuments);
		model.addAttribute("indexs", indexs);
		return "/plan/showDetail";	
	}
	
	/*
	 * 到添加规划页面
	 */
	@RequiresPermissions(value={"plan:add"})
	@RequestMapping(value = "/plan/toEditPage")
	public String toEditPage(HttpServletRequest request, ModelMap model,String type) {
		model.addAttribute("type", type);
		return "/plan/edit";	
	}
	
	/*
	 * 添加、修改规划函数
	 */
	@RequiresPermissions(value={"plan:add","plan:edit"},logical=Logical.OR)
	@RequestMapping(value = "/plan/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, boolean isAdd,ModelMap model,String id,Plan plan,String type) {		

		Plan bean = null;
		if(isAdd){
			bean = new Plan();
			bean.setPlanType(type);
			bean.setReleased(false);
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
	@RequiresPermissions(value={"plan:delete"})
	@RequestMapping(value = "/plan/deletePlan")
	public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("planId");
		System.out.println(id);
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
		String result = "{\"result\":\"success\"}";
	  	response.setContentType("application/json");
	  	response.setCharacterEncoding("utf-8");
	  	response.getWriter().write(result);	
	}
	
	@RequiresPermissions(value={"plan:edit"})
	@RequestMapping(value = "/plan/show")
	public String show(HttpServletRequest request, ModelMap model,String id,String type,String flag) {	
		HashMap hasMap = new HashMap();
		List<IndexDataManagement> indexDataManagement;
		Plan plan =  this.planService.findById(id);
		model.addAttribute("plan", plan);
		int pageSize = 6;
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		if(flag.equals("1"))
		{
			model.addAttribute("flag",1);
		}
		if(flag.equals("2"))
		{
			IPageList<PlanDocument> planDocumentSet = planDocumentService
					.getOnePlanDocument(pageNo, pageSize, plan.getId());
			model.addAttribute("planDocumentSet", planDocumentSet);
			model.addAttribute("flag",2);
		}		
		if(flag.equals("3"))
		{
			IPageList<IndexManagement> indexs = indexManagementService
					.getOnePlanIndexs(pageNo, pageSize, plan.getId());
			model.addAttribute("indexs",indexs);
			model.addAttribute("flag",3);
		}
		if(flag.equals("4"))
		{
			List<IndexManagement> indexs = indexManagementService
					.getOnePlanIndexs(plan.getId());
			for(IndexManagement temp:indexs)
			{
				indexDataManagement = indexDataManagementService.findByIndexId(temp.getId());
				hasMap.put(temp,indexDataManagement);
			}
			request.setAttribute("map", hasMap);
			model.addAttribute("tab4Indexs",indexs);
			model.addAttribute("flag",4);
		}
		if(flag.equals("5"))
		{
			model.addAttribute("flag",5);
		}
		model.addAttribute("type",type);			
		return  "/plan/detail";
	}

	/*
	 * 批量删除规划函数
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value={"plan:delete"})
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
	@RequiresPermissions(value={"plan:edit"})
	@RequestMapping(value = "/plan/uploadFiles",method = RequestMethod.POST)
	public void uploadFiles(String id,HttpServletResponse resp,HttpServletRequest request,ModelMap model) throws Exception {	
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
                
                //这里发现ie获取的是路径加文件名，chrome获取的是文件名，这里我们只需要文件名，所以有路径的要先去路径
                 
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
    			bean.setDocumentType("规划相关文档");
    			planDocumentList.add(bean);
    			planDocumentService.save(bean);
          }  
    }  		
	plan.setPlanDocument(planDocumentList);
	planService.update(plan);
	model.addAttribute("id", id);
	model.addAttribute("type",type);
	model.addAttribute("flag",2);
	resp.setContentType("application/json");
    resp.setCharacterEncoding("utf-8");
    resp.getWriter().write("{\"rate\":"+request.getSession().getAttribute("proInfo")+"}");

}
	
	/*
	 * Ajax获取进度函数
	 */
	  @RequiresPermissions(value={"plan:edit"})
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
	  @RequiresPermissions(value={"plan:edit","document:management"},logical=Logical.OR)
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
	 @RequiresPermissions(value={"plan:edit","document:management"},logical=Logical.OR)
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
	 planDocumentService.updateAll(idList);
	 String success = "{\"type\":\""+type+"\"}";
	 resp.setContentType("application/json");
     resp.setCharacterEncoding("utf-8");
	 resp.getWriter().write(success);		
   }
	
	 /*
	   * 关注规划
	   */
	  @RequestMapping(value = "/plan/concern")
	  public void concern(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException
	  {
	  	 String result = "";
	  	 String currentUserName = request.getUserPrincipal().getName();
	  	 User user = userService.findByUserName(currentUserName);	  	 
	  	 String planId = request.getParameter("planId");
	  	 Set<Plan> plans = user.getPlans();
	  	 Set<Plan> planConcern = new HashSet<Plan>() ;
	  	 Plan plan = planService.findById(planId);
	  	 for(Plan temp:plans)
	  	 {
	  		 planConcern.add(temp);
	  	 }
	  		 planConcern.add(plan);
	  		 user.getPlans().clear();
	  		 user.setPlans(planConcern);
	  		 userService.update(user);
	  		 result = "{\"result\":\"success\"}";
	  	 response.setContentType("application/json");
	  	 response.setCharacterEncoding("utf-8");
	  	 response.getWriter().write(result);	 
	  }
	  
	  /*
	   * 取消关注
	   */
	  @RequestMapping(value = "/plan/disconcern")
	  public void disconcern(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws IOException
	  {
		 String currentUserName = request.getUserPrincipal().getName();
	  	 User user = userService.findByUserName(currentUserName);	  	 
	  	 String planId = request.getParameter("planId");
	  	 Set<Plan> plans = user.getPlans();
	  	 Set<Plan> planConcern = new HashSet<Plan>() ;
	  	 for(Plan temp:plans)
	  	 {	  		 
	  		 if(!temp.getId().equals(planId))
	  		 {
	  			planConcern.add(temp);
	  		 }
	  	 }
	  		 user.getPlans().clear();
	  		 user.setPlans(planConcern);
	  		 userService.update(user);
	  	 String result = "{\"result\":\"success\"}";
	  	 response.setContentType("application/json");
	  	 response.setCharacterEncoding("utf-8");
	  	 response.getWriter().write(result);	 
	  }
}
