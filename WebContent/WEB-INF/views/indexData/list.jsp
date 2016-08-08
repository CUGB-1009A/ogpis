<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->	
	<div id="page-wrapper" style="height:98%;width:100%">		
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
					</div>
						<div class="portlet-body">
						
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
								<span title="">指标项名称：</span>									
								<select id="selectIndex" name="selectCondition" class="selectpicker" data-style="btn-danger">
							    	<c:forEach items="${indexList}" var="item" varStatus="status">
							    		<option value='${item.id}'>${item.indexName}</option>
									</c:forEach>
							    </select>	
							</div>
						</div>
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th>录入时间</th>
											<th>完成量</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${indexDataList}" var="item1" varStatus="status">
											<tr>
												<td><fmt:formatDate value="${item1.collectedTime}" pattern="YYYY-MM-dd"/></td>
												<td>${item1.finishedWorkload}</td>
												<td>
													<p>
													
														<a  href="<%=path%>/indexData/edit?id=${item1.id}" class="btn-sm btn-app btn-primary no-radius">
																<i class="icon-edit bigger-200"></i>
															修改
														</a>&nbsp;
														<a href="javascript:deleteIndexData('${item1.id}');" class="btn-sm btn-app btn-danger no-radius">
															<i class="icon-trash bigger-200"></i>
															删除
														</a>&nbsp;
													</p>
												</td>
											</tr>
										 </c:forEach>
									</tbody>
								</table>
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
$(function(){
	
});
$("#selectIndex").change(function(){
	var id = $("#selectIndex").val()
	window.location.href="<%=path%>/indexData/list?id="+id;
});
</script>
</html>
	