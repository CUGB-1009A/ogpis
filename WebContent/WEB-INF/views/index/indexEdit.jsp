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
		<%@ include file="../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->
	
	<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-star "></i>
					<a href="<%=request.getContextPath()%>/index/list?type=${type}">指标项管理</a>
				</li>
				<c:if test="<%=isAdd%>">
					<li class="active">新建指标</li>
				</c:if>
				<c:if test="<%=!isAdd%>">
					<li class="active">修改指标</li>
				</c:if>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/index/save" method="post"  onsubmit="return test()">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${index.id}" name="id"/>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexName">指标项名称</label>
						<div class="col-sm-9">
							<input type="text" id="indexName" placeholder="指标项名称" class="col-xs-10 col-sm-5" name="indexName" value="${index.indexName}">
						</div>
					</div>
					
					<div class="space-4"></div>	
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexUnit">指标单位</label>

						<div class="col-sm-9">
							<input type="text" id="indexUnit" placeholder="指标单位" class="col-xs-10 col-sm-5" name="indexUnit" value="${index.indexUnit}">
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="selectIndex">指标类型</label>
						<div class="col-sm-9" style="text-align:left">
							<select id="selectType" name="type" class="selectpicker col-xs-10 col-sm-5" data-style="btn-danger" style="text-align:left">
										<option value='QG' <c:if test="${type.equals('QG')}">selected</c:if>>全国</option>
							    		<option value='ZSY' <c:if test="${type.equals('ZSY')}">selected</c:if>>中石油</option>
							    		<option value='ZSH' <c:if test="${type.equals('ZSH')}">selected</c:if>>中石化</option>
							    		<option value='ZHY' <c:if test="${type.equals('ZHY')}">selected</c:if>>中海油</option>
							    		<option value='YC' <c:if test="${type.equals('YC')}">selected</c:if>>延长石油</option>
							    		<option value='ZLM' <c:if test="${type.equals('ZLM')}">selected</c:if>>中联煤</option>
							    		<option value='QT' <c:if test="${type.equals('QT')}">selected</c:if>>其他</option>	    
							</select>   
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="selectIndex">矿种类型</label>
						<div class="col-sm-9" style="text-align:left">
							<select id="selectMineType" name="mineType" class="selectpicker col-xs-10 col-sm-5" data-style="btn-danger" style="text-align:left">
										<option value='1' <c:if test="${index.mineType.equals('1')}">selected</c:if>>石油</option>
							    		<option value='2' <c:if test="${index.mineType.equals('2')}">selected</c:if>>天然气</option>
							    		<option value='3' <c:if test="${index.mineType.equals('3')}">selected</c:if>>煤层气</option>
							    		<option value='4' <c:if test="${index.mineType.equals('4')}">selected</c:if>>页岩气</option>
							    		<option value='5' <c:if test="${index.mineType.equals('5')}">selected</c:if>>其他</option>	       
							    </select>
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="selectIndex">储产量</label>
						<div class="col-sm-9" style="text-align:left">
							<select id="selectIndexType" name="indexType" class="selectpicker col-xs-10 col-sm-5" data-style="btn-danger">
										<option value='1' <c:if test="${index.indexType.equals('1')}">selected</c:if>>新增探明地质储量</option>
							    		<option value='2' <c:if test="${index.indexType.equals('2')}">selected</c:if>>产量</option>		       
							    </select>
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="indexType">优先级</label>
						<div class="col-sm-9">
							<input type="text" id="priority" placeholder="优先级" class="col-xs-10 col-sm-5" name="priority" value="${index.priority}">			
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
	window.location.href="<%=path%>/index/list?type=${type}";
}

/* 保证四个数据都填写完成，否则不允许提交 */
function test()
{
	var indexName = $("#indexName").val();
	var indexType = $("#indexType").val();
	var indexUnit = $("#indexUnit").val();
	var indexValue = $("#indexValue").val();
	if(indexName==''||indexType==''||indexUnit==''||indexValue=='')
		{
		alert("请填写完整信息再提交！");
		return false;
		}		
}


</script>
</html>
	