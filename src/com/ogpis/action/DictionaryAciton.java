package com.ogpis.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.entity.Dictionary;
import com.ogpis.service.DictionaryService;

@Controller
public class DictionaryAciton {
	@Autowired
	private DictionaryService dictionaryService;

	@RequestMapping(value = "/dictionary/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<Dictionary> dictionaries = dictionaryService.getAllDictionaries(pageNo, pageSize);
		model.addAttribute("dicitonaries",dictionaries);
		return "dictionary/list";

}
}
