<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
     <%
       
    %>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/dist/echarts.js"></script>
    	<script type="text/javascript" src="<%=path%>/assets/js/webuploader.js"></script>
    	<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/AdminLTE.css">
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/_all-skins.min.css">	
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/blue.css">
		<link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
</head>
<html>
<body>
	<div id="wrapper" style="height:100%">
		<!-- 网站头及导航栏 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
			<%@ include file="../main/main_header.jsp"%>
			<%@ include file="../main/main_nav.jsp"%>
		</nav>
		
			<!--网页主体 -->	
		<div id="page-wrapper" style="height:98%;width:100%">		
			<div class="row">
	            <div class="col-md-12">
						<div class="portlet-title">
							<h1>
								<c:if test="${mineType.equals('1')}">石油专题</c:if>
								<c:if test="${mineType.equals('2')}">天然气专题</c:if>
								<c:if test="${mineType.equals('3')}">煤层气专题</c:if>
								<c:if test="${mineType.equals('4')}">页岩气专题</c:if>
							</h1>
						</div>
							<div class="portlet-body">
								<div class="table-toolbar" style="text-align: right;">
									<div class="btn-group">
										<textArea>${result}</textArea>
									</div>
								</div>
							</div>
	            </div>
			</div>
		</div>	
	</div>
	<script type="text/javascript">
		
	</script>
</body>

</html>