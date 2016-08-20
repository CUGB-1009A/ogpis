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
    <title>油气资源规划信息系统</title>
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
				<li class="active"><i class="icon-star "></i>指标项管理</li>
			</ul>
		</div>	
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title" style="float:left">
						<c:forEach items="${planType}" var="item" >
							<c:if test="${item.key.equals(type)}"><h3><b>${item}规划指标项定制</b></h3></c:if>
						</c:forEach>	
					</div>
						<div class="portlet-body">
							<div class="table-toolbar" style="text-align: right;">
								<div class="btn-group">
										<select id="selectType" name="type" class="selectpicker" data-style="btn-danger">
								    		<%-- <option value='QG' <c:if test="${type.equals('QG')}">selected</c:if>>全国</option>
								    		<option value='ZSY' <c:if test="${type.equals('ZSY')}">selected</c:if>>中石油</option>
								    		<option value='ZSH' <c:if test="${type.equals('ZSH')}">selected</c:if>>中石化</option>
								    		<option value='ZHY' <c:if test="${type.equals('ZHY')}">selected</c:if>>中海油</option>
								    		<option value='YC' <c:if test="${type.equals('YC')}">selected</c:if>>延长石油</option>
								    		<option value='ZLM' <c:if test="${type.equals('ZLM')}">selected</c:if>>中联煤</option>
								    		<option value='QT' <c:if test="${type.equals('QT')}">selected</c:if>>其他</option> --%>
								    		<c:forEach items="${planType}" var="item" >
												<option value='${item.key}' <c:if test="${item.key.equals(type)}">selected</c:if>>${item}</option>
											</c:forEach>	
								        </select>
								        &nbsp;&nbsp;
										<a href="<%=path%>/index/add?type=${type}" class="btn-sm btn-app btn-success no-radius">
												<i class="icon-plus bigger-200">&nbsp;添加指标</i>
										</a>
										&nbsp;&nbsp;								
								</div>
							</div>
						
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<!-- <th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxFirst"/>全选</th>
											 --><th>指标名称</th>
											<th>指标单位</th>
											<th>矿种类型</th>
											<th>指标类型</th>
											<th>优先级</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${indexList}" var="item1" varStatus="status">
												<tr class="odd gradeX tr_${item1.id}">
													<%-- <td class="check_cell">		
															 <input type="checkbox" class="checkboxes" name="checkbox" value="${item1.id}" />
													</td> --%>
													<td>${item1.indexName}</td>
													<td>${item1.indexUnit}</td>
													<td>
														<c:if test="${item1.mineType.equals('1')}">石油</c:if>
														<c:if test="${item1.mineType.equals('2')}">天然气</c:if>
														<c:if test="${item1.mineType.equals('3')}">煤层气</c:if>
														<c:if test="${item1.mineType.equals('4')}">页岩气</c:if>
														<c:if test="${item1.mineType.equals('5')}">其他</c:if>
													</td>
													<td>
														<c:if test="${item1.indexType.equals('1')}">新增探明地质储量</c:if>
														<c:if test="${item1.indexType.equals('2')}">产量</c:if>
													</td>
													<td>${item1.priority}</td>
													<td>
														<p>
														
															<a  href="<%=path%>/index/edit?id=${item1.id}" class="btn-sm btn-app btn-primary no-radius">
																	<i class="icon-edit bigger-200"></i>
																	编辑
															</a>&nbsp;
															<a href="javascript:deleteIndex('${item1.id}','${item1.plan_indexs.size()}');" class="btn-sm btn-app btn-danger no-radius">
																<i class="icon-trash bigger-200"></i>
																删除
															</a>&nbsp;
														</p>
													</td>
												</tr>
										    </c:forEach>
									</tbody>
								</table>
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


$("#selectType").change(function(){
	var type = $("#selectType").val()
	window.location.href="<%=path%>/index/list?type="+type;
});

function deleteIndex(id,isDeleted){
	var isDel =  confirm('确定删除该指标吗？删除后将不再提供给新的规划使用', '确认对话框');
	if(isDel){
		if(isDeleted==0)//判断是否在使用中，是的话不允许删除
			window.location.href="<%=path%>/index/delete?id="+id;
		else
			alert("该指标已经在使用中，不能删除");
				
	}
}
</script>
</html>
	