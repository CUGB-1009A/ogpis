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
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	<div id="top"></div>
	<div id="page-wrapper" style="height:100%;text-align:left">
		<h1 style="text-align:center">${plan.planName}</h1>
		<h3 style="text-align:left"><I>关于规划:</I></h3>
			<div style="text-align:justify;text-justify:inter-ideograph">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b>${plan.planName}</b>是<b>${plan.releaseUnit}</b>于<b>${plan.releaseDate}</b>
			发布的规划，规划代号为<b>${plan.planCode}</b>，规划时间段是从<b>${plan.startTime}</b>到<b>${plan.endTime}</b>。“规划的简短描述”：
			<b>${plan.planDescription}</b>
			</div>
			
		<h3 style="text-align:left"><I>规划相关文档:</I></h3>
		<div>			
			<c:forEach items="${planDocuments}" var="item">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a target="_blank" href="<c:url value='/document/previewDocument?id=${item.id}'/>">${item.documentName}</a>&nbsp;&nbsp;&nbsp;
			<a  href="<c:url value='/document/downloadDocument?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">				
            <i class="icon-arrow-down bigger-100"></i> 下载</a>
			<br>
			</c:forEach>
		</div>
		
		<h3 style="text-align:left"><I>相关指标项:</I></h3>
		<div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
			<tr>
				<th>指标名称</th>
				<th>指标类型</th>
				<th>指标单位</th>											
				<th>目标值</th>
			</tr>
			</thead>
			<tbody>				
			<c:forEach items="${indexs}" var="item">
			<tr>
			   <td>${item.indexName}</td>
			   <td>${item.indexType}</td>
			   <td>${item.indexUnit}</td>
			   <td>${item.indexValue}</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
<div style="text-align:right">			
<a  href="#top" class="btn-sm btn-app btn-primary no-radius">				
            <i class="icon-arrow-up bigger-100"></i> Top</a>
</div>
</div>
</div>	
</body>
</html>

	