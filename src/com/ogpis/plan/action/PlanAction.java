package com.ogpis.plan.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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

import org.apache.catalina.tribes.util.Arrays;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.poi.util.ArrayUtil;
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

import com.ogpis.base.AddDefaultIndex;
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
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.entity.Plan_Index;
import com.ogpis.plan.service.PlanService;
import com.ogpis.plan.service.Plan_IndexService;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

@Controller
public class PlanAction {
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
	@Autowired
	private Plan_IndexService plan_IndexService;

	@SuppressWarnings("rawtypes")
	private ArrayList idList = new ArrayList();
	/*
	 * 读取规划列表函数,根据type查询不同类型的规划
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/plan/list")
	public String list(HttpServletRequest request, ModelMap model, String type,
			String condition) {
		LinkedHashMap map;
		List<LinkedHashMap> mapList = new ArrayList<LinkedHashMap>();
		// 先判断当前用户是不是管理员
		String currentUserName = request.getUserPrincipal().getName();
		User user = userService.findByUserName(currentUserName);
		Set<Role> roles = user.getRoles();
		boolean isManager = false;
		for (Role role : roles) {
			if (role.getIsSuper())
				isManager = true;
		}
		List<Plan> plans = planService.findAll(isManager, type, condition);// 查询用户（或管理员）所有能看到的规划
		String conceredPlanId = ""; // 将用户关注的规划用字符串连接起来
		for (Plan concern : user.getPlans()) {
			conceredPlanId += concern.getId();
		}
		model.addAttribute("plansNumber", plans.size());// 规划数量
		for (Plan temp : plans) {
			map = new LinkedHashMap();
			map.put("plan", temp);
			if (conceredPlanId.contains(temp.getId()))
				map.put("isconcerned", true);// value = true 说明用户已经关注该规划
			else
				map.put("isconcerned", false);// value = false 说明用户还没有关注该规划
			Set<PlanDocument> document = temp.getPlanDocument();
			map.put("planDocument", document);
			mapList.add(map);
		}
		model.addAttribute("mapList", mapList);// 返回规划
		model.addAttribute("type", type);// 返回公司名称
		model.addAttribute("condition", condition);// 查询条件回显到前台
		if (isManager)
			return "plan/admin/list";
		else
		{
			model.addAttribute("listType","user");
			return "plan/user/list";
		}
			
	}

	@RequestMapping(value = "/plan/user_detail")
	public String user_detail(HttpServletRequest request, ModelMap model,
			String id,String listType) {
		Plan plan = planService.findById(id);
		model.addAttribute("plan", plan);
		model.addAttribute("type", plan.getPlanType());
		model.addAttribute("listType",listType);
		/*
		 * model.addAttribute("charts2", result2); model.addAttribute("charts3",
		 * result3);
		 */
		return "plan/user/detail";
	}

	/*
	 * 发布规划Ajax id 发布规划的id
	 */
	@RequiresPermissions(value = { "plan:release" })
	@RequestMapping(value = "/plan/release")
	public void release(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
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
	 * 取消发布规划Ajax id 取消发布规划的id
	 */
	@RequiresPermissions(value = { "plan:release" })
	@RequestMapping(value = "/plan/disrelease")
	public void disrelease(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
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
	 * 管理员以用户的视角看规划
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "/plan/preview")
	public String preview(HttpServletRequest request, ModelMap model,
			String id) {
		LinkedHashMap map = new LinkedHashMap();
		List<LinkedHashMap> mapList = new ArrayList<LinkedHashMap>();
		Plan plan = planService.findById(id);
		map.put("plan", plan);
		mapList.add(map);
		model.addAttribute("mapList", mapList);
		model.addAttribute("listType","preview");
		return "/plan/user/list";
	}

	/*
	 * 到添加规划页面
	 */
	@RequiresPermissions(value = { "plan:add" })
	@RequestMapping(value = "/plan/toEditPage")
	public String toEditPage(HttpServletRequest request, ModelMap model,
			String type) {
		//PlanType[] planType = PlanType.values();
		model.addAttribute("planType",PlanType.values());
		model.addAttribute("type", type);
		return "/plan/admin/add";
	}

	/*
	 * 添加、修改规划函数
	 */
	@RequiresPermissions(value = { "plan:add", "plan:edit" }, logical = Logical.OR)
	@RequestMapping(value = "/plan/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, boolean isAdd,
			ModelMap model, String id, Plan plan, String type,String indexIds) {
		Plan bean = null;			
		if (isAdd) {
			bean = new Plan();
			bean.setPlanType(type);
			bean.setReleased(false);
		} else {
			bean = planService.findById(id);
		}
		bean.setPlanName(plan.getPlanName());
		bean.setPlanShortDescription(plan.getPlanShortDescription());
		bean.setTargetAndFinished(plan.getTargetAndFinished());
		bean.setOutputDescription(plan.getOutputDescription());
		bean.setStorageDescription(plan.getOutputDescription());
		//bean.setPlanType(type);
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
			return "redirect:list";
		} else {
			planService.update(bean);
			model.addAttribute("id", bean.getId());
			model.addAttribute("flag", 1);
			return "redirect:show";
		}
	}

	/*
	 * 单个删除规划函数,同时软删除对应规划文档
	 */
	@RequiresPermissions(value = { "plan:delete" })
	@RequestMapping(value = "/plan/deletePlan")
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String id = request.getParameter("planId");
		System.out.println(id);
		Plan plan = planService.findById(id);
		plan.setDeleted(true);
		Set<PlanDocument> planDocumentSet = plan.getPlanDocument();
		for (PlanDocument temp : planDocumentSet) {
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

	@RequiresPermissions(value = { "plan:edit" })
	@RequestMapping(value = "/plan/show")
	public String show(HttpServletRequest request,
			HttpServletResponse response, ModelMap model, String id,
			String flag) throws UnsupportedEncodingException {
		HashMap hasMap = new HashMap();
		List<IndexDataManagement> indexDataManagement;
		Plan plan = this.planService.findById(id);
		model.addAttribute("plan", plan);
		int pageSize = 6;
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		if (flag.equals("1")) {
			model.addAttribute("flag", 1);
		}
		if (flag.equals("2")) {
			IPageList<PlanDocument> planDocumentSet = planDocumentService
					.getOnePlanDocument(pageNo, pageSize, plan.getId());
			model.addAttribute("planDocumentSet", planDocumentSet);
			model.addAttribute("flag", 2);
		}
		if (flag.equals("3")) {
			// IPageList<IndexManagement> indexs =
			// indexManagementService.getOnePlanIndexs(pageNo, pageSize,
			// plan.getId());
			//System.out.println("size: " + plan.getPlan_indexs().size());
			//System.out.println("type: " + type);

			//这里要加入指标类型的筛选，确定是全国的还是各公司的
			List<IndexManagement> allIndexs = indexManagementService.findAllIndexByPriority(plan.getPlanType());
			model.addAttribute("allIndexs", allIndexs);
			model.addAttribute("plan_indexs", plan.getPlan_indexs());
			model.addAttribute("flag", 3);
		}
		if (flag.equals("4")) {
			List<IndexManagement> indexs = indexManagementService
					.getOnePlanIndexs(plan.getId());
			for (IndexManagement temp : indexs) {
				indexDataManagement = indexDataManagementService
						.findByIndexId(temp.getId());
				hasMap.put(temp, indexDataManagement);
			}
			request.setAttribute("map", hasMap);
			model.addAttribute("tab4Indexs", indexs);
			model.addAttribute("flag", 4);
		}
		if (flag.equals("5")) {
			model.addAttribute("flag", 5);
		}
		model.addAttribute("type", plan.getPlanType());
		return "/plan/admin/detail";
	}

	/*
	 * 批量删除规划函数
	 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value = { "plan:delete" })
	@RequestMapping(value = "/plan/deleteBatch", method = RequestMethod.POST)
	public void deleteBatch(HttpServletResponse resp,
			HttpServletRequest request, ModelMap model) throws IOException {
		String Ids = request.getParameter("Ids");
		idList.clear();
		String idTemp;
		while (Ids.length() > 1) {
			idTemp = Ids.substring(0, Ids.indexOf(","));
			Ids = Ids.substring(Ids.indexOf(",") + 1, Ids.length());
			idList.add("\'" + idTemp + "\'");
		}
		planService.updateAll(idList);
		for (int i = 0; i < idList.size(); i++) {
			Plan plan = planService.findById(idList.get(i).toString()
					.substring(1, idList.get(i).toString().length() - 1));
			Set<PlanDocument> planDocumentSet = plan.getPlanDocument();
			for (PlanDocument temp : planDocumentSet) {
				temp.setDeleted(true);
				temp.setPlan(null);
				planDocumentService.update(temp);
			}
		}
		String success = "{\"result\":\"success\"}";
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);
	}

	/*
	 * 提交上传文件表单函数
	 */
	@SuppressWarnings("rawtypes")
	@RequiresPermissions(value = { "plan:edit" })
	@RequestMapping(value = "/plan/uploadFiles")
	public void uploadFiles(HttpServletResponse resp,
			HttpServletRequest request, ModelMap model) throws Exception {
		float fileSize = 0;
		String[] fileSizeUnit = { "B","KB","MB","GB","TB" };
		final HttpSession hs = request.getSession();

		String id = request.getParameter("planId");
		System.out.println("---id: " + id);
		Plan plan = planService.findById(id);
		String type = request.getParameter("type");
		// Set<PlanDocument> planDocumentList = new HashSet<PlanDocument>();

		// if (plan.getPlanDocument() != null)
		// planDocumentList.addAll(plan.getPlanDocument());

		PlanDocument bean = null;
		request.setCharacterEncoding("utf-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			resp.sendRedirect("show?id=" + id + "&&flag=2");
		}
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);

		upload.setProgressListener(new ProgressListener() {
			public void update(long pBytesRead, long pContentLength, int pItems) {
				int rate = Math.round(new Float(pBytesRead)
						/ new Float(pContentLength) * 100);
				hs.setAttribute("proInfo", rate);
			}
		});
		List items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		while (iter.hasNext()) // 表单中有几个input标签，就循环几次
		{
			FileItem item = (FileItem) iter.next();
			if (item.isFormField()) {

			} else {
				bean = new PlanDocument();
				String fileName = item.getName();
				fileSize = item.getSize();
				// 这里发现ie获取的是路径加文件名，chrome获取的是文件名，这里我们只需要文件名，所以有路径的要先去路径
				fileName = fileName.substring(fileName.lastIndexOf("\\") + 1,
						fileName.length());
				String prefix = System.currentTimeMillis() + "";
				File file = new File(request.getServletContext().getRealPath("/")+ "planFileUpload\\"+ type);
				if(!file.exists())
					file.mkdirs();
				File uploadedFile = new File(request.getServletContext()
						.getRealPath("/")
						+ "planFileUpload\\"
						+ type
						+ "\\"
						+ prefix + fileName);
				item.write(uploadedFile);
				bean.setDocumentAddress("planFileUpload\\" + type + "\\"
						+ prefix + fileName);
				/*bean.setDocumentDescription(fileDescription);*/
				bean.setUploadDate(new Date());
				int i = 0;//记录除了多少次1024，为了用0-1024间的数字+合适的单位来表示文件的大小
				while(fileSize>1024)
				{
					fileSize = fileSize /1024 ;
					i++;
					if(i==4)
						break;
				}		
				bean.setDocumentSize((float)(Math.round(fileSize*100)/100) + fileSizeUnit[i]);
				bean.setDocumentName(fileName);
				bean.setPlan(plan);
				bean.setDocumentType(fileName.substring(fileName.lastIndexOf(".")+1,fileName.length()));
				/* planDocumentList.add(bean); */
				planDocumentService.save(bean);
			}
		}
		/*
		 * plan.setPlanDocument(planDocumentList); planService.update(plan);
		 */
		model.addAttribute("id", id);
		model.addAttribute("type", type);
		model.addAttribute("flag", 2);
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(
				"{\"rate\":" + request.getSession().getAttribute("proInfo")
						+ "}");

	}

	/*
	 * Ajax获取进度函数
	 */
	@RequiresPermissions(value = { "plan:edit" })
	@RequestMapping(value = "/plan/process.json", method = RequestMethod.POST)
	public void process(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(
				"{\"rate\":" + request.getSession().getAttribute("proInfo")
						+ "}");
	}

	/*
	 * 单个删除文件函数
	 */
	@RequiresPermissions(value = { "plan:edit", "document:management" }, logical = Logical.OR)
	@RequestMapping(value = "/plan/deleteDoc")
	public String deleteDoc(HttpServletRequest request,
			HttpServletResponse response, ModelMap model, String id,
			String type, String flag) throws IOException {
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

	/* 批量删除文件函数 */
	@SuppressWarnings("unchecked")
	@RequiresPermissions(value = { "plan:edit", "document:management" }, logical = Logical.OR)
	@RequestMapping(value = "/plan/deleteDocBatch", method = RequestMethod.POST)
	public void deleteDocBatch(HttpServletResponse resp,
			HttpServletRequest request, ModelMap model, String flag)
			throws IOException {
		String Ids = request.getParameter("Ids");
		String type = request.getParameter("type");
		String idTemp;
		while (Ids.length() > 1) {
			idTemp = Ids.substring(0, Ids.indexOf(","));
			Ids = Ids.substring(Ids.indexOf(",") + 1, Ids.length());
			idList.add("\'" + idTemp + "\'");
		}
		planDocumentService.updateAll(idList);
		String success = "{\"type\":\"" + type + "\"}";
		resp.setContentType("application/json");
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);
	}

	/*
	 * 关注规划
	 */
	@RequestMapping(value = "/plan/concern")
	public void concern(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws IOException {
		String result = "";
		String currentUserName = request.getUserPrincipal().getName();
		User user = userService.findByUserName(currentUserName);
		String planId = request.getParameter("planId");
		Set<Plan> plans = user.getPlans();
		Set<Plan> planConcern = new HashSet<Plan>();
		Plan plan = planService.findById(planId);
		for (Plan temp : plans) {
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
	public void disconcern(HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws IOException {
		String currentUserName = request.getUserPrincipal().getName();
		User user = userService.findByUserName(currentUserName);
		String planId = request.getParameter("planId");
		Set<Plan> plans = user.getPlans();
		Set<Plan> planConcern = new HashSet<Plan>();
		for (Plan temp : plans) {
			if (!temp.getId().equals(planId)) {
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

	/*
	 * 修改目标值
	 */
	@RequestMapping(value = "/plan/admin/targetValueEdit")
	public String targetValueEdit(String planId, String indexId, ModelMap model)
			throws IOException {
		System.out.println("planId  " + planId);
		System.out.println("indexId  " + indexId);

		Plan_Index plan_Index = plan_IndexService.findByP_I(planId, indexId);
		model.addAttribute("plan_Index", plan_Index);
		return "/plan/admin/index/edit";
	}

	/*
	 * 保存目标值
	 */
	@RequestMapping(value = "/plan/admin/savePlan_Index", method = RequestMethod.POST)
	public String savePlan_Index(String plan_IndexId,Plan_Index plan_Index,
			 ModelMap model) {
		Plan_Index bean = plan_IndexService.findById(plan_IndexId);
		if (bean != null) {
			bean.setTargetValue(plan_Index.getTargetValue());
			bean.setIndexPerformance(plan_Index.getIndexPerformance());
		}
		plan_IndexService.update(bean);
		model.addAttribute("id", bean.getPlan().getId());
		model.addAttribute("flag", 3);
		model.addAttribute("type", bean.getPlan().getPlanType());
		return "redirect:/plan/show";

	}

	@RequestMapping(value = "/plan/admin/deleteIndex")
	public String deleteIndex(HttpServletRequest request, ModelMap model,
			String planId, String indexId, String type) {
		Plan_Index plan_Index = plan_IndexService.findByP_I(planId, indexId);
		if (plan_Index != null) {
			plan_IndexService.delete(plan_Index.getId());
		}
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type", type);
		return "redirect:/plan/show";
	}

	@RequestMapping(value = "/plan/admin/selectIndex")
	public String selectIndex(HttpServletRequest request, ModelMap model,
			String type, String planId, String[] indexIds) {
		System.out.println("planId " + planId);
		System.out.println("indexIds " + Arrays.toString(indexIds));
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type", type);
		List<IndexManagement> indexs = new ArrayList<IndexManagement>();
		IndexManagement index = null;
		if(indexIds!=null&&indexIds.length>0){
			for (String indexId : indexIds) {
				index = indexManagementService.findById(indexId);
				if (index != null) {
					indexs.add(index);
				}
			}
		}
		Plan plan = planService.findById(planId);
		plan_IndexService.batchAdd(plan, indexs);
		return "redirect:/plan/show";

	}

}
