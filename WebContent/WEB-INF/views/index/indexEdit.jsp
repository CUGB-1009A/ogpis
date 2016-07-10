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
    	boolean isAdd = request.getAttribute("index")==null;
    %>
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
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
				<form class="form-horizontal" role="form" action="<%=path%>/index/save" method="post"  onsubmit="return test()">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${index.id }" name="id"/>
				    <input type="hidden" value="${planId}" name="planId"/>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexName">指标项</label>
						<div class="col-sm-9">
							<input type="text" id="indexName" placeholder="指标项名称" class="col-xs-10 col-sm-5" name="indexName" value="${index.indexName}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="selectCondition">类型</label>
						<div class="col-sm-9" style="text-align:left;padding:0;margin:0">
							<select id="indexType" name="indexType" class="col-xs-10 col-sm-5 selectpicker" data-style="btn-danger" style="margin:0;padding:0">
									<option value='undefined'>选择指标类型</option>
									<option value='char'>字符型(char)</option>
									<option value='int'>整数型(int)</option>
									<option value='float'>小数型(float)</option>				
							</select> 
						</div>
					</div>
					
					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexUnit">单位</label>

						<div class="col-sm-9">
							<input type="text" id="indexUnit" placeholder="单位" class="col-xs-10 col-sm-5" name="indexUnit" value="${index.indexUnit}">
						</div>
					</div>
					
					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexValue">目标值</label>

						<div class="col-sm-9">
							<input type="text" id="indexValue" placeholder="目标值" class="col-xs-10 col-sm-5" name="indexValue" value="${index.indexValue}">
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
function back()
{
	window.location.href="<%=path%>/index/back?planId=${planId}";
}

/* 保证四个数据都填写完成，否则不允许提交 */
function test()
{
	var indexName = $("#indexName").val();
	var indexType = $("#indexType").val();
	var indexUnit = $("#indexUnit").val();
	var indexValue = $("#indexValue").val();
	if(indexName==''||indexType=='undefined'||indexUnit==''||indexValue=='')
		{
		alert("请填写完整信息再提交！");
		return false;
		}		
}

/* 回显单位select控件 */
var indexType = "${index.indexType}";
if(indexType=='char')
	$('#indexType option:eq(1)').attr('selected','selected');
if(indexType=='int')
	$('#indexType option:eq(2)').attr('selected','selected');
if(indexType=='float')
	$('#indexType option:eq(3)').attr('selected','selected');

</script>
</html>
	