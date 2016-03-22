<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp"%>
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
<html>
<body>
	<!-- wrapper -->
	<div id="wrapper">
		<!-- 网站头及导航栏 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<%@ include file="../main/main_header.jsp"%>
			<%@ include file="../main/main_nav.jsp"%>
		</nav>
		<!--网页主体 -->
		<div id="page-wrapper" style="height: 85%;">
			<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i> <a href="<%=path%>/main">首页</a></li>
					<li class="active">菜单管理</li>
				</ul>
			</div>
			<div class="btn-toolbar">
				<div class="btn-group">
					<button id="btnAdd" class="btn-sm btn-success">新建菜单</button>&nbsp;&nbsp;&nbsp;
					<button id="back" class="btn-sm btn-success" style="display:none">返回</button>
				</div>
			</div>
			<div class="btn-toolbar">
				<div class="btn-group">
					
				</div>
			</div>
			<div>
			&nbsp;
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="table-responsive">
						<table id="sample-table-1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="hidden-480">菜单名称</th>
									<th class="hidden-480">功能描述</th>
									<th class="hidden-480">显示顺序</th>
									<th class="hidden-480">URL</th>
									<th class="hidden-480">相关操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${menuList}" var="item">
									<tr>
										<td><a href="<%=path%>/menu/nextMenu?id=${item.id}&&pageId=${pageId}">${item.name}</a></td>
										<td>${item.description}</td>
										<td>${item.priority}</td>
										<td>${item.url}</td>
										<td>
											<p>
												<a href="<%=path%>/menu/toAddMenuUI?id=${item.id}&&pageId=${pageId}" class="btn-sm btn-app btn-primary no-radius">
													<i class="icon-edit bigger-200">修改</i> 
												</a> &nbsp;&nbsp;&nbsp;<a href="<%=path%>/menu/deleteMenu?id=${item.id}&&pageId=${pageId}" class="btn-sm btn-app btn-danger no-radius">
													<i class="icon-trash bigger-200">删除</i> 
												</a>
											</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- /span -->
			</div>
			<!-- /row -->
		</div>
		<!-- 文字说明部分 -->
		<div id="page-wrapper" style="height: 15%;">
		<div class="breadcrumbs" style="text-align: left;">
		说明：1、显示顺序是指菜单在导航栏中先后显示的顺序，设置越小，越先显示<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   	 2、执行删除菜单操作时，对应的菜单和其子菜单都会删除，请谨慎操作！！！
		</div>
		
		</div>
	</div>
</body>
<!-- 新建按钮响应事件，转到添加菜单页面-->
<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){
		window.location.href="<%=path%>/menu/toAddMenuUI?pageId=${pageId}&&id=''";
	});
});

$(function(){
	var param = "${pageId}";
	if(param=="") //如果是首页添加隐藏属性
		{
		$("#back").hide();
		}
	else
	{
		$("#back").show();
		$("#back").click(function(){
		window.location.href="<%=path%>/menu/previousMenu?pageId=${pageId}";
		});		
	}
	
}); 
</script>
</html>