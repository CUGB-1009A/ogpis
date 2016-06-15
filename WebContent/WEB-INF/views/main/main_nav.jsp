<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath();
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav pull-left" id="menuList" align="left">
        <shiro:hasPermission name="mainPage:link">
        <li>           
            <a href="<c:url value='/main'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-home"></i> 首页</a>
        </li>
        </shiro:hasPermission>
       
       <shiro:hasPermission name="nationalPlan:list">
         <li>
            <a href="<c:url value='/plan/national/list'/>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-star"></i> 全国规划<i></i></a>
         </li> 
        </shiro:hasPermission>
                         
        <shiro:hasPermission name="companyPlan">
         <li>
            <a href="#companyPlan" data-toggle="collapse" class="nav-header collapsed">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-list"></i> 公司规划 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="companyPlan" class="nav nav-list collapse secondmenu" style="height:0px;">
                <shiro:hasPermission name="zshPlan:list"> 
	                <li>
	                    <a href="<c:url value='/user/list'/>"><i class="glyphicon glyphicon-file"></i> 中石化规划 </a>
	                </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="zsyPlan:list"> 
	                <li>
	                    <a href="<c:url value='/user/list'/>"><i class="glyphicon glyphicon-file"></i> 中石油规划 </a>
	                </li>
                 </shiro:hasPermission>
                <shiro:hasPermission name="zlmPlan:list"> 
	                <li>
	                    <a href="<c:url value='/user/list'/>"><i class="glyphicon glyphicon-file"></i> 中联煤规划 </a>
	                </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="zhyPlan:list"> 
	                <li>
	                    <a href="<c:url value='/user/list'/>"><i class="glyphicon glyphicon-file"></i> 中海油规划 </a>
	                </li>
                </shiro:hasPermission>
                 <shiro:hasPermission name="ycPlan:list"> 
                <li>
                    <a href="<c:url value='/user/list'/>"><i class="glyphicon glyphicon-file"></i> 延长规划 </a>
                </li>
                </shiro:hasPermission>
            </ul>
        </li>           
       </shiro:hasPermission>   
       
        <shiro:hasPermission name="documentManagement">
          <li>
            <a href="#doc" data-toggle="collapse" class="nav-header collapsed">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-folder-close"></i> 文档管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="doc" class="nav nav-list collapse secondmenu" style="height:0px;">
               <shiro:hasPermission name="document:list">  
                <li>
                    <a href="<c:url value='/document/list'/>"><i class="glyphicon glyphicon-file"></i> 规划文档管理 </a>
                </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="document:trash">
                <li>
                    <a href="<c:url value='/document/trash'/>"><i class="glyphicon glyphicon-trash"></i> 文档回收站 </a>
                </li>
                </shiro:hasPermission>
            </ul>
        </li>
        </shiro:hasPermission> 
        
        <shiro:hasPermission name="systemManagement">
           <li>
            <a href="#sys" data-toggle="collapse" class="nav-header collapsed">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-cog"></i> 系统管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="sys" class="nav nav-list collapse secondmenu" style="height:0px;">
                <shiro:hasPermission name="user:list">
                <li>
                    <a href="<c:url value='/system/user/list'/>"><i class="glyphicon glyphicon-user"></i> 用户管理 </a>
                </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="role:list">
                 <li>
                    <a href="<c:url value='/system/role/list'/>"><i class="glyphicon glyphicon-lock"></i> 角色管理 </a>
                </li>
                </shiro:hasPermission>
                <shiro:hasPermission name="menu:list">
                <li>
           			 <a href="<c:url value='/menu/list?pageId=&&id=&&pageNo=1'/>"><i class="glyphicon glyphicon-list"></i> 菜单管理<i></i></a>
        		</li> 
        		</shiro:hasPermission>
            </ul>
        </li>
        </shiro:hasPermission>
    </ul>
</div>
<script type="text/javascript">
	/*
	 * 动态添加导航栏菜单
	 *@temp:是topmenu
	 */
 function addMenu(temp)
{
	if(temp.url!=null)
	{
	$('.'+temp.ID).append("<a href=\"<%=basePath%>/"+temp.url+ "\"><i class=\"fa fa-fw fa-tasks\"></i>"+temp.name+"<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>");	
	}
	else{
	  $('.'+temp.ID).append("<a href=\"javascript:;\" data-toggle=\"collapse\" data-target=\"#"+temp.ID+"\"><i class=\"fa fa-fw fa-tasks\"></i>"+temp.name+"<i class=\"fa fa-fw fa-caret-down\"></i></a><ul id=\""+temp.ID+"\" class=\"collapse\"></ul>");	
         for(var i=0;i<temp.submenu.length;i++)
       	  {
       	$("#"+temp.ID).append("<li class=\""+temp.submenu[i].ID+"\"}></li>");
       	  addMenu(temp.submenu[i]);
       	  }			
	}
} 

<%--   $(function(){	
	$.ajax({   
	     type : "post",   
	     url : "<%=request.getContextPath()%>/menuPrepared", 
	     dataType: "json", 
	     contentType: "application/json",  
	     success : function(data) { 
    	 if(data.state!="empty")
    		 {
	    		 for(var i=0;i<data.length;i++)
		    		 {
		    		 $("#menuList").append("<li class=\""+data[i].ID+"\"}></li>");
		    		 addMenu(data[i]);
		    		 }	
    		 }		    	    	 
	     },   
	     error :function(){   
	         alert("获取页面失败，请重试！");   
	     }   
	 });   
});	 --%> 
</script>