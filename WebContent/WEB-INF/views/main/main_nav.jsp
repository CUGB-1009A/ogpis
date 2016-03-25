<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav" id="menuList">
        <li class="active">
            <a href="<%=request.getContextPath()%>/main"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
        </li>
        <li>
            <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-tasks"></i> 系统管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="demo" class="collapse">
                <li>
                    <a href="<%=basePath%>/user/list"><i class="fa fa-fw fa-user"></i> 用户管理 </a>
                </li>
            </ul>
        </li>
        
          <li>
            <a href="<%=basePath%>/menu/list?id=&&currentPage=1"><i class="fa fa-fw fa-tasks"></i> 菜单管理<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>
          </li>         
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

 $(function(){	
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
});	
</script>