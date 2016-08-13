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
    <script type="text/javascript" src="<%=path%>/assets/ckeditor/ckeditor.js"></script>
    <title>油气资源规划管理系统</title>
     <%
    	String type = request.getAttribute("type").toString();
    %>

</head>
<html>
<body>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->
<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-star "></i>
					<a href="<%=request.getContextPath()%>/plan/list?condition=">规划管理</a>
				</li>
				<li class="active">新建规划</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<form class="form-horizontal" role="form" action="<%=path%>/plan/save"  method="post">
					<input type="hidden" value="true" name="isAdd"/>
					<input type="hidden" name="indexIds">
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-1">规划名称</label>
						<div class="col-sm-4">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-sm-12" name="planName">
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-4">发布时间</label>
					   	<div class="col-sm-4">
						   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-4" data-link-format="yyyy-mm-dd">
						   		<input type="text" id="form-field-4" placeholder="发布时间..." name="releaseDate" class="col-sm-10" readonly>
						   		<span class="add-on" ><i class="col-sm-2 icon-th"></i></span>	
						   	</div>		   
						</div>
					</div>

					  <div class="space-4"></div>
					  <div class="form-group">	
					    <label class="col-sm-2 control-label no-padding-right" for="form-field-2">规划代号</label>
						<div class="col-sm-4">
							<input type="text" id="form-field-2" placeholder="规划代号" class="col-sm-12" name="planCode">
						</div>	
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-5">规划起始时间</label>
						<div class="col-sm-4">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-5" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-5" placeholder="规划起始时间..." class="col-sm-10" name="startTime" readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-3">发布单位</label>
						<div class="col-sm-4">
							<input type="text" id="form-field-3" placeholder="发布单位..." class="col-sm-12" name="releaseUnit">
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-6">规划截止时间</label>
						<div class="col-sm-4">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-6" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-6" placeholder="规划截止时间..." class="col-sm-10" name="endTime"readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
				    </div>  
				
					<div class="space-4"></div> 	
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-7">规划概述</label>
						<div class="col-sm-4">
						    <textArea id="form-field-7"  style="height:80px" class="col-sm-12" placeholder="规划概述..." name="planShortDescription"></textArea>
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-11">规划类型</label>
						<div class="col-sm-4">
							<select id="planType" name="type" class="selectpicker col-sm-10" data-style="btn-success">
							<c:forEach items="${planType}" var="item" >
								<option value='${item.key}'>${item}</option>
							</c:forEach>
							    	<!-- <option value='QG'>全国规划</option>
							    	<option value='ZSY'>中石油规划</option>
							    	<option value='ZSH'>中石化规划</option>
							    	<option value='ZHY'>中海油规划</option>
							    	<option value='YC'>延长石油规划</option>
							    	<option value='ZLM'>中联煤规划</option>
							    	<option value='QT'>其他公司规划</option> -->
							</select>
						</div>
					</div> 
				
					<div class="space-4"></div> 
					 <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-8">规划背景和依据</label>
						<div class="col-sm-10">
						    <textArea id="form-field-8"  style="height:70px"  class="col-sm-12" name="planDescription"></textArea>
							<script type="text/javascript">CKEDITOR.replace('planDescription',
									{   
										filebrowserImageUploadUrl : '<%=path%>/uploadImg',  
										language : 'zh-cn',  
									});</script>
						</div>
					</div>  
					
						<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" onclick="addPlan()">
								<i class="icon-ok bigger-200"></i>
								确认
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

function addPlan()
{
	var indexIds='';
	var $chosedIndex = $("[name=checkbox]:checked");
	for(var i=0;i<$chosedIndex.length;i++)
	{
		indexIds = indexIds + $chosedIndex[i].value+","
	}
	$("[name=indexIds]").val(indexIds);
}
/* 指标全选响应函数 */
$(function(){
			$("[name='indexCheckBox']").click(function(){		
			if($("[name='indexCheckBox']")[0].checked)
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
	