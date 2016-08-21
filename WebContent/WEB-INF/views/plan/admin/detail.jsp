<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/assets/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path%>/assets/js/webuploader.js"></script>
    <title>油气资源规划信息系统</title>
    <%
   		 String type = request.getAttribute("type").toString();
         String flag = request.getAttribute("flag").toString();
    %>
</head>
<html>
<body>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="<%=path%>/assets/ckeditor/ckeditor.js"></script>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->
<div id="page-wrapper" style="height:100%">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-star "></i>
					<a href="<c:url value='/plan/list?condition='/>" class="menu">规划管理</a>
				</li>
				<li class="active">规划编辑</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12" style="margin:0;padding:0">
				<ul id="myTab" class="nav nav-tabs">
					<li <c:if test='<%=flag.equals("1") %>'>class="active"</c:if>>
						<a href="<c:url value='/plan/show?type=${type}&id=${plan.id}&flag=1'/>" class="menu">规划概述</a>
					</li> 	
					<li <c:if test='<%=flag.equals("2") %>'>class="active current"</c:if>>
						<a href="<c:url value='/plan/show?type=${type}&id=${plan.id}&flag=2'/>" class="menu">文档资料</a>
					</li> 
					<li <c:if test='<%=flag.equals("3") %>'>class="active current"</c:if>>
						<a href="<c:url value='/plan/show?type=${type}&id=${plan.id}&flag=3'/>" class="menu">规划指标</a>
					</li> 	
				</ul>
				
				<div id="myTabContent" class="tab-content">
					<%@ include file="Tab1Detail.jsp"%>
					<%@ include file="Tab2Doc.jsp"%>
<%-- 					<%@ include file="Tab3Index.jsp"%> --%>
					<%@ include file="index/list.jsp"%>
					<%-- <%@ include file="Tab4Complete.jsp"%>
					<%@ include file="Tab5Track.jsp"%>	 --%>	
				</div>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
var uploader ;
var flag = ${flag} ;
var id = "${plan.id}";
var type = "${type}";
 

/* 回显时间和规划描述字段，去掉时分秒（虽然在库中没有，但获取的时候自动添0了) */
var endtime = '${plan.endTime}';
var starttime = '${plan.startTime}';
var releasedate = '${plan.releaseDate}';
endtime = endtime.substring(0,endtime.indexOf(' '));
starttime = starttime.substring(0,starttime.indexOf(' '));
releasedate = releasedate.substring(0,releasedate.indexOf(' '));
$(function(){
	document.getElementById("form-field-4").value = releasedate ;
	document.getElementById("form-field-5").value = starttime ;
	document.getElementById("form-field-6").value = endtime ;	
});

 $(function(){
	var flag=${flag};
	if(flag==1)
		$("#overview").toggleClass("in active"); 
	if(flag==2)
		$("#document").toggleClass("in active"); 
	if(flag==3)
		$("#indexEntry").toggleClass("in active"); 
	if(flag==4)
		$("#completeEntry").toggleClass("in active");
	if(flag==5)
		$("#track").toggleClass("in active");
}); 


$(function(){
	$("#closeFileUploadModel").click(function(){
		$("#ctlBtn").off("click");
		uploader.destroy();
	});
});
</script>
</html>
	