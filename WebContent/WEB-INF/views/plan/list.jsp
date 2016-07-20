<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <%
    	String type = request.getAttribute("type").toString();
        String plansNumber = request.getAttribute("plansNumber").toString();
        String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    	<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/AdminLTE.css">
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/_all-skins.min.css">	
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/blue.css">
</head>
<html>
	<body>
	<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav.jsp"%>
	</nav>

		<div class="panel-group" id="accordion">
		  <c:if test='<%=!plansNumber.equals("0")%>'> 
		    <c:forEach items="${mapList}" var="item1" varStatus="status">
			<div class="panel panel-default">
			<c:forEach items="${item1}" var="item_plan"  begin="0" end="0">
				<div class="panel-heading">
					<h4 class="panel-title" align="left">
						<input type="checkbox"/>
				        <a data-toggle="collapse" data-parent="#accordion" 
				          href="#collapseOne${status.index}">
				                             ${item_plan.key.planName}
				        </a>
				        <i class="icon-time">&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${item_plan.key.releaseDate}" pattern="YYYY-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;</i>
	                </h4>
				</div>
				</c:forEach>

				<div id="collapseOne${status.index}" class="panel-collapse collapse">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12">
								<div class="box" style="margin-bottom: 0px;margin-top: 0px;">
									<!--上-->
									<div class="box-header" style="background-color: #f7f7f8;">
										<div class="row">
											<div class="col-xs-12">
												<!--规划背景-->
												<div class="col-xs-3">
													<div id="myCarousel${status.index}" class="carousel slide" style="height: 150px;">
														<!-- 轮播（Carousel）项目 -->
														<div class="carousel-inner activePicture">
															<c:forEach items="${item1}" var="item_picture" begin="2" end="2">
																<c:forEach items="${item_picture.value}" var="pictures">
																	<c:if test="${pictures.picturePurpose.equals('1')}">
																		<div class="item">
																			<img src="<%=basePath1%>${pictures.pictureAddress}" alt="${pictures.pictureName}" style="width: 100%;max-height:150px;">
																		</div>
																	</c:if>
																</c:forEach>
															</c:forEach>
																
														</div>
														<!-- 轮播（Carousel）导航 -->
														<a class="carousel-control left" href="#myCarousel${status.index}" data-slide="prev" style="padding-top:15%;">&lsaquo;</a>
														<a class="carousel-control right" href="#myCarousel${status.index}" data-slide="next" style="padding-top:15%;">&rsaquo;</a>
													</div>

												</div>
												<!--规划依据-->
												<div class="col-xs-9">
												<h5><b>规划背景和依据</b></h5>
													<p style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 135px;overflow:auto; width:100%">
														Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
													    Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
														Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
	        											Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
													    Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
														Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
	        											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher  
													
													</p>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<!--中-->
									<div class="box-body" style="background-color: #f7f7f8;">
										<div class="row">
											<div class="col-xs-12">
												<!--截图-->
												<div class="col-xs-3">
													<div id="myCarousel1${status.index}" class="carousel slide" style="height: 150px;">
														<!-- 轮播（Carousel）项目 -->
														<div class="carousel-inner activePicture">
															<c:forEach items="${item1}" var="item_picture" begin="2" end="2">
																<c:forEach items="${item_picture.value}" var="pictures">
																	<c:if test="${pictures.picturePurpose.equals('2')}">
																		<div class="item">
																			<img src="<%=basePath1%>${pictures.pictureAddress}" alt="${pictures.pictureName}" style="width: 100%;max-height:150px;">
																		</div>
																	</c:if>
																</c:forEach>
															</c:forEach>
														</div>
														<!-- 轮播（Carousel）导航 -->
														<a class="carousel-control left" href="#myCarousel1${status.index}" data-slide="prev" style="padding-top:15%;">&lsaquo;</a>
														<a class="carousel-control right" href="#myCarousel1${status.index}" data-slide="next" style="padding-top:15%;">&rsaquo;</a>
													</div>

												</div>
												<div class="col-xs-9">
												<!--详情-->
												<div class="col-xs-6" style="margin: 0;padding: 0;">
													<span><b>详情</b></span>
													<c:forEach items="${item1}" var="item_detail" begin="0" end="0">
													<p style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 135px;overflow:auto; width:100%">
														<b>${item_detail.key.planName}</b>是<b>${item_detail.key.releaseUnit}</b>于<b><fmt:formatDate value="${item_detail.key.releaseDate}" pattern="YYYY-MM-dd"/></b>
														发布的规划，规划代号为<b>${item_detail.key.planCode}</b>，规划时间段是从<b><fmt:formatDate value="${item_detail.key.startTime}" pattern="YYYY-MM-dd"/></b>到<b><fmt:formatDate value="${item_detail.key.endTime}" pattern="YYYY-MM-dd"/></b>。“规划的简短描述”：
														<b>${item_detail.key.planDescription}</b>
													</p>
													</c:forEach>
												</div>
												<!--文档-->
												<div class="col-xs-6" style="margin: 0;padding: 0;">
													<span><b>文档</b></span>
													<div style="height: 135px;overflow:auto; width:100%">
													<c:forEach items="${item1}" var="item_detail1" begin="1" end="1">
														<c:forEach items="${item_detail1.value}" var="item_documents">
														<a target="_blank" title="点击在线预览" href="<c:url value='/document/previewDocument?id=${item_documents.id}&&editType=0'/>">${item_documents.documentName}</a>&nbsp;&nbsp;&nbsp;
														<a  title="点击下载" href="<c:url value='/document/downloadDocument?id=${item_documents.id}'/>" class="btn btn-default">				
											           下载</a>
														<br>
														</c:forEach>
													</c:forEach>
													</div>
												</div>
												</div>
											</div>
										</div>
									</div>
									<hr>
									<div class="box-body" style="background-color: #f7f7f8;">
										<div class="row">
											<div class="col-xs-12">
													<!--指标-->
												<div class="col-xs-11">
													<div class="col-xs-12">
															<div class="col-xs-6" style="border:solid 1px">
														        <span><b>指标1</b></span>
														        <div style="height: 180px;"></div>
													        </div>
													        <div class="col-xs-6" style="border:solid 1px">
														        <span><b>指标2</b></span>
														        <div style="height: 180px;"></div>
													        </div>
														</div>
												</div>
												<div class="col-xs-1" style="position: relative">
													<button type="button" class="btn btn-default btn-xs"style="position:absolute;top:180px">More&rsaquo;&rsaquo;</button>
												</div>
											</div>
										</div>
									</div>
									<!--下-->
									<hr>
									<div class="box-body" style="background-color: #f7f7f8;">
										<h5><b>规划评价</b></h5>
										<span style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 100px;">
									       Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
											    Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
												Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
       											Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
											    Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
												Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
       											cred
							            </span>
									</div>
									<hr>
									<div class="box-footer" style="text-align: right;background-color: #f7f7f8;">
									<c:forEach items="${item1}" var="item_button" begin="0" end="0">
										<shiro:hasPermission name="plan:edit">
											<c:if test="${!item_button.key.released}">
												<button type="button" class="btn btn-default btn-xs">编辑</button>
												<button type="button" class="btn btn-default btn-xs">发布</button>
												<button type="button" class="btn btn-default btn-xs">删除</button>
											</c:if>
											<c:if test="${item_button.key.released}">
												<button type="button" class="btn btn-default btn-xs">取消发布</button>
											</c:if>
										</shiro:hasPermission>
										
										<c:if test="${item_button.value}">	
												<button type="button" class="btn btn-default btn-xs">取消关注</button>
												</c:if>
												<c:if test="${!item_button.value}">
													<button type="button" class="btn btn-default btn-xs">关注</button>
												</c:if>
										
									</c:forEach>
									
									
									</div>
								</div>														            
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:if>
		</div>
		</div>
		<script>
			$(".carousel").carousel({
				interval: 2500
			});
			
			$("#collapseOne0").addClass("in");
			
			$("div.activePicture :first-child").addClass("active");
		</script>
	</body>

</html>