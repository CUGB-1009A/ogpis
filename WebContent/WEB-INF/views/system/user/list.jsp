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
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
					</div>
					<div class="portlet-body">
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
								<a href="<c:url value='/system/user/add'/>" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-plus bigger-200">添加用户</i>
								</a>
							</div>
						</div>
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable"/></th>
											<th>登录名</th>
											<th>姓名</th>
											<th>是否可用</th>
											<th>用户名</th>
											<th>注册时间</th>
											<th>操作</th>
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
												<td>${item.id}</td>
												<td>${item.password}</td>
												<td>${item.createTime.toLocaleString() }</td> 
												<td>
													<p>
														<a  class="btn-sm btn-app btn-success no-radius" data-toggle="modal" href="<c:url value='/user/view?id=${item.id }'/>" data-target="#myModal">
															<i class="icon-info bigger-200"></i>
															查看
														</a>
														<a  href="<c:url value='/system/user/edit?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															编辑
														</a>
														<a href="javascript:del('<c:url value='/system/user/delete?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
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
							<c:import url ="../../common/paging.jsp">
		        				<c:param name="pageModelName" value="users"/>
		        				<c:param name="urlAddress" value="/user/list"/>
	       				 	</c:import>
	       				 	
	       				 	<!-- 模态框（Modal） -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
							   aria-labelledby="myModalLabel" aria-hidden="true"  >
								<div class="modal-dialog">
									<div class="modal-content">
									</div><!-- /.modal-content -->
								</div><!-- /.modal -->
	       				 	</div>
						</div>
					</div>
            	</div>
            </div>
		</div>
	</div>	
</div>
</body>
<script type="text/javascript">
function del(url){
	var isDel =  confirm('确定删除该用户吗？', '确认对话框');
	if(isDel){
		window.location.href=url;
	}
}

$('#myModal').on('show.bs.modal', function () {
	  $("#myModalContent").val('sdf');
	});

function test(url,title,msg) {
	alert(url);
	if(title==null){title="确认"};
	if(msg==null){msg="确认删除?"};
	 $("BODY").append("<div id='dialog-message' title='"+title+"'><p>"+msg+"</p></div>");
	 $("#dialog-message").dialog({
				modal: true,
				resizable:false,
				position:'center',
				buttons: {
					确认: function() {
						$(this).dialog( "close" );
						$("#dialog-message").remove();
						window.location.href=url;
					},
					取消:function(){
						$(this).dialog( "close" );
						$("#dialog-message").remove();
					}
				}
			});
	$("#dialog-message").dialog('open');
}



</script>
</html>
	