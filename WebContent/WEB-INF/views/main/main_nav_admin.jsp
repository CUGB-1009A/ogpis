<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath();
    String timeStamp = System.currentTimeMillis()+"";
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse" align="left">
    <ul class="nav navbar-nav side-nav pull-left">
         <li>
            <a href="<%=basePath%>/plan/list?type=All&&condition="><i class="glyphicon glyphicon-star"></i> 规划管理<i></i></a>
         </li>
         
          <li>
            <a href="#index" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-list"></i> 指标管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="index" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
            		<a href="<c:url value='/index/list?type=QG'/>"><i class="glyphicon glyphicon-star"></i> 指标项管理<i></i></a>
         		</li> 
                <li>
                    <a href="<c:url value='/indexData/list?type=QG&&id=0'/>"><i class="glyphicon glyphicon-pencil"></i> 完成情况管理 </a>
                </li>
            </ul>
         </li>
                 

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
        
           <li>
            <a href="#sys" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-cog"></i> 系统管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="sys" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<c:url value='/system/user/list'/>"><i class="glyphicon glyphicon-user"></i> 用户管理 </a>
                </li>

                 <li>
                    <a href="<c:url value='/system/role/list'/>"><i class="glyphicon glyphicon-lock"></i> 角色管理 </a>
                </li>            
            </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">

</script>