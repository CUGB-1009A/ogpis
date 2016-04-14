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
    <%
    	boolean isAdd = request.getAttribute("nationalPlan")==null;
    	System.out.println(isAdd);
    %>
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<%@ include file="../../../main/main_header.jsp"%>
		<%@ include file="../../../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	
	<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">规划管理</a>
				</li>
				<li>
					<a href='<c:url value="/plan/national/data/list"/>'>全国规划</a>
				</li>
				<li class="active">
					<c:if test='<%=!isAdd %>'>编辑规划</c:if>
					<c:if test='<%=isAdd %>'>添加规划</c:if>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/plan/national/data/save">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${nationalPlan.id }" name="id"/>
				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="请输入规划名称.." class="col-xs-10 col-sm-5" name="planName" value="${nationalPlan.planName}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划代号</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="请输入规划代号.." class="col-xs-10 col-sm-5" name="planCode" value="${nationalPlan.planCode }">
						</div>
					</div>
					
					<c:forEach items="${columns}" var="item">
						<div class="space-4"></div>
					
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${item.name}</label>
	
							<div class="col-sm-9">
								<input type="text" id="form-field-1" placeholder="请输入${item.name}.." class="col-xs-10 col-sm-5" name="${item.name}" value="${expandoValuesMap[item.name].data}">
							</div>
						</div>
					</c:forEach>
					
					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" >
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn-sm btn-success no-radius" type="reset">
								<i class="icon-undo bigger-200"></i>
								重置
							</button>
						</div>
					</div>
				</from>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">

</script>
</html>
	