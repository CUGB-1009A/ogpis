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
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav.jsp"%>
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
				<li class="active">用户管理</li>
			</ul>
		</div>
		<div class="btn-toolbar" style="text-align: right;">
			<div class="btn-group">
				<button id="btnAdd"  class="btn-sm btn-success">添加用户</button>
			</div>
			<div class="btn-group">
				<button id="btnAdd"  class="btn-sm">添加用户</button>
				<button id="btnAdd"  class="btn-sm">添加用户</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="table-responsive">
					<table id="sample-table-1" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label>
										<input type="checkbox"/>
										<span class="lbl"></span>
									</label>
								</th>
								<th class="hidden">ID</th>
								<th>登录账号</th>
								<th class="hidden-480">显示名称</th>
								<th class="hidden-480">密码</th>
								<th class="hidden-480">状态</th>
								<th class="hidden-480">操作</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${users}" var="item">  
                 				<tr>
									<td class="center">
										<label>
											<input type="checkbox"/>
											<span class="lbl"></span>
										</label>
									</td>
									<td class="hidden">${item.id}</td>
									<td>${item.loginId}</td>
									<td>${item.name}</td>
									<td>${item.password}</td>
									<td>
										<span class="label label-sm label-warning">可用</span>
									</td>
									<td>
										<p>
											<a href="#" class="btn-sm btn-app btn-success no-radius">
												<i class="icon-info bigger-200"></i>
												查看
											</a>
											<a href="#" class="btn-sm btn-app btn-primary no-radius">
												<i class="icon-edit bigger-200"></i>
												编辑
											</a>
											<a href="javascript:onDelete('${item.id}');" class="btn-sm btn-app btn-danger no-radius">
												<i class="icon-trash bigger-200"></i>
												删除
											</a>
										</p>
									</td>
								</tr>
              				</c:forEach>  
						</tbody>
					</table>
				</div><!-- /.table-responsive -->
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	$("#btnAdd").click(function(){
		alert("sdf");
		window.location.href="<%=path%>/user/add";
	});
});

function onDelete(id){
	$.ajax({
		url:'<%=path%>/user/del',
		data:{
			id:id
		},
		success: function(){
	       alert("删除成功！");
// 	       var table = $('#sample-table-1').DataTable();
// 	       table.reload();
		}
	});
}

</script>
</html>
	