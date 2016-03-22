package com.ogpis.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.dao.MenuItemDao;
import com.ogpis.dao.OrganizationDao;
import com.ogpis.entity.MenuItem;
import com.ogpis.service.MenuItemService;

@Service
public class MenuItemServiceImpl extends BaseServiceImpl<MenuItem, String>
		implements MenuItemService {
	
	@Autowired
	private MenuItemDao MenuItemDao;


	@Autowired
	protected void setMenuItemDao(MenuItemDao menuItemDao) {
		setBaseDao(menuItemDao);
	}

	@Override
	public List<MenuItem> findTopMenu() {
		return MenuItemDao.findTopMenu();
	}

	@Override
	public List<MenuItem> findByParentId(String id) {
		// TODO Auto-generated method stub
		return MenuItemDao.findByParentId(id);
	}

	@Override
	public void updateAll(List<String> list) {
		// TODO Auto-generated method stub
		MenuItemDao.updateAll(list);
	}
	
	@Override
	public String menuToJson() {
		List<MenuItem> menuTop = findTopMenu();
		String menu_json = "[";
		for(MenuItem temp:menuTop)
		{
			menu_json+=oneMenuToJson(temp);
			menu_json+=",";		
		}
		 menu_json=menu_json.substring(0, menu_json.length()-1);
		menu_json+="]";
		System.out.println(menu_json);
		return menu_json;
	}
	/**
	 * 将temp下的所有菜单写成json
	 * @param temp 
	 * @return
	 */
	public String oneMenuToJson(MenuItem temp) 
	{
	  String menu_json="";
      if(temp.getChildren().size()==0)
    	  menu_json+="{\"name\":\""+temp.getName()+"\",\"ID\":\""+temp.getId()+"\",\"url\":\""+temp.getUrl()+"\"}";
      else
      {
    	  menu_json+="{\"name\":\""+temp.getName()+"\",\"ID\":\""+temp.getId()+"\",\"submenu\":[";
    	  List<MenuItem> tempChild = MenuItemDao.findByParentId(temp.getId());
    	  for(MenuItem subTemp:tempChild)
    	  {	
    		  if(subTemp.getDeleted()==false)
    		  {
        		  menu_json+=oneMenuToJson(subTemp);
        		  menu_json+=",";  
    		  }  		  
    	  }
    	  menu_json=menu_json.substring(0, menu_json.length()-1);
    	  menu_json+="]}";
      }
		return menu_json;
	}

}
