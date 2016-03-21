package com.ogpis.action;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.ogpis.entity.MenuItem;
import com.ogpis.service.MenuItemService;


@Controller
public class MenuAction {
	
	@Autowired
	private MenuItemService MenuItemService;
	private ArrayList list=new ArrayList();

	
	/*
	 * 列表导航栏--菜单管理--按钮的入口，只入口执行一次，获取当前顶级菜单
	 */
	@RequestMapping(value = "menu/list", method = RequestMethod.GET)
	public String list(HttpServletRequest req) {
		List<MenuItem> menuList = MenuItemService.findTopMenu();	
			req.setAttribute("pageId", "");
			req.setAttribute("menuList",menuList);	
		return "menu/menuList";
	}
	
	/*
	 * 到添加或修改页面(共用一个界面)，id==null则为新建,同时设置flag=1，id！=null则为修改（同时准备回显数据）
	 */
	@RequestMapping(value = "menu/toAddMenuUI", method = RequestMethod.GET)
	public String toAddMenuUI(String pageId,String id,HttpServletRequest req) {
		if(id=="")
		{
			req.setAttribute("flag", 1);
		}	       		
		else
		{
			MenuItem menuItem = MenuItemService.findById(id);
			req.setAttribute("menuItem",menuItem);//回显数据
			req.setAttribute("flag", 2);	
		}
		req.setAttribute("pageId",pageId);
		return "menu/menuUI";
	}
	
	@RequestMapping(value = "menu/save", method = RequestMethod.GET)
	public String save(String pageId,HttpServletRequest request,MenuItem menuItem) 
	{
		if(request.getParameter("hidden_id")=="")//新建一个菜单
		    {
				if(pageId=="")//首页新建
				{
					menuItem.setFather(null);
				}	
				else
				{
					menuItem.setFather(MenuItemService.findById(pageId));
				}			   
				MenuItemService.add(menuItem);
		    }
		else//修改一个菜单
			{
				MenuItem menuItem_old = MenuItemService.findById(request.getParameter("hidden_id"));
				menuItem_old.setName(menuItem.getName());
				menuItem_old.setDescription(menuItem.getDescription());
				menuItem_old.setPriority(menuItem.getPriority());
				menuItem_old.setUrl(menuItem.getUrl());
				MenuItemService.update(menuItem_old);
			}
		List<MenuItem> menuList;
		if(pageId=="")
			 menuList=  MenuItemService.findTopMenu();
		else
			 menuList = MenuItemService.findByParentId(pageId);
		request.setAttribute("menuList",menuList);
		request.setAttribute("pageId",pageId);
		return "menu/menuList";
	}
	
	/*
	 * 软删除，设置deleted为true，同时删除所有子目录（也是软删除）
	 */
	@RequestMapping(value = "/menu/deleteMenu", method = RequestMethod.GET)
	public String deleteMenu(HttpServletRequest request,String pageId,String id) {		
		/*
		 * 批量软删除本节点及其下的所有节点
		 */
		deleteAllMenu(MenuItemService.findById(id));
		System.out.println("执行完了一部");
		MenuItemService.updateAll(list);
		
		List<MenuItem> menuList;
		if(pageId=="")
			 menuList=  MenuItemService.findTopMenu();
		else
			 menuList = MenuItemService.findByParentId(pageId);
		request.setAttribute("menuList",menuList);
		request.setAttribute("pageId",pageId);
		System.out.println("=======================我执行完了！");
		return "menu/menuList";
	}
	
	@RequestMapping(value = "menu/nextMenu", method = RequestMethod.GET)
	public String nextMenu(String id,HttpServletRequest req) {
		List<MenuItem> menuList = MenuItemService.findByParentId(id);
		req.setAttribute("menuList", menuList);
		req.setAttribute("pageId", id);
		return "menu/menuList";			
	}
	
	@RequestMapping(value = "menu/previousMenu", method = RequestMethod.GET)
	public String previousMenu(String pageId,HttpServletRequest req) {
		//第一步
		MenuItem menuTemp = MenuItemService.findById(pageId);
		List<MenuItem> menuList;
		if(menuTemp.getFather()==null)	
			{
			menuList = MenuItemService.findTopMenu();
			req.setAttribute("pageId", "");
			}
		else
			{
			menuList = MenuItemService.findByParentId(menuTemp.getFather().getId());
			req.setAttribute("pageId", menuTemp.getFather().getId());
			}
		req.setAttribute("menuList", menuList);	
		return "menu/menuList";			
	}
	
	/*
	 * 删除本节点及下所有子节点
	 */
	private void deleteAllMenu(MenuItem menuItem){
		System.out.println("======================");
		if(menuItem.getChildren().size()==0)
		{
			System.out.println(menuItem.getName());
			list.add("\'"+menuItem.getId()+"\'");
		}
		
		else
		{	
			System.out.println(menuItem.getName());
			list.add("\'"+menuItem.getId()+"\'");
			for(MenuItem temp:menuItem.getChildren())
			{				
				deleteAllMenu(temp);
			}
		}
}

		@RequestMapping(value = "menu/editToList", method = RequestMethod.GET)
		public String editToList(String pageId,HttpServletRequest req) {
			List<MenuItem> menuList;
			if(pageId=="")
				menuList= MenuItemService.findTopMenu();
			else
					
				menuList= MenuItemService.findByParentId(pageId);
				req.setAttribute("menuList", menuList);
				req.setAttribute("pageId", pageId);
				return "menu/menuList";			
			}

}
