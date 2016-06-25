<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
    <%
    	boolean hasNoPlan = request.getAttribute("plans")==null;
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
				<li class="#">导入指标</li>
			</ul>
		</div>
		<div>
		<p>导入规划指标是为了<b>快速的为一个规划建立一个评价指标体系</b>，先查看已有规划的指标体系，选择最为相似的指标体系导入，再进行细微的增、删、改操作</p>
		</div>
		<c:if test='<%=!hasNoPlan%>'>
			<div class="dataTables_wrapper form-inline" role="grid">
				<div class="table-scrollable">
					<table class="table table-striped table-bordered table-hover" id="data-table">
						<thead>
							<tr>
							    <th>单选按钮</th>
								<th>规划名称</th>
								<th>指标个数</th>											
								<th>详情</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${plans}" var="item">
								<tr class="odd gradeX">
								    <td><input name="planRadio" type="radio" value="${item.id}" /></td>
									<td>${item.planName}</td>
									<td>${item.index.size()}</td>
									<td>
										<a  href="<c:url value='/plan/show?id=${item.id}&&type=${type}&&flag=1'/>" class="btn-sm btn-app btn-primary no-radius">
												<i class="icon-edit bigger-200"></i>
												查看
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<button class="btn-sm btn-success no-radius" type="button" onclick="testImport()">
				<i class="icon-ok bigger-200"></i>
				  确认
			</button>
	   </c:if>
   			<button class="btn-sm btn-success no-radius" type="button" onclick="back()" >
			<i class="icon-share-alt bigger-200"></i>
			  返回
			</button>

	</div>
</div>
</body>
<script type="text/javascript">
/* 由于列出来的规划中有本身，所以使本身规划的单选按钮不可用 */
$(function(){
	var planId = "${planId}"
		for(var i=0;i<$("[name='planRadio']").length;++i)
			if($("[name='planRadio']")[i].value==planId)
				$("[name='planRadio']")[i].disabled='disabled';
	
});
/* 返回指标列表 */
function back()
{
	window.location.href="<%=path%>/index/back?planId=${planId}";
}

/* 保证四个数据都填写完成，否则不允许提交 */
function testImport()
{
	var theChosedPlanId= '0';
	for(var i=0;i<$("[name='planRadio']").length;++i)
			if($("[name='planRadio']")[i].checked==true)
				theChosedPlanId = $("[name='planRadio']")[i].value;
	if(theChosedPlanId=='0')
		{
		alert("请选择一个规划指标体系进行导入！");
		return false;
		}
	else
		{
		window.location.href="<%=path%>/index/importIndex?planId=${planId}&&theChosedPlanId="+theChosedPlanId;
		}
	
}
</script>
</html>
	