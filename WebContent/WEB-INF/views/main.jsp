<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- wrapper -->
<div id="wrapper">
	<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<%@ include file="main/main_header.jsp"%>
<!-- 		<div id="fmain_header"></div> -->
		<%@ include file="main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	<div id="page-wrapper" style="height: 100%;">
		<div class="container-fluid">
			<%@ include file="main/main_center.jsp"%>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">

$(function(){
<%-- 	$("#main_header").load("<%=path%>/main_header"); --%>
<%-- 	$("#main_nav").load("<%=path%>/main_nav"); --%>
<%-- 	$("#main_center").load("<%=path%>/main_center"); --%>
});

</script>
</html>


