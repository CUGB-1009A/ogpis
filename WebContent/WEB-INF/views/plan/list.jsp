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
    	String type = request.getAttribute("type").toString();
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

	
	<div id="page-wrapper" style="height:98%;width:100%">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
			<shiro:hasPermission name="mainPage:link">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="<c:url value='/main'/>">首页</a>
				</li>
				</shiro:hasPermission>
				
				<c:if test='<%=type.equals("QG")%>'>
					<li class="active">全国规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("ZSY")%>'>
					<li class="active">中石油规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("ZSH")%>'>
					<li class="active">中石化规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("ZHY")%>'>
					<li class="active">中海油规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("YC")%>'>
					<li class="active">延长石油规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("ZLM")%>'>
					<li class="active">中联煤规划</li>
				</c:if>
				
				<c:if test='<%=type.equals("QT")%>'>
					<li class="active">其它公司规划</li>
				</c:if>
				
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
					
						<form id="queryPlan" action="<%=path%>/plan/list">
							<input type="hidden" value="${type}" name="type">
							<shiro:hasPermission name="national:fuzzyQuery">
								<span title="根据规划名，规划代号，规划单位等条件进行模糊匹配查询">模糊查询：</span>	
									&nbsp;&nbsp;
									<input type="text" id="inputFuzzyQuery" placeholder="模糊查询条件..."  name="condition" value="${condition}" >
									&nbsp;&nbsp;
									<a href="javascript:fuzzyQuery();" class="btn-sm btn-app btn-success no-radius">
										<i class="icon-search bigger-200">&nbsp;查询</i>
									</a>
									&nbsp;&nbsp;&nbsp;&nbsp;
							</shiro:hasPermission>
							
							<shiro:hasPermission name="national:add">
								<a href="<%=path%>/plan/toEditPage?type=${type}" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-plus bigger-200">&nbsp;添加规划</i>
								</a>
								&nbsp;
							</shiro:hasPermission>
							
							<shiro:hasPermission name="national:deleteBatch">
								<a href="javascript:delAll();" class="btn-sm btn-app btn-danger no-radius">
									<i class="icon-trash bigger-200">&nbsp;批量删除</i>
								</a>
								&nbsp;&nbsp;
							</shiro:hasPermission>
							</form>
					
					
							</div>
						</div>
						
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxFirst"/>全选</th>
											<th>规划名称</th>
											<th>规划代号</th>
											<th>信息</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${plans.items}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkbox" value="${item.id}" />
												</td>
												<td><a href="<c:url value='/plan/showDetail?id=${item.id}'/>">${item.planName}</a></td>
												<td>${item.planCode}</td>
												<td>
													<i class="glyphicon glyphicon-file"></i> ${item.planDocument.size()}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<i class="glyphicon glyphicon-chart"></i>指标个数 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													 <i class="icon-time"> ${item.modifiedTime.toLocaleString()}</i>
												</td>
												<td>
													<p>
													<shiro:hasPermission name="national:toEditPage">
														<a  href="<c:url value='/plan/show?id=${item.id}&&type=${type}&&flag=1'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															编辑
														</a>
														&nbsp;
													</shiro:hasPermission>
													<shiro:hasPermission name="national:delete">
														<a href="javascript:del('<c:url value='/plan/delete?id=${item.id}&&type=${type}'/>');" class="btn-sm btn-app btn-danger no-radius" >
															<i class="icon-trash bigger-200"></i>
															删除
														</a>
													</shiro:hasPermission>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="plans"/>
		        				<c:param name="urlAddress" value="/plan/list"/>
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
var tempType = "${type}";
function del(url){
	var isDel =  confirm('确定删除该规划？', '确认对话框');
	if(isDel){
		window.location.href=url;
	}
}

function fuzzyQuery()
{
	var temp = $("#inputFuzzyQuery").val();
	if(temp=="")
		{
		alert("请输入查询条件！")
		return ;
		}
	else
		$("#queryPlan").submit();
}

/* 批量删除规划响应函数 */
function delAll()
{
	var checkedObject =  $("input[name='checkbox']:checked");
	if(checkedObject.length==0)
		{
		alert("至少选择一个规划再删除！");
		return;
		}	
	var isDelAll =  confirm('确定删除选定规划？', '确认对话框');
	var idTemp="";
	if(isDelAll)
	{
		for(var i=0;i<checkedObject.length;i++)
		{
			idTemp+=checkedObject[i].value+",";
		}
		$.ajax({
			url:"<%=path%>/plan/deleteBatch",
			data:{"Ids":idTemp,"type":tempType},
			type:"POST",
			async:true,
			success:function(result)
			{
			window.location.href="<%=path%>/plan/list?condition=&&type="+result.type;
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
	