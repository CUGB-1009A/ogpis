<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/assets/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <title>油气资源规划管理系统</title>
     <%
    	String flag = request.getAttribute("flag").toString();
     %> 

</head>
<html>
<body>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
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
					<a href="<c:url value='/main'/>">首页</a>
				</li>
				<li>
					<a href="<c:url value='/plan/national/list'/>">全国规划管理</a>
				</li>
				<li class="active">全国规划详情</li>

			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
		<ul id="myTab" class="nav nav-tabs">
			  
			  <c:if test='<%=flag.equals("1") %>'>
			   <li class="active"><a href="#overview" data-toggle="tab">规划概述</a></li>
			   </c:if>
			  <c:if test='<%=!flag.equals("1") %>'>
			       <li><a href="#overview" data-toggle="tab">规划概述</a></li>
			  </c:if>
			 	
			   <c:if test='<%=flag.equals("2") %>'>
			   <li class="active">
			   		<a href="#document" data-toggle="tab">文档资料</a>
			   	</li>
			   	</c:if>			   	
			   	 <c:if test='<%=!flag.equals("2") %>'>
			   <li>
			   		<a href="#document" data-toggle="tab">文档资料</a>
			   	</li>
			   	</c:if>
			   	
			    <c:if test='<%=flag.equals("3") %>'>
			   	<li class="active">
			   		<a href="#excel" data-toggle="tab">量化表</a>
			   	</li>
			   	</c:if>
			   		 <c:if test='<%=!flag.equals("3") %>'>
			   	<li>
			   		<a href="#excel" data-toggle="tab">量化表</a>
			   	</li>
			   	</c:if>
			   	
			    <c:if test='<%=flag.equals("4") %>'>
			   	<li class="active">
			   		<a href="#track" data-toggle="tab">规划跟踪</a>
			   	</li>
			   	</c:if>
			   		 <c:if test='<%=!flag.equals("4") %>'>
			   	<li>
			   		<a href="#track" data-toggle="tab">规划跟踪</a>
			   	</li>
			   	</c:if>
		</ul>
		
		<div id="myTabContent" class="tab-content">
		<!-- tab页第一项 -->
		<div class="tab-pane fade" id="overview">	      
		<div class="row">
			<div class="col-xs-12">
			&nbsp;
				<form class="form-horizontal" role="form" action="<%=path%>/plan/national/editOverview">
				<input type="hidden" value="${nationalPlan.id}" name="id"/>				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-xs-10 col-sm-5" name="planName" value="${nationalPlan.planName }" readonly>
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-3">发布单位</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-3" placeholder="发布单位..." class="col-xs-10 col-sm-5" name="releaseUnit" value="${nationalPlan.releaseUnit }"readonly>
						</div>
					</div>
					<div class="space-4"></div>
			 		
					  <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-4">发布时间</label>
						   	
						   	<div class="col-sm-9">
						   		<%-- <div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-4" data-link-format="yyyy-mm-dd">
						   			<input type="text" id="form-field-4" placeholder="发布时间..." class="col-xs-10 col-sm-5" name="releaseDate" value="${nationalPlan.releaseDate.toLocaleString()}" readonly>		   
									<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
								</div> --%>
								<input type="text" id="form-field-4" placeholder="发布时间..." class="col-xs-10 col-sm-5" name="releaseDate" value="${nationalPlan.releaseDate.toLocaleString()}" readonly>		   
							</div>
					</div> 
					
					<div class="space-4"></div>
					
					 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-7">规划描述</label>

						<div class="col-sm-9">
						    <textArea id="form-field-7"  style="height:100px" placeholder="规划描述..." class="col-xs-10 col-sm-5" name="planDescription"></textArea>
						</div>
					</div>  
				<!-- 	<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" >
								<i class="icon-ok bigger-200"></i>
								确认修改
							</button>
						</div>
					</div> -->
				</form>
			</div><!-- /span -->
		</div><!-- /row -->
	 </div>
		  <!--  tab页第二项 -->
	 <div class="tab-pane fade" id="document">
	 &nbsp;
		 <div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
					</div>
					<div class="portlet-body">
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
								<a href="javascript:showModal();" class="btn-sm btn-app btn-success no-radius">
									<i class="icon-plus bigger-200">&nbsp;上传文档</i>
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
											<th>文档描述</th>
											<th>上传时间</th>
											<!-- <th>上传者</th> -->
											<th>操作</th>
										</tr>
									</thead>
									
									<tbody>
										<c:forEach items="${planDocumentSet}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkbox" value="${item.id}" />
												</td>
												<td>${item.documentName}</td>
												<td>${item.documentDescription}</td>
												<td>${item.uploadDate}</td>
												<td>
													<p>
														<a  href="<c:url value='/plan/national/downloadDoc?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-success bigger-200"></i>
															下载
														</a>
														&nbsp;
														<a href="javascript:del('<c:url value='/plan/national/deleteDoc?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
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
							<!-- 模态框 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:1600px">  
							  <div class="modal-dialog">  
							    <div class="modal-content">  
							      <div class="modal-header">  
							        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>  
							        <h3 class="modal-title">文件上传</h3>  
							      </div>  
							      <div class="modal-body"> 
									
									<div class="row">
										<div class="col-md-12" >
											<form id="docForm" class="form-horizontal" role="form" action="<%=path%>/plan/national/uploadFiles" method="post" enctype="multipart/form-data">
											<input type="hidden" id="hiddenId" value="${nationalPlan.id}" name="id"/>	
												<div class="form-group col-md-8 col-md-offset-2 " >
												    <label class="col-md-4 control-label">选择文件</label>
												    <div class="col-md-8">
														<input id="file" type="file" name="file" onchange="showFileList()" multiple>
												    </div>
												</div>
												
												<div class="form-group col-md-offset-2 col-md-8" >
													<label class="col-md-4 control-label">文件清单</label>
												    <div class="col-md-8">
														<textarea id="fileList" name="fileList" rows="4" cols="20" style="height:120px;width:400px" readonly></textarea>
												    </div>
												</div>
												
												<div class="form-group col-md-offset-2 col-md-8" >
													<label class="col-md-4 control-label"></label>
												</div>
												
												<div class="form-group col-md-offset-2 col-md-8" >
													<label class="col-md-4 control-label">文件描述</label>
												    <div class="col-md-8">
														<textarea id="fileDescription" name="fileDescription" rows="4" cols="20" style="height:120px;width:400px"></textarea>
												    </div>
												</div>
											</form>
										</div>
									</div>

							      </div>  
							      <div class="modal-footer">
							        <button type="button" class="btn btn-primary" id="upload">上传</button>    
							        <button type="button" class="btn btn-default" id="cancel">取消</button>   
							      </div>  
							    </div><!-- /.modal-content -->  
							  </div><!-- /.modal-dialog -->  
							</div><!-- /.modal -->  

						</div>
					</div>
            	</div>
            </div>
		</div>
	</div>
		    
		    
		    <div class="tab-pane fade " id="excel">
		      <p>I am the excel about the national plan</p>
		    </div>
		   	<div class="tab-pane fade" id="track">
		      <p>I will track the plan</p>
		  	 </div>
				
				</div>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
	var flag = ${flag};
	if(flag=='1')
		$("#overview").toggleClass("in active");		
	if(flag=='2')
		$("#document").toggleClass("in active");
	if(flag=='3')
		$("#excel").toggleClass("in active");
	if(flag=='4')
		$("#track").toggleClass ('in active'); 	
});

var description = '${nationalPlan.planDescription}';
$(function(){
	document.getElementById("form-field-7").value = description ;
	/* $("#form-field-7").value = description ;  */
});

$(function(){
	$(".date_picker").datetimepicker({
		    weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	});
});

function showModal()
{
	$("#myModal").modal("show");
}

var nationalPlanId =  '${nationalPlan.id}';
$(function(){
	$("#cancel").click(function(){
		document.getElementById("fileDescription").value = "" ;
		document.getElementById("fileList").value = "" ;
		var fileInput = $("#file");  
		fileInput.replaceWith(fileInput.clone());  
		$("#myModal").modal("hide");
	});
	$("#upload").click(function(){
		var temp = document.getElementById("fileList").value;
		if(temp=="")
			{
			alert("请先选择文件再上传");
			return;
			}
		$("#docForm").submit();
		var tempId =  document.getElementById("hiddenId").value;
		document.getElementById("fileDescription").value = "" ;
		document.getElementById("fileList").value = "" ;
		var fileInput = $("#file");  
		fileInput.replaceWith(fileInput.clone());  
		$("#myModal").modal("hide");
	});
	
});

function showFileList()
{
	var fileNames ="";
	var imageEle = document.getElementById("file");

	var fileList = imageEle.files;

	for(var i = 0 ; i < fileList.length ; i ++)
	{
		var file = fileList[i];
		fileNames += "第" + (i + 1) + "个：" + file.name+'\r\n';
	}
	document.getElementById("fileList").value = fileNames;
}



</script>
</html>
	