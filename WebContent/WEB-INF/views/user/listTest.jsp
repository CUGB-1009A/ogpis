<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
 <script type="text/javascript" src="<c:url value='/assets/js/plugins/data-tables/jquery.dataTables.js'/>"></script>
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
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
						<div class="caption"><i class="icon-table"></i>sdfasd</div>
					</div>
					<div class="portlet-body">
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
								<button id="btnAdd"  class="btn-sm btn-success">添加用户</button>
							</div>
							<div class="btn-group">
								<button id="btnAdd"  class="btn-sm">添加用户</button>
								<button id="btnAdd"  class="btn-sm">添加用户</button>
							</div>
						</div>
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable"/></th>
											<th>姓名</th>
											<th>邮箱</th>
											<th>是否可用</th>
											<th>用户名</th>
											<th>注册时间</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${users.items}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="Id" value="${ item.id }" />
												</td>
												<td>${item.loginId}</td>
												<td>${item.name}</td>
												<td>${item.password}</td>
												<td>${item.password}</td>
												<td>${item.createTime.toLocaleString() }</td> 
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
														<a href="<%=path%>/user/del?id=${ item.id }"')" class="btn-sm btn-app btn-danger no-radius">
															<i class="icon-trash bigger-200"></i>
															删除
														</a>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
<%-- 							<c:url value='/WEB-INF/views/common/paging.jsp'/> --%>
							<c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="users"/>
		        				<c:param name="urlAddress" value="/user/list"/>
	       				 	</c:import>
						</div>
					</div>
            	</div>
            </div>
		</div>
	</div>	
</div>
</body>
<script type="text/javascript">
</script>
</html>
	