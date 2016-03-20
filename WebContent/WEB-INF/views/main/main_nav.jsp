<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
	pageEncoding="UTF-8"%>
<%
	String basePath = request.getContextPath();
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
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
            <a href="<%=basePath%>/menu/list" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-tasks"></i> 菜单管理<i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</i></a>

        </li>
    </ul>
</div>
<script type="text/javascript">

</script>