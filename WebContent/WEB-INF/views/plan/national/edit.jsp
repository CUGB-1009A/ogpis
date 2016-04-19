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
    	boolean isAdd = request.getAttribute("nationalPlan")==null;
    	System.out.println(isAdd);
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
				
				<li class="active">
					<c:if test='<%=!isAdd %>'>编辑规划</c:if>
					<c:if test='<%=isAdd %>'>添加规划</c:if>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/plan/national/save">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${nationalPlan.id}" name="id"/>
				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-xs-10 col-sm-5" name="planName" value="${nationalPlan.planName }">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-2">规划代号</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-2" placeholder="规划代号..." class="col-xs-10 col-sm-5" name="planCode" value="${nationalPlan.planCode }">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-3">发布单位</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-3" placeholder="发布单位..." class="col-xs-10 col-sm-5" name="releaseUnit" value="${nationalPlan.releaseUnit }">
						</div>
					</div>
					<div class="space-4"></div>
			 		
					  <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-4">发布时间</label>
						   	
						   	<div class="col-sm-9">
							   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-4" data-link-format="yyyy-mm-dd">
							   		<input type="text" id="form-field-4" placeholder="发布时间..." class="col-xs-10 col-sm-5" name="releaseDate" value="${nationalPlan.releaseDate.toLocaleString()}" readonly>
							   		<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							   	</div>		   
							</div>
					</div> 
					
					<div class="space-4"></div>
					
					  <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-5">规划起始时间</label>

						<div class="col-sm-9">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-5" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-5" placeholder="规划起始时间..." class="col-xs-10 col-sm-5" name="startTime" value="${nationalPlan.startTime.toLocaleString()}" readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
					</div>  
					<div class="space-4"></div>
					
					
				 	 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-6">规划截止时间</label>

						<div class="col-sm-9">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-6" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-6" placeholder="规划截止时间..." class="col-xs-10 col-sm-5" name="endTime" value="${nationalPlan.endTime.toLocaleString()}" readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
					</div>
					<div class="space-4"></div> 
					
					 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-7">规划描述</label>

						<div class="col-sm-9">
						    <textArea id="form-field-7"  style="height:70px" placeholder="规划描述..." class="col-xs-10 col-sm-5" name="planDescription"></textArea>
						</div>
					</div>  
					
					

					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" >
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
							&nbsp; &nbsp; &nbsp;
							<button class="btn-sm btn-success no-radius" type="reset">
								<i class="icon-undo bigger-200"></i>
								重置
							</button>
						</div>
					</div>
				</form>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
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

</script>
</html>
	