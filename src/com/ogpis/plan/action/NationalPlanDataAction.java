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
import com.ogpis.plan.entity.NationalPlanData;
import com.ogpis.plan.service.NationalPlanDataService;

@Controller
public class NationalPlanDataAction {

	@RequestMapping(value = "/plan/national/data/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<NationalPlanData> nationalPlans = nationalPlanService
				.getNationalPlans(pageNo, pageSize);
		model.addAttribute("nationalPlans", nationalPlans);
		return "/plan/national/data/list";
	}

	@RequestMapping(value = "/plan/national/data/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request, ModelMap model) {
		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(NationalPlanData.class.toString());
		model.addAttribute("columns", columns);
		return "/plan/national/data/edit";
	}

	@RequestMapping(value = "/plan/national/data/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		NationalPlanData nationalPlan = this.nationalPlanService.findById(id);

		ExpandoTable defaultTable = expandoTableService
				.getDefaultTable(NationalPlanData.class.toString());

		List<ExpandoValue> expandoValues = expandoValueService.getRowValues(
				defaultTable.getId(), id);
		Map<String, ExpandoValue> expandoValuesMap = new HashedMap();
		for (ExpandoValue value : expandoValues) {
			expandoValuesMap.put(value.getColumn().getName(), value);
		}

		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(NationalPlanData.class.toString());

		model.addAttribute("expandoValuesMap", expandoValuesMap);
		model.addAttribute("columns", columns);
		model.addAttribute("nationalPlan", nationalPlan);

		return "plan/national/data/edit";
	}

	@RequestMapping(value = "/plan/national/data/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model,
			NationalPlanData nationalPlan, String id, boolean isAdd) {
		NationalPlanData bean = null;
		if (isAdd) {
			bean = new NationalPlanData();
		} else {
			bean = this.nationalPlanService.findById(id);
		}
		bean.setPlanPeriod(nationalPlan.getPlanPeriod());
		bean.setPlanCode(nationalPlan.getPlanCode());
		if (isAdd) {
			nationalPlanService.save(bean);
		} else {
			nationalPlanService.update(bean);
		}
		ClassName className = classNameService
				.findByClassName(NationalPlanData.class.toString());
		ExpandoTable table = expandoTableService
				.getDefaultTable(NationalPlanData.class.toString());
		List<ExpandoColumn> columns = expandoColumnService
				.getDefaultTableColumns(NationalPlanData.class.toString());
		Map<String, String> data = new HashedMap();

		for (ExpandoColumn column : columns) {
			String value = (String) request.getParameter(column.getName());
			data.put(column.getName(), value);
		}
		expandoValueService.addValues(className, table, columns, id,
				data);

		return "redirect:list";
	}

	@Autowired
	private NationalPlanDataService nationalPlanService;
	@Autowired
	private ClassNameService classNameService;
	@Autowired
	private ExpandoTableService expandoTableService;
	@Autowired
	private ExpandoColumnService expandoColumnService;
	@Autowired
	private ExpandoValueService expandoValueService;
}
