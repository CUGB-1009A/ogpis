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
     <link href="<%=path%>/assets/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <title>油气资源规划信息系统</title>
</head>
<html>
<body>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->	
	<div id="page-wrapper" style="height:98%;width:100%">
	<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li class="active"><i class="icon-pencil"></i> 完成情况管理</li>

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
								<span title="">指标类型：</span>									
								<select id="selectType" name="type" class="selectpicker" data-style="btn-danger">
							    		<option value='QG' <c:if test="${type.equals('QG')}">selected</c:if>>全国</option>
							    		<option value='ZSY' <c:if test="${type.equals('ZSY')}">selected</c:if>>中石油</option>
							    		<option value='ZSH' <c:if test="${type.equals('ZSH')}">selected</c:if>>中石化</option>
							    		<option value='ZHY' <c:if test="${type.equals('ZHY')}">selected</c:if>>中海油</option>
							    		<option value='YC' <c:if test="${type.equals('YC')}">selected</c:if>>延长石油</option>
							    		<option value='ZLM' <c:if test="${type.equals('ZLM')}">selected</c:if>>中联煤</option>
							    		<option value='QT' <c:if test="${type.equals('QT')}">selected</c:if>>其他</option>	
							    </select>	
							    &nbsp;&nbsp;
								<span title="">指标项名称：</span>									
								<select id="selectIndex" name="selectCondition" class="selectpicker" data-style="btn-danger">
									 <c:if test="${id.equals('0')}"><option value='0'selected>没有指标项</option></c:if>
							    	<c:forEach items="${indexList}" var="item" varStatus="status">
							    		<option value='${item.id}' <c:if test="${item.id==id}">selected</c:if>>${item.indexName}</option>
									</c:forEach>
							    </select>	
							    &nbsp;&nbsp;
							    <c:if test="${!id.equals('0')}">
								     <a href="javascript:showAddIndexDataModel();" class="btn-sm btn-app btn-success no-radius">
										<i class="icon-plus bigger-200">&nbsp;录入</i>
									</a>
								&nbsp;&nbsp;
								</c:if>
							</div>
						</div>
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th>年度</th>
											<th>完成量</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${indexDataList}" var="item1" varStatus="status">
											<tr class="tr_${item1.id}">
												<td><fmt:formatDate value="${item1.collectedTime}" pattern="YYYY"/></td>
												<td><input id="input_${item1.id}" class="input_${item1.id}" type="text" value="${item1.finishedWorkload}" lastValue="${item1.finishedWorkload}" disabled="true"></td>
												<td>
													<p>
														<a  href="javascript:saveEditIndexData('${item1.id}')" class="btn-sm btn-app btn-success no-radius" id="ok_${item1.id}" style="display:none">
																<i class="icon-ok bigger-200"></i>
														</a>&nbsp;
														
														<a  href="javascript:cancleEditIndexData('${item1.id}')" class="btn-sm btn-app btn-success no-radius" id="cancle_${item1.id}" style="display:none">
																<i class="icon-remove bigger-200"></i>
														</a>&nbsp;
													
														<a  href="javascript:editIndexData('${item1.id}')" class="btn-sm btn-app btn-primary no-radius" id="edit_${item1.id}">
																<i class="icon-edit bigger-200"></i>
														</a>&nbsp;
														<a href="javascript:deleteIndexData('${item1.id}');" class="btn-sm btn-app btn-danger no-radius" id="delete_${item1.id}">
															<i class="icon-trash bigger-200"></i>
														</a>&nbsp;
													</p>
												</td>
											</tr>
										 </c:forEach>
									</tbody>
								</table>
							</div>
						
							<!-- 管理员添加完成记录模态框 -->
							<div class="modal fade" id="addIndexData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1600px;margin-top: 150px;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
											<h3 class="modal-title">完成情况录入</h3>
										</div>
										<div class="modal-body">
											<div class="row">
											<div class="col-sm-12">
												<form class="form-horizontal" role="form"> 	
														  <div class="form-group">
															<label class="col-sm-4 control-label no-padding-right" for="form-field-4">采集时间</label>
														   	<div class="col-sm-8">
															   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="collectedTime" data-link-format="yyyy-mm-dd">
															   		<input type="text" id="collectedTime" name="collectedTime" class="col-sm-10" readonly>
															   		<span class="add-on col-sm-2" style="padding:0;margin:0"><i style="padding:0;margin:0" class="icon-th"></i></span>	
															   	</div>		   
															</div>
														 </div> 
							 
														 <div class="form-group">
															<label class="col-sm-4 control-label no-padding-right" for="form-field-2">完成量的</label>
															<div class="col-sm-8" style="margin:0;">
																	<input type="text"  id="finishedWorkload" placeholder="完成量" class="col-sm-10" style="margin:0" name="finishedWorkload" >
															</div>
														 </div> 
														 <div class="col-sm-12">
															<button class="btn-sm btn-success no-radius" type="button" onclick="addIndexData('${id}')">
																<i class="icon-edit bigger-200"></i>
																录入
															</button>
														</div>
													</form> 
												</div>
											</div>
										</div>
									</div>
								</div>			
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
/* 为id=id的指标加完成情况 */
function addIndexData(id)
{
	var collectedTime = $("#collectedTime").val();
	var finishedWorkload = $("#finishedWorkload").val();
	if(finishedWorkload==''||collectedTime=='')
		{
		alert("请填写完整再提交");
		return false;
		}
	$.ajax({
		url:"<%=path%>/indexData/addIndexData",
		type:"get",
		async:true,
		data:{"id":id,"collectedTime":collectedTime,"finishedWorkload":finishedWorkload},
		dataType: "json", 
	    contentType: "application/json",
		success:function(result)
		{	
			if(result.result == 'success')
				window.location.href = "<%=path%>/indexData/list?id=${id}&&type=${type}";
			else
				alert("该年份的记录已经存在，不能再次添加！");
					
		},
		error:function()
		{
			alert("添加失败！");
		}			
	});
}

/* 编辑按钮：让class=“input_id"的input变为可编辑状态 ,同时显示保存和取消，隐藏删除*/
function editIndexData(id)
{
	$(".input_"+id).attr("disabled",false);//变为可编辑的
	$(".input_"+id).focus();
	document.getElementById("ok_"+id).style.display="";
	document.getElementById("cancle_"+id).style.display="";
	document.getElementById("delete_"+id).style.display="none";
	document.getElementById("edit_"+id).style.display="none";	
}

/* 取消编辑按钮 */
function cancleEditIndexData(id)
{
	var lastValue = $(".input_"+id).attr("lastValue");//获取改变前的值	
	$("#input_"+id).val(lastValue);
	document.getElementById("ok_"+id).style.display="none";
	document.getElementById("cancle_"+id).style.display="none";
	document.getElementById("delete_"+id).style.display="";	
	document.getElementById("edit_"+id).style.display="";	
	$(".input_"+id).attr("disabled",true);//变为不可编辑的
}

/* 确认编辑提交 */
function saveEditIndexData(id)
{
	var value = $("#input_"+id).val();//获取改当前值
	$.ajax({
		url:"<%=path%>/indexData/save",
		type:"get",
		async:true,
		data:{"id":id,"value":value},
		dataType: "json", 
	    contentType: "application/json",
		success:function()
		{
			$("#input_"+id).attr("lastValue",value);
			document.getElementById("ok_"+id).style.display="none";
			document.getElementById("cancle_"+id).style.display="none";
			document.getElementById("delete_"+id).style.display="";	
			document.getElementById("edit_"+id).style.display="";	
			$(".input_"+id).attr("disabled",true);//变为不可编辑的
			alert("修改成功");
		},
		error:function()
		{
			alert("修改失败");
		}			
	});
}

/* 删除功能提交 */
function deleteIndexData(id)
{
	var isDel =  confirm('确定删除该条记录？', '确认对话框');
	if(isDel){
	   	$.ajax({
			url:"<%=path%>/indexData/delete",
			type:"get",
			async:true,
			data:{"id":id},
			dataType: "json", 
		    contentType: "application/json",
			success:function()
			{
				$(".tr_"+id).empty();
				alert("删除成功")
			},
			error:function()
			{
				alert("删除失败");
			}			
		});
}
}

function showAddIndexDataModel()
{
	$("#addIndexData").modal("show");
}


$("#selectIndex").change(function(){
	var id = $("#selectIndex").val()
	window.location.href="<%=path%>/indexData/list?type=${type}&&id="+id;
});

$("#selectType").change(function(){
	var type = $("#selectType").val()
	window.location.href="<%=path%>/indexData/list?id=0&&type="+type;
});

/* 日期选择定制 */
$(function(){
	$(".date_picker").datetimepicker({
			language:"ch",
		    weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	});
});
</script>
</html>
	