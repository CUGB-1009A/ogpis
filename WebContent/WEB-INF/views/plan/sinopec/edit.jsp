<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
    <%
    	boolean isAdd = request.getAttribute("sinopecPlan")==null;
    	System.out.println(isAdd);
    %>
</head>
<html>
<body>
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
					<a href="#">首页</a>
				</li>
				<li>
					<a href="#">规划管理</a>
				</li>
				<li>
					<a href='<c:url value="/plan/sinopec/list"/>'>中石化规划</a>
				</li>
				<li class="active">
					<c:if test='<%=!isAdd %>'>编辑规划</c:if>
					<c:if test='<%=isAdd %>'>添加规划</c:if>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" action="<%=path%>/plan/sinopec/save">
					<input type="hidden" value="<%=isAdd%>" name="isAdd"/>
					<input type="hidden" value="${sinopecPlan.id }" name="id"/>
				
			        <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划时间段</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="请输入规划时间段.." class="col-xs-10 col-sm-5" name="planPeriod" value="${sinopecPlan.planPeriod}">
						</div>
					</div>
					<div class="space-4"></div>
					
					 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">勘探投资</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="勘探投资.." class="col-xs-10 col-sm-5" name="investment" value="${sinopecPlan.investment}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">石油探明地质储量</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="石油探明地质储量.." class="col-xs-10 col-sm-5" name="explore_oil" value="${sinopecPlan.explore_oil}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">天然气探明地质储量</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="天然气探明地质储量.." class="col-xs-10 col-sm-5" name="explore_gas" value="${sinopecPlan.explore_gas}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">石油产量</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="石油产量.." class="col-xs-10 col-sm-5" name="production_oil" value="${sinopecPlan.production_oil}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">天然气产量</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="天然气产量.." class="col-xs-10 col-sm-5" name="production_gas" value="${sinopecPlan.production_gas}">
						</div>
					</div>

					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">勘探工程</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="勘探工程.." class="col-xs-10 col-sm-5" name="exploration" value="${sinopecPlan.exploration}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">销售收入</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="销售收入.." class="col-xs-10 col-sm-5" name="revenue" value="${sinopecPlan.revenue}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">油田勘探</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="油田勘探.." class="col-xs-10 col-sm-5" name="ytkt" value="${sinopecPlan.ytkt}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">油气集输</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="油气集输.." class="col-xs-10 col-sm-5" name="yqjs" value="${sinopecPlan.yqjs}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">油田开发</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="油田开发.." class="col-xs-10 col-sm-5" name="ytkf" value="${sinopecPlan.ytkf}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">炼油工程</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="炼油工程.." class="col-xs-10 col-sm-5" name="lygc" value="${sinopecPlan.lygc}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">化工生产</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="化工生产.." class="col-xs-10 col-sm-5" name="hgsc" value="${sinopecPlan.hgsc}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">水电设施规划</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="水电设施规划.." class="col-xs-10 col-sm-5" name="sdszgh" value="${sinopecPlan.sdszgh}">
						</div>
					</div>
					
					<div class="space-4"></div>
			
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">产品销售</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="产品销售.." class="col-xs-10 col-sm-5" name="cpxs" value="${sinopecPlan.cpxs}">
						</div>
					</div>

					<div class="space-4"></div>
					
					<c:forEach items="${columns}" var="itemCustom">
						<div class="space-4"></div>
					
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${itemCustom.name}</label>
	
							<div class="col-sm-9">
								<input type="text" id="form-field-1" placeholder="请输入${itemCustom.name}.." class="col-xs-10 col-sm-5" name="${itemCustom.name}" value="${expandoValuesMap[itemCustom.name].data}">
							</div>
						</div>
					</c:forEach> 
					
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

</script>
</html>
	