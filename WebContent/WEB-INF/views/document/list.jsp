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
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li class="active"><i class="icon-file"></i> 文档管理</li>
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
						<form id="queryDocument" action="<%=path%>/document/list">
								<span title="根据规划或文档名进行文档的查询">查询条件：</span>	
								&nbsp;
								<!-- <select id="selectCondition" name="selectCondition">
									<option value='0'>输入选择查询条件</option>
									<option value='1'>按规划查询</option>
									<option value='2'>按文档名称查询</option>
								</select>  -->
								
								<select id="selectCondition" name="selectCondition" class="selectpicker" data-style="btn-danger">
							    	<option value='0'>输入选择查询条件</option>
									<option value='1'>按规划查询</option>
									<option value='2'>按文档名称查询</option>
							    </select>
								
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span title="输入查询值">查询值：</span>	
								&nbsp;
								<input type="text" id="inputValue" placeholder="查询值..."  name="inputValue" value="${inputValue}" >
								<select class="selected" id="selectValue" name="selectValue" style="display:none;height:50px;width:246px">
									
								</select> 

								&nbsp;&nbsp;
								<a href="javascript:queryDocument();" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-search bigger-200">&nbsp;查询</i>
								</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:downloadZip()" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-arrow-down bigger-200">&nbsp;打包下载</i>
								</a>
								&nbsp;
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
											<th>文档名称</th>
											<th>文档概述</th>
											<th>上传时间</th>											
											<th>对应规划</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${planDocuments.items}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkbox" value="${item.id}" />
												</td>
												<td><a target="_blank" href="<c:url value='/document/previewDocument?id=${item.id}&&editType=0'/>">${item.documentName}</a></td>
												<td>${item.documentDescription}</td>
												<td><fmt:formatDate value="${item.uploadDate}" pattern="YYYY-MM-dd"/></td>
												<td>${item.plan.planName}</td>
												<td>
													<p>
														<a  href="<c:url value='/document/downloadDocument?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-arrow-down bigger-200"></i>
															下载
														</a>
														&nbsp;
														<a href="javascript:del('<c:url value='/document/deleteDocument?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
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
							<c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="planDocuments"/>
		        				<c:param name="urlAddress" value="/document/list"/>
	       				 	</c:import>
						</div>
					</div>
            	</div>
            	
            			<div class="modal fade" id="myModalTips" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
							style="width: 1600px">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title">提示</h3>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-md-12">
												<div style="width: 100%">
													<span>正在打包中 ... ...</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
				
						
            </div>
		</div>
	</div>	
</div>

</body>
<script type="text/javascript">
$(function(){
	var selectCondition = "${selectCondition}";
	var selectValue = "${selectValue}";
	var planChosed;
	if(selectCondition=='1')
		{	
		document.getElementById("inputValue").style.display = "none";
		document.getElementById("selectValue").style.display = "";
		$('#selectCondition option:eq(1)').attr('selected','selected');
		$.ajax({
			url:"<%=path%>/document/findAllPlans",
			type:"POST",
			async:true,
			dataType: "json", 
		    contentType: "application/json",
			success:function(data)
			{
				document.getElementById("selectValue").options.length=0;
			    for(var i=0;i<data.length;i++)
				    {
				    	if(selectValue==data[i].planId)
				    		{
				    		document.getElementById("selectValue").options.add(new Option(data[i].planName,data[i].planId));
				    		planChosed = i;
				    		}
				    	else
				    		document.getElementById("selectValue").options.add(new Option(data[i].planName,data[i].planId));
			    	}
			  $('#selectValue option:eq('+planChosed+')').attr('selected','selected');
			},
			error:function()
			{
				alert("找不到对应规划");
			}			
		});	
		}
	if(selectCondition=='2')
		$('#selectCondition option:eq(2)').attr('selected','selected');		
});

$("#selectCondition").change(function(){
	var selectCondition = $("#selectCondition").val();
	if(selectCondition=='0'||selectCondition=='2')
		{
		document.getElementById("inputValue").style.display = "";
		document.getElementById("selectValue").style.display = "none"; 
		}
	if(selectCondition=='1')
		{
		document.getElementById("inputValue").style.display = "none";
		document.getElementById("selectValue").style.display = "";
		//ajax查询出所有规划并添加到列表中
		$.ajax({
			url:"<%=path%>/document/findAllPlans",
			type:"POST",
			async:true,
			dataType: "json", 
		    contentType: "application/json",
			success:function(data)
			{
				document.getElementById("selectValue").options.length=0;
			    for(var i=0;i<data.length;i++)
			    	{
			    	document.getElementById("selectValue").options.add(new Option(data[i].planName,data[i].planId));
			    	}
			},
			error:function()
			{
				alert("找不到对应规划");
			}			
		});
		}
});

function queryDocument()
{
	var selectCondition = $("#selectCondition").val();
	var inputValue = $("#inputValue").val();
	if(selectCondition=='0')
		{
		alert("请选择查询条件！");
		return;
		}
	if(selectCondition=='2')
		{
		if(inputValue=="")
			{
			alert("请输入查询值！")
			return ;
			}
		}
	$("#queryDocument").submit();
		
}

function del(url){
	var isDel =  confirm('确定删除该文档？', '确认对话框');
	if(isDel){
		window.location.href=url;
	}
}

/* 批量删除文档响应函数 */
function delAll()
{
	var checkedObject =  $("input[name='checkbox']:checked");
	if(checkedObject.length==0)
		{
		alert("至少选择一个文档再删除！");
		return false;
		}	
	var isDelAll =  confirm('确定删除选定文档？', '确认对话框');
	var idTemp="";
	if(isDelAll)
	{
		for(var i=0;i<checkedObject.length;i++)
		{
			idTemp+=checkedObject[i].value+",";
		}
		$.ajax({
			url:"<%=path%>/document/deleteDocuments",
			data:{"Ids":idTemp},
			type:"POST",
			async:true,
			success:function()
			{
			window.location.href="<%=path%>/document/list?selectCondition=0";
			},
			error:function()
			{
				alert("批量删除错误");
			}			
		});
	}
}

/* 打包下载文档响应函数 */
function downloadZip()
{
	var checkedObject =  $("input[name='checkbox']:checked");
	if(checkedObject.length==0)
		{
		alert("至少选择一个文档再打包下载！");
		return false;
		}	
	var idTemp="";
	$('#myModalTips').modal({backdrop: 'static', keyboard: false});		
	if(true)
	{		
		for(var i=0;i<checkedObject.length;i++)
		{
			idTemp+=checkedObject[i].value+",";
		}		
		$.ajax({
			url:"<%=path%>/document/zipDocuments",
			data:{"Ids":idTemp},
			type:"POST",
			async:true,
			success:function(data)
			{
				$("#myModalTips").modal("hide");
				var downloadNow =  confirm('打包已完成，开始下载？', '确认对话框');
				if(downloadNow)//下载
				  window.location.href="<%=path%>/document/downloadZip?zipFileName="+ data.tmpFileName;
 				else//不下载，同时需要删除后台的压缩文件	  				  
					$.ajax({
						url:"<%=path%>/document/deleteZip",
						data:{"zipFileName":data.tmpFileName},
						type:"POST",
						async:true,
						success:function(){
							
						}
					});
			},
			error:function()
			{
				alert("打包下载失败");
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
	