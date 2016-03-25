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
	@SuppressWarnings("rawtypes")
	private ArrayList list=new ArrayList();

	
	/*
	 * 列表导航栏--菜单管理--按钮的入口，和下级菜单的响应
	 */
	@RequestMapping(value = "menu/list", method = RequestMethod.GET)
	public String list(String id,HttpServletRequest req,String currentPage) {
		List<MenuItem> menuList;
		int pagenumber=0;		
			if(id=="")//响应的是顶级菜单
			    {
				 menuList = MenuItemService.findTopMenu();
			    }
			else
				{
				 menuList = MenuItemService.findByParentId(id);
				}
			if(menuList.size()==0)
				req.setAttribute("totalPage", pagenumber);
			else
			req.setAttribute("menuList",listPage(currentPage,menuList));
			
			if(Math.floor(menuList.size()%5)==0)
	     		pagenumber = (int) Math.floor(menuList.size())/5;
		    else
		    	pagenumber = (int) Math.floor(menuList.size()/5)+1;				
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", pagenumber);
			req.setAttribute("pageId",id);
		
		return "menu/menuList";
	}
	
	/*
	 * 列表导航栏-返回显示的那一页的数据
	 */
	public  List<MenuItem>listPage(String currentPage,List<MenuItem> menuListTemp) {				
		int pagenumber;
		if(Math.floor(menuListTemp.size()%5)==0)
			pagenumber = (int) Math.floor(menuListTemp.size())/5;
		else
			pagenumber = (int) Math.floor(menuListTemp.size()/5)+1;
		List<MenuItem> menuList;		
		if(Integer.valueOf(currentPage).intValue()==pagenumber)
			menuList = menuListTemp.subList(5*(Integer.valueOf(currentPage).intValue()-1), menuListTemp.size());
		else
			menuList = menuListTemp.subList(5*(Integer.valueOf(currentPage).intValue()-1), 5*Integer.valueOf(currentPage).intValue());
		return menuList;
	}
	
	@RequestMapping(value = "menu/fenye", method = RequestMethod.GET)
	public String fenye(String pageId,HttpServletRequest req,String currentPage) {
		List<MenuItem> menuList ;
		if(pageId=="")
		    menuList = MenuItemService.findTopMenu();
		else
			menuList = MenuItemService.findByParentId(pageId);
		int pagenumber;
		if(Math.floor(menuList.size()%5)==0)
			pagenumber = (int) Math.floor(menuList.size())/5;
		else
			pagenumber = (int) Math.floor(menuList.size()/5)+1;
			req.setAttribute("pageId",pageId);
			req.setAttribute("menuList",listPage(currentPage,menuList));	
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("totalPage", pagenumber);
		return "menu/menuList";
	}
	
	/*
	 * 到添加或修改页面(共用一个界面)，id==null则为新建,同时设置flag=1，id！=null则为修改（同时准备回显数据）
	 */
	@RequestMapping(value = "menu/toAddMenuUI", method = RequestMethod.GET)
	public String toAddMenuUI(String pageId,String id,HttpServletRequest req,String currentPage) {
		if(id=="")//新建
		{
			req.setAttribute("flag", 1);
		}	       		
		else//修改
		{
			MenuItem menuItem = MenuItemService.findById(id);
			req.setAttribute("menuItem",menuItem);//回显数据
			req.setAttribute("flag", 2);	
		}
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageId",pageId);
		return "menu/menuUI";
	}
	
	@RequestMapping(value = "menu/save", method = RequestMethod.GET)
	public String save(String pageId,HttpServletRequest request,MenuItem menuItem,String currentPage) 
	{
		List<MenuItem> menuList;
		if(request.getParameter("hidden_id")=="")//新建一个菜单
		    {
				if(pageId=="")//首页新建，回到此菜单下的最后一页
				{
					menuItem.setFather(null);
				}	
				else
				{
					menuItem.setFather(MenuItemService.findById(pageId));
				}	
				MenuItemService.add(menuItem);
				if(pageId=="")
				{
					menuList=  MenuItemService.findTopMenu();
				}	
				else
				{
					menuList = MenuItemService.findByParentId(pageId);
				}
				int pagenumber;
				if(Math.floor(menuList.size()%5)==0)
					pagenumber = (int) Math.floor(menuList.size()/5);
				else
					pagenumber = (int) Math.floor(menuList.size()/5)+1;
			request.setAttribute("totalPage", pagenumber);
			request.setAttribute("menuList", listPage(pagenumber+"",menuList));
			request.setAttribute("currentPage", pagenumber);	
		    }
		else//修改一个菜单
			{
				MenuItem menuItem_old = MenuItemService.findById(request.getParameter("hidden_id"));
				menuItem_old.setName(menuItem.getName());
				menuItem_old.setDescription(menuItem.getDescription());
				menuItem_old.setPriority(menuItem.getPriority());
				menuItem_old.setUrl(menuItem.getUrl());
				MenuItemService.update(menuItem_old);
				if(pageId=="")
				{
					menuList=  MenuItemService.findTopMenu();
				}
				else
				{
					menuList = MenuItemService.findByParentId(pageId);
				}
				int pagenumber;
				if(Math.floor(menuList.size()%5)==0)
					pagenumber = (int) Math.floor(menuList.size()/5);
				else
					pagenumber = (int) Math.floor(menuList.size()/5)+1;
			request.setAttribute("totalPage", pagenumber);
			request.setAttribute("menuList", listPage(currentPage+"",menuList));
			request.setAttribute("currentPage", currentPage);	
			}
			 		
		request.setAttribute("pageId",pageId);	
		return "menu/menuList";
	}
	
	/*
	 * 软删除，设置deleted为true，同时删除所有子目录（也是软删除）
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menu/deleteMenu", method = RequestMethod.GET)
	public String deleteMenu(HttpServletRequest request,String pageId,String id,String currentPage) {		
		/*
		 * 批量软删除本节点及其下的所有节点
		 */
		deleteAllMenu(MenuItemService.findById(id));
		MenuItemService.updateAll(list);
		
		List<MenuItem> menuList;
		if(pageId=="")
			 menuList=  MenuItemService.findTopMenu();
		else
			 menuList = MenuItemService.findByParentId(pageId);	
		int pagenumber;
		if(Math.floor(menuList.size()%5)==0)
			pagenumber = (int) Math.floor(menuList.size()/5);
		else
			pagenumber = (int) Math.floor(menuList.size()/5)+1;
		if(pagenumber!=0)
		{
			if(Math.floor(menuList.size()%5)==0&&Integer.valueOf(currentPage).intValue()==(pagenumber+1))
			{
			request.setAttribute("currentPage", pagenumber);
			request.setAttribute("menuList",listPage(pagenumber+"",menuList));
			}
		else
		{
			request.setAttribute("menuList",listPage(currentPage,menuList));
			request.setAttribute("currentPage", currentPage);
		}
		}
		else
			request.setAttribute("currentPage", 1);	

	
			
		request.setAttribute("pageId",pageId);
		request.setAttribute("totalPage", pagenumber);
		return "menu/menuList";
	}
	
/*	@RequestMapping(value = "menu/nextMenu", method = RequestMethod.GET)
	public String nextMenu(String id,HttpServletRequest req,String currentPage) {
		List<MenuItem> menuList = MenuItemService.findByParentId(id);
		req.setAttribute("menuList", listPage(currentPage,menuList));
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage", (int) Math.ceil(menuList.size()/5)+1);
		req.setAttribute("pageId", id);
		return "menu/menuList";			
	}
	*/
	@RequestMapping(value = "menu/previousMenu", method = RequestMethod.GET)
	public String previousMenu(String pageId,HttpServletRequest req,String currentPage) {
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
		int pagenumber;
		if(Math.floor(menuList.size()%5)==0)
			pagenumber = (int) Math.floor(menuList.size()/5);
		else
			pagenumber = (int) Math.floor(menuList.size()/5)+1;
		if(menuList.size()==0)
			req.setAttribute("totalPage", 0);
		else
		    req.setAttribute("menuList", listPage(currentPage,menuList));	
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("totalPage",pagenumber);
		return "menu/menuList";			
	}
	
	/*
	 * 删除本节点及下所有子节点
	 */
	@SuppressWarnings("unchecked")
	private void deleteAllMenu(MenuItem menuItem){
		if(menuItem.getChildren().size()==0)
		{
			list.add("\'"+menuItem.getId()+"\'");
		}
		
		else
		{	
			list.add("\'"+menuItem.getId()+"\'");
			for(MenuItem temp:menuItem.getChildren())
			{				
				deleteAllMenu(temp);
			}
		}
}

		@RequestMapping(value = "menu/editToList", method = RequestMethod.GET)
		public String editToList(String pageId,HttpServletRequest req,String currentPage) {
			List<MenuItem> menuList;
			if(pageId=="")
				menuList= MenuItemService.findTopMenu();
			else
					
				menuList= MenuItemService.findByParentId(pageId);
			int pagenumber;
			if(Math.floor(menuList.size()%5)==0)
				pagenumber = (int) Math.floor(menuList.size()/5);
			else
				pagenumber = (int) Math.floor(menuList.size()/5)+1;
			if(menuList.size()==0)
				req.setAttribute("totalPage", 0);
			else	
				req.setAttribute("menuList", listPage(currentPage,menuList));
			req.setAttribute("currentPage",currentPage);
			req.setAttribute("pageId", pageId);
			req.setAttribute("totalPage", pagenumber);
			return "menu/menuList";			
			}

}
