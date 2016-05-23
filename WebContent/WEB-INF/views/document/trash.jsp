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

	
	<div id="page-wrapper" style="height:98%;width:100%">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="<c:url value='/main'/>">首页</a>
				</li>
				<li class="active">文档回收站</li>
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
								<a href="<c:url value='/plan/national/toEditPage'/>" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-arrow-down bigger-200">&nbsp;打包下载</i>
								</a>
								&nbsp;
								<a href="javascript:delAll();" class="btn-sm btn-app btn-danger no-radius">
									<i class="icon-trash bigger-200">&nbsp;清空回收站</i>
								</a>
							</div>
						</div>
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxFirst"/>全选</th>
											<th>文档名称</th>
											<th>文档概述</th>
											<th>删除时间</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${documents.items}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkbox" value="${item.id}" />
												</td>
												<td><a href="<c:url value='/plan/national/showDetail?id=${item.id}'/>">${item.documentName}</a></td>
												<td>${item.documentDescription}</td>
												<td>${item.modifiedTime}</td>
												<td>
													<p>
														<a  href="<c:url value='/document/downloadDocument?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-arrow-down bigger-200"></i>
															下载
														</a> &nbsp;
														&nbsp;
														<a href="javascript:del('<c:url value='/document/removeDocument?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
															<i class="icon-trash bigger-200"></i>
															彻底删除
														</a>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="documents"/>
		        				<c:param name="urlAddress" value="/document/trash"/>
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

function del(url){
	var isDel =  confirm('确定从服务器删除该文档？', '确认对话框');
	if(isDel){
		window.location.href=url;
	}
}

/* 批量删除规划响应函数 */
function delAll()
{
	var checkedObject =  $("input[name='checkbox']:checked");
	if(checkedObject.length==0)
		{
		alert("至少选择一个文档再清空！");
		return false;
		}	
	var isDelAll =  confirm('确定彻底删除所选文档？', '确认对话框');
	var idTemp="";
	if(isDelAll)
	{
		for(var i=0;i<checkedObject.length;i++)
		{
			idTemp+=checkedObject[i].value+",";
		}
		$.ajax({
			url:"<%=path%>/document/removeDocuments",
			data:{"Ids":idTemp},
			type:"POST",
			async:true,
			success:function()
			{
			window.location.href="<%=path%>/document/trash";
			},
			error:function()
			{
				alert("批量删除错误");
			}			
		});
	}
}

/* 全选响应函数 */
$(function(){
			$("[name='checkboxFirst']").click(function(){		
			if($("[name='checkboxFirst']")[0].checked)
				{
				 for(var i=0;i<$("[name='checkbox']").length;++i)
					$("[name='checkbox']")[i].checked=true; 
				}
			else
				{
				 for(var i=0;i<$("[name='checkbox']").length;++i)
					$("[name='checkbox']")[i].checked=false; 
				}			
	});
});

</script>
</html>
	