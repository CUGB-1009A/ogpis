<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
</head>
<html >
<body >
<div id="wrapper" style="height:100%">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->	
	<div id="page-wrapper" style="height:98%;width:100%">	
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">	
				<li class="active">
				<c:if test="${international.companyName.equals('bp')}">BP公司</c:if>
				<c:if test="${international.companyName.equals('kp')}">壳牌公司</c:if>
				<c:if test="${international.companyName.equals('xfl')}">雪福龙公司</c:if>
				<c:if test="${international.companyName.equals('dde')}">道达尔公司</c:if>
				<c:if test="${international.companyName.equals('amfks')}">艾美浮克森公司</c:if>
				</li>
			</ul>
		</div>		
		
		<div>
			<script id="container" name="content" type="text/plain" style="height:400px" >${international.content}</script>
		    <!-- 配置文件 -->
		    <script type="text/javascript" src="<%=path%>/assets/UEditor/ueditor.config.js"></script>
		    <!-- 编辑器源码文件 -->
		    <script type="text/javascript" src="<%=path%>/assets/UEditor/ueditor.all.js"></script>
		    <!-- 实例化编辑器 -->
		    <script type="text/javascript">
		        var ue = UE.getEditor('container',
		        		 
		        			 {
		        	toolbars:[[]]
		        			 });
		    </script>
		 </div>
	</div>	
</div>
</body>

</html>
	