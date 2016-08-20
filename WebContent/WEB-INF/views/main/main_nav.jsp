<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath();
    String timeStamp = System.currentTimeMillis()+"";
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div id="navDiv" class="collapse navbar-collapse navbar-ex1-collapse" align="left">
    <ul class="nav navbar-nav side-nav pull-left">   
         <li>
            <a href="<%=basePath%>/plan/list?timeStamp=<%=timeStamp%>&&type=QG&&condition=" class="menu"><i class="glyphicon glyphicon-star"></i> 全国五年规划<i></i></a>
         </li> 
         
          <li>
            <a href="<%=basePath%>/plan/list?type=358&&condition=" class="menu"><i class="glyphicon glyphicon-star"></i> “三五八”规划<i></i></a>
         </li> 
         
         <li>
            <a href="#companyPlan" data-toggle="collapse" class=" nav-header collapsed"><i class="glyphicon glyphicon-book"></i> 公司规划 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="companyPlan" class="nav nav-list collapse secondmenu" style="height:0px;">
                 <li>
		            <a href="<%=basePath%>/plan/list?type=ZSY&&condition=" ><i class="glyphicon glyphicon-file"></i> 中石油规划<i></i></a>
		         </li> 
		             
		         <li>
		            <a href="<%=basePath%>/plan/list?type=ZSH&&condition=" ><i class="glyphicon glyphicon-file"></i> 中石化规划<i></i></a>
		         </li> 
		         
		         <li>
		            <a href="<%=basePath%>/plan/list?type=ZHY&&condition="><i class="glyphicon glyphicon-file"></i> 中海油规划<i></i></a>
		         </li> 
		         
		         <li>
		            <a href="<%=basePath%>/plan/list?type=YC&&condition=" ><i class="glyphicon glyphicon-file"></i> 延长石油规划<i></i></a>
		         </li> 
		          
		          <li>
		            <a href="<%=basePath%>/plan/list?type=ZLM&&condition="><i class="glyphicon glyphicon-file"></i> 中联煤规划<i></i></a>
		         </li> 
		        
		         <%-- <li>
		            <a href="<%=basePath%>/plan/list?type=QT&&condition="><i class="glyphicon glyphicon-file"></i> 其它公司规划<i></i></a>
		         </li>  --%>
            </ul>
        </li>
        
         <li>
            <a href="#specialShow" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-facetime-video"></i> 专题展示 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="specialShow" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<c:url value='/special/list?mineType=1'/>" ><i class="glyphicon glyphicon-glass"></i> 石油 </a>
                </li>
                <li>
                    <a href="<c:url value='/special/list?mineType=2'/>" ><i class="glyphicon glyphicon-fire"></i> 天然气 </a>
                </li>
                <li>
                    <a href="<c:url value='/special/list?mineType=3'/>" ><i class="glyphicon glyphicon-fire"></i>煤层气 </a>
                </li>
                <li>
                    <a href="<c:url value='/special/list?mineType=4'/>" ><i class="glyphicon glyphicon-fire"></i> 页岩气 </a>
                </li>
            </ul>
        </li>
        
  <%--            <li>
            <a href="#international" data-toggle="collapse" class="nav-header collapsed" ><i class="glyphicon glyphicon-plane" ></i> 国际形势 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="international" class="nav nav-list secondmenu collapse" style="height:0px;" >
                <li>
            		<a href="<c:url value='/international/show?companyName=bp'/>" ><i class="glyphicon glyphicon-star"></i> 英国石油<i></i></a>
         		</li> 
                <li>
                    <a href="<c:url value='/international/show?companyName=kp'/>" ><i class="glyphicon glyphicon-star"></i> 壳牌 </a>
                </li>
                <li>
            		<a href="<c:url value='/international/show?companyName=xfl'/>" ><i class="glyphicon glyphicon-star"></i> 雪佛龙</a>
         		</li>
         		<li>
            		<a href="<c:url value='/international/show?companyName=dde'/>" "><i class="glyphicon glyphicon-star"></i> 道达尔<i></i></a>
         		</li>
         		<li>
            		<a href="<c:url value='/international/show?companyName=amfks'/>" ><i class="glyphicon glyphicon-star"></i> 埃克森美孚<i></i></a>
         		</li>
            </ul>
         </li> --%>
                 
         <li>           
            <a href="<c:url value='/main'/>"><i class="glyphicon glyphicon-heart" ></i> 我的收藏</a>
         </li>
       
    <%--     <shiro:hasPermission name="document:management">
          <li>
            <a href="#doc" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-folder-close"></i> 文档管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="doc" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<%=basePath%>/document/list?selectCondition=0"><i class="glyphicon glyphicon-file"></i> 规划文档管理 </a>
                </li>

                <li>
                    <a href="<c:url value='/document/trash'/>"><i class="glyphicon glyphicon-trash"></i> 文档回收站 </a>
                </li>
            </ul>
        </li>
        </shiro:hasPermission> 
        
        <shiro:hasPermission name="system:Management">
           <li>
            <a href="#sys" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-cog"></i> 系统管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="sys" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<c:url value='/system/user/list'/>"><i class="glyphicon glyphicon-user"></i> 用户管理 </a>
                </li>

                 <li>
                    <a href="<c:url value='/system/role/list'/>"><i class="glyphicon glyphicon-lock"></i> 角色管理 </a>
                </li>            
                <li>
           			 <a href="<c:url value='/menu/list?pageId=&&id=&&pageNo=1'/>"><i class="glyphicon glyphicon-list"></i> 菜单管理<i></i></a>
        		</li>
            </ul>
        </li>
        </shiro:hasPermission> --%>
    </ul>
</div>
<script type="text/javascript">
<%--  function addMenu(temp)
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
}  --%>

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