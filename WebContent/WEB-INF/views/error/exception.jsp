<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<html>
	<head>
		<title>exception</title>
		<meta charset="utf-8">
		<link href="<%=path%>/assets/error/css/style.css" rel="stylesheet" type="text/css"  media="all" />
	</head>
	<body style="background-color: white;background: none;">
		<!--start-wrap--->
		<div class="wrap">
			<!---start-header---->
				<!--<div class="header">
					<div class="logo">
						<h1><a href="#">åºéå¦ï¼</a></h1>
					</div>
				</div>-->
			<!---End-header---->
			<!--start-content------>
			<div class="content">
				<img src="<%=path%>/assets/error/images/error3.png" title="error" />
				<p>服务器发生异常了，请联系管理员</p>
				<a href="<%=path%>/plan/list?type=QG">返回首页</a>
   			</div>
			<!--End-Cotent------>
		</div>
		<!--End-wrap--->
	</body>
</html>

