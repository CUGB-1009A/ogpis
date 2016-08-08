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
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav_admin.jsp"%>
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
								<form id="queryPlan" action="<%=path%>/plan/list">
									<input type="hidden" value="${type}" name="type">
									<span title="根据规划名，规划代号，规划单位等条件进行模糊匹配查询">模糊查询：</span>	
											&nbsp;&nbsp;
									<input type="text" id="inputFuzzyQuery" placeholder="模糊查询条件..."  name="condition" value="${condition}" >
											&nbsp;&nbsp;
									<a href="javascript:fuzzyQuery();" class="btn-sm btn-app btn-success no-radius">
												<i class="icon-search bigger-200">&nbsp;查询</i>
									</a>
											&nbsp;&nbsp;
									<a href="<%=path%>/plan/toEditPage?type=${type}" class="btn-sm btn-app btn-success no-radius">
											<i class="icon-plus bigger-200">&nbsp;添加规划</i>
									</a>
										&nbsp;&nbsp;								
									<a href="javascript:delAll();" class="btn-sm btn-app btn-danger no-radius">
											<i class="icon-trash bigger-200">&nbsp;批量删除</i>
									</a>
										&nbsp;&nbsp;
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
											<th>规划类型</th>
											<th>信息</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${mapList}" var="item1" varStatus="status">
												<tr class="odd gradeX tr_${item1.get('plan').id}">
													<td class="check_cell">
														<c:if test="${!item1.get('plan').released}">
															 <input type="checkbox" class="checkboxes" name="checkbox" value="${item1.get('plan').id}" /> <!-- 未发布的规划才能批量删除 -->
														</c:if>
													</td>
													<td>${item1.get('plan').planName}</td>
													<td>${item1.get('plan').planCode}</td>
													<td>${item1.get('plan').planType}</td>
													<td>
														<i class="glyphicon glyphicon-file"></i> ${item1.get('plan').planDocument.size()}&nbsp;&nbsp;&nbsp;
														指标个数 ${item1.get('plan').index.size()}&nbsp;&nbsp;&nbsp;
														<i class="glyphicon glyphicon-heart"></i> <span class="concernNum_${item1.get('plan').id}">${item1.get('plan').users.size()}</span>&nbsp;&nbsp;&nbsp;
														<i class="icon-time"> ${item1.get('plan').modifiedTime.toLocaleString()}</i>
													</td>
													<td>
														<p>
														
															<a  href="javascript:editPlan('${item1.get('plan').id}')" class="btn-sm btn-app btn-primary no-radius editPlan_${item1.get('plan').id}">
																	<i class="icon-edit bigger-200"></i>
																	编辑
															</a>&nbsp;
															
															<c:if test="${item1.get('plan').released}">
																<a  href="javascript:releasePlan('${item1.get('plan').id}')" class="btn-sm btn-app btn-primary no-radius release_${item1.get('plan').id}" style="display:none">
																	<i class="icon-unlock  bigger-200"></i>
																	发布
																</a>&nbsp;
																<a  href="javascript:disreleasePlan('${item1.get('plan').id}')" class="btn-sm btn-app btn-primary no-radius disrelease_${item1.get('plan').id}">
																	<i class="icon-lock  bigger-200"></i>
																	取消发布
																</a>&nbsp;
															
																<a href="javascript:deletePlan('${item1.get('plan').id}');" class="btn-sm btn-app btn-danger no-radius deletePlan_${item1.get('plan').id}" style="display:none">
																	<i class="icon-trash bigger-200"></i>
																	删除
																</a>&nbsp;
															</c:if>
															
															<c:if test="${!item1.get('plan').released}">
																<a  href="javascript:releasePlan('${item1.get('plan').id}')" class="btn-sm btn-app btn-primary no-radius release_${item1.get('plan').id}">
																	<i class="icon-unlock  bigger-200"></i>
																	发布
																</a>&nbsp;
																<a  href="javascript:disreleasePlan('${item1.get('plan').id}')" class="btn-sm btn-app btn-primary no-radius disrelease_${item1.get('plan').id}" style="display:none">
																	<i class="icon-lock  bigger-200"></i>
																	取消发布
																</a>&nbsp;
																<a href="javascript:deletePlan('${item1.get('plan').id}');" class="btn-sm btn-app btn-danger no-radius deletePlan_${item1.get('plan').id}">
																	<i class="icon-trash bigger-200"></i>
																	删除
																</a>&nbsp;
															</c:if>
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
var tempType = "${type}";
/* Ajax删除规划 */
function deletePlan(id)
{
	var getTimestamp = new Date().getTime();
	var isDel =  confirm('确定删除该规划吗？', '确认对话框');
	if(isDel)
	{
		$.ajax({
			url:"<%=request.getContextPath()%>/plan/deletePlan?time="+getTimestamp,
			dataType:"json",
			async:true,
			data:{"planId":id},
			type:"GET",
			success:function(result){
				$(".tr_"+id).remove();
				alert("删除规划成功");
			},
			error:function(){
				alert("出意外错误了");
			}
		});			
	}
}

function editPlan(id)
{
	window.location.href = "<%=path%>/plan/show?flag=1&&type="+tempType+"&&id="+id;
}

/* ajax发布规划 */
function releasePlan(id)
{
	var getTimestamp = new Date().getTime();
	//发布处理，处理成功后do
	$.ajax({
		url:"<%=request.getContextPath()%>/plan/release?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":id},
		type:"GET",
		success:function(result){
			$("input[value="+id+"]").remove();
			$(".release_"+id).get(0).style.display="none";
			$(".disrelease_"+id).get(0).style.display="";
			$(".deletePlan_"+id).get(0).style.display="none";
			alert('发布成功');		
		},
		error:function(){
			alert("出意外错误了");
		}
	});				
}

/* ajax撤销发布规划 */
function disreleasePlan(id)
{
	var getTimestamp = new Date().getTime();
	//发布处理，处理成功后do
	$.ajax({
		url:"<%=request.getContextPath()%>/plan/disrelease?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":id},
		type:"GET",
		success:function(result){
			$(".tr_"+id).find("td:first").append("<input type='checkbox' class='checkboxes' name='checkbox' value='"+id+"'/>");
			$(".release_"+id).get(0).style.display="";
			$(".disrelease_"+id).get(0).style.display="none";
			$(".deletePlan_"+id).get(0).style.display="";
			alert('撤销发布成功');		
		},
		error:function(){
			alert("出意外错误了");
		}
	});				
}

/* 用ajax提交关注规划响应 */
function concernPlan(id)
{
	var getTimestamp = new Date().getTime();
	//关注处理，处理成功后do
	$.ajax({
		url:"<%=request.getContextPath()%>/plan/concern?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":id},
		type:"GET",
		success:function(result){
			var temp = new Number($(".concernNum_"+id).text());
			temp = temp + 1;
			$(".concernNum_"+id).text(temp);
			$(".concern_"+id).get(0).style.display="none";
			$(".disconcern_"+id).get(0).style.display="";
			alert('关注成功');
		},
		error:function(){
			alert("出意外错误了");
		}
	});	
}

/* 用ajax提交取消关注规划响应 */
function disconcernPlan(id)
{
	var getTimestamp = new Date().getTime();
	//发布处理，处理成功后do
	$.ajax({
	url:"<%=request.getContextPath()%>/plan/disconcern?time="+getTimestamp,
	dataType:"json",
	async:true,
	data:{"planId":id},
	type:"GET",
	success:function(result){
		var temp = new Number($(".concernNum_"+id).text());
		temp = temp - 1;
		$(".concernNum_"+id).text(temp);
		$(".concern_"+id).get(0).style.display="";
		$(".disconcern_"+id).get(0).style.display="none";
		alert('取消关注成功');
	},
	error:function(){
		alert("出意外错误了");
	}
});
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
	var getTimestamp = new Date().getTime();
	var type = '${type}';
	var ids ='';
	var $chosedPlan = $("[name=checkbox]:checked");
	if($chosedPlan.length==0)
	{
		alert("至少选择一个规划再删除！");
		return;
	}
	var isDelAll =  confirm('确定删除选定规划？', '确认对话框');
	if(isDelAll)
		{
			for(var i=0;i<$chosedPlan.length;i++)
			{
				ids = ids + $chosedPlan[i].value+","
			}
		alert(ids);
	$.ajax({
		url:"<%=path%>/plan/deleteBatch?time="+getTimestamp,
		dataType:"json",
		async:true,
		type:"POST",
		data:{"Ids":ids,"type":type},
		success:function(result){
			 for(var i=0;i<$chosedPlan.length;i++)
			{
				$(".tr_"+$chosedPlan[i].value).remove();
			} 			
			alert("批量删除规划成功");
		},
		error:function(){
			alert("出意外错误了");
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
	