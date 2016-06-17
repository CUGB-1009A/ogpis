<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<div class="navbar-header">
	 <button type="button" class="navbar-toggle" data-toggle="collapse"
		data-target=".navbar-ex1-collapse">
		<span class="sr-only">Toggle navigation</span> <span class="icon-bar">dd</span>
		<span class="icon-bar">ss</span> <span class="icon-bar">aa</span>
	</button>
	<a class="navbar-brand"><span style="color:white">油气资源规划管理系统</span></a>
</div>
<!-- Top Menu Items -->
<ul class="nav navbar-right top-nav">
	<li class="dropdown"><a href="#" class="dropdown-toggle"
		data-toggle="dropdown"><i class="fa fa-user"></i> 欢迎,<shiro:principal/><b
			class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
			<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a></li>
			<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
			<li class="divider"></li>
			<li><a href="<c:url value='/logout'/>"><i class="fa fa-fw fa-power-off"></i> 注销</a></li>
		</ul>
	</li>
</ul>
