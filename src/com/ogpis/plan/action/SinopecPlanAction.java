package com.ogpis.plan.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.expando.entity.ClassName;
import com.ogpis.expando.entity.ExpandoColumn;
import com.ogpis.expando.entity.ExpandoTable;
import com.ogpis.expando.entity.ExpandoValue;
import com.ogpis.expando.service.ClassNameService;
import com.ogpis.expando.service.ExpandoColumnService;
import com.ogpis.expando.service.ExpandoTableService;
import com.ogpis.expando.service.ExpandoValueService;
import com.ogpis.plan.entity.SinopecPlan;
import com.ogpis.plan.service.SinopecPlanService;

@Controller
public class SinopecPlanAction {
	
	@Autowired
	private SinopecPlanService sinopecPlanService;

	@Autowired
	private ClassNameService classNameService;
	@Autowired
	private ExpandoTableService ExpandoTableService;

	@Autowired
	private ExpandoColumnService expandoColumnService;

	@Autowired
	private ExpandoValueService expandoValueService;
	
	@RequestMapping(value = "/plan/sinopec/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<SinopecPlan> sinopecPlans = sinopecPlanService
				.getSinopeclPlans(pageNo, pageSize);
		model.addAttribute("sinopecPlans", sinopecPlans);
		return "/plan/sinopec/list";
	}
	
	@RequestMapping(value = "/plan/sinopec/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		SinopecPlan sinopecPlan = this.sinopecPlanService.findById(id);

		ExpandoTable defaultTable = ExpandoTableService
				.getDefaultTable(SinopecPlan.class.toString());

		List<ExpandoValue> expandoValues = expandoValueService.getRowValues(
				defaultTable.getId(), id);
		Map<String, ExpandoValue> expandoValuesMap = new HashedMap();
		for (ExpandoValue value : expandoValues) {
			expandoValuesMap.put(value.getColumn().getName(), value);
		}

		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(SinopecPlan.class.toString());

		model.addAttribute("expandoValuesMap", expandoValuesMap);
		model.addAttribute("columns", columns);
		model.addAttribute("sinopecPlan", sinopecPlan);
		if(request.getParameter("flag").equals("2"))
			return "plan/sinopec/edit";//编辑（新建和修改）
		else
			return "plan/sinopec/view";//（查看）
	}
	
	@RequestMapping(value = "/plan/sinopec/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request, ModelMap model, String id) {
		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(SinopecPlan.class.toString());
		model.addAttribute("columns", columns);
		return "plan/sinopec/edit";
	}
	
	@RequestMapping(value = "/plan/sinopec/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model,
			SinopecPlan sinopecPlan, String id, boolean isAdd) {
		SinopecPlan bean = null;
		if (isAdd) {
			bean = new SinopecPlan();
		} else {
			bean = this.sinopecPlanService.findById(id);
		}
		bean.setPlanPeriod(sinopecPlan.getPlanPeriod());
		System.out.println("findByClassName");
		ClassName className = classNameService
				.findByClassName(SinopecPlan.class.toString());
		System.out.println("getDefaultTable");
		ExpandoTable table = ExpandoTableService
				.getDefaultTable(SinopecPlan.class.toString());
		System.out.println("getDefaultTableColumns");
		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(SinopecPlan.class.toString());
		Map<String, String> data = new HashedMap();

		for (ExpandoColumn column : columns) {
			String value = (String) request.getParameter(column.getName());
			data.put(column.getName(), value);
		}
		System.out.println("addValues");
		expandoValueService.addValues(className, table, columns, bean.getId(),
				data);
		System.out.println("addValue end");

		return "redirect:list";
	}


}
