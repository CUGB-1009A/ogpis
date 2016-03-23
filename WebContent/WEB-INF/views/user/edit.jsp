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
    	boolean isAdd = request.getAttribute("user")==null;
    	System.out.println(isAdd);
    %>
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
	
	<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">系统管理</a>
				</li>
				<li>
					<a href='<c:url value="/user/list"/>'>用户管理</a>
				</li>
				<li class="active">
					<c:if test='<%=!isAdd %>'>编辑用户</c:if>
					<c:if test='<%=isAdd %>'>添加用户</c:if>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/user/save">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${user.id }" name="id"/>
				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">登录账号</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" name="loginId" value="${user.loginId }">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">显示名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5" name="name" value="${user.name }">
						</div>
					</div>
					<c:if test='<%=isAdd %>'>
						<div class="space-4"></div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 密码 </label>
	
							<div class="col-sm-9">
								<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5" name="password">
								<span class="help-inline col-xs-12 col-sm-7">
									<span class="middle">Inline help text</span>
								</span>
							</div>
						</div>
	
						<div class="space-4"></div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 重复输入 </label>
	
							<div class="col-sm-9">
								<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5">
								<span class="help-inline col-xs-12 col-sm-7">
									<span class="middle">Inline help text</span>
								</span>
							</div>
						</div>
					</c:if>
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
$(function(){
	$("#btnAdd").click(function(){
		window.location.href="<%=path%>/user/add";
	});
});
</script>
</html>
	