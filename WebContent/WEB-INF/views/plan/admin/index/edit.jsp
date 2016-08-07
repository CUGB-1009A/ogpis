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
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../../main/main_header.jsp"%>
		<%@ include file="../../../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	
	<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li class="#">修改指标值</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/plan/admin/saveTargetValue" method="post"  onsubmit="return verify()">
					<input type="hidden" value="${plan_Index.index.id}" name="indexId"/>
				    <input type="hidden" value="${plan_Index.plan.id}" name="planId"/>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexName">指标项</label>
						<div class="col-sm-9">
							<input type="text" readonly="readonly" id="indexName" placeholder="指标项名称" class="col-xs-10 col-sm-5" name="indexName" value="${plan_Index.index.indexName}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexValue">目标值</label>

						<div class="col-sm-9">
							<input type="text" id="targetValue" placeholder="目标值" required="required" class="col-xs-10 col-sm-5" name="targetValue" value="${plan_Index.targetValue}">
						</div>
					</div>
					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit">
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
							
							<button class="btn-sm btn-success no-radius" type="button" onclick="back()" >
								<i class="icon-share-alt bigger-200"></i>
								返回
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
/* 返回指标列表 */
function back(){
	window.location.href="<%=path%>/index/back?planId=${plan_Index.plan.id}";
	}

function verify() {
	var indexValue = $("#indexValue").val();
	if(indexValue.length<=0){
		alert("请填写目标值！");
		return false;
	}
}
</script>
</html>
	