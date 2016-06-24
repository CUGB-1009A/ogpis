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
    	boolean isAdd = request.getAttribute("user")==null;
    	System.out.println(isAdd);
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
				
				<li class="#">
					<c:if test='<%=isAdd %>'>添加指标</c:if>
					<c:if test='<%=!isAdd %>'>修改指标</c:if>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${user.id }" name="id"/>
				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">指标项</label>
						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="指标项名称" class="col-xs-10 col-sm-5" name="indexName" value="">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="selectCondition">类型</label>
						<div class="col-sm-9" style="text-align:left;padding:0;margin:0">
							<select id="selectCondition" name="type" class="col-xs-10 col-sm-5 selectpicker" data-style="btn-danger" style="margin:0;padding:0">
									<option value='1'>字符</option>
									<option value='2'>整数</option>
									<option value='3'>小数</option>				
							</select> 
						</div>
					</div>
					
					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-3">单位</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-3" placeholder="单位" class="col-xs-10 col-sm-5" name="" value="">
						</div>
					</div>
					
					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-4">目标值</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-4" placeholder="目标值" class="col-xs-10 col-sm-5" name="" value="">
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" onclick="test()" >
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

</script>
</html>
	