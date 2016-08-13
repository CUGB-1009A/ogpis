package com.ogpis.international.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.base.action.BaseAction;
import com.ogpis.international.entity.International;
import com.ogpis.international.service.InternationalService;
@Controller
public class InternationalAction extends BaseAction {
	
	@Autowired InternationalService internationalService ;
	@RequestMapping(value = "/international/edit")
	public String edit(HttpServletRequest request, ModelMap model,String companyName){
			super.addMenuParams(request, model);
			International international = internationalService.findByCompanyName(companyName);	
			model.addAttribute("international",international);
			return "international/edit";
			}
	@RequestMapping(value = "/international/save")
	public String save(HttpServletRequest request, ModelMap model,String companyName,String content){
			super.addMenuParams(request, model);
			International international = internationalService.findByCompanyName(companyName);	
			international.setContent(content);
			internationalService.update(international);
			model.addAttribute("international",international);
			return "international/edit";
			}
	@RequestMapping(value = "/international/show")
	public String show(HttpServletRequest request, ModelMap model,String companyName){
			super.addMenuParams(request, model);
			International international = internationalService.findByCompanyName(companyName);	
			model.addAttribute("international",international);
			return "international/show";
			}
		

}
