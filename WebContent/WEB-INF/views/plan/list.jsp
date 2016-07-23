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
       
      <!--  搜索div -->
       <div class="col-lg-12" style="height:60px">
				<div class="col-lg-2" style="float:left" style="height:100%">				
					<c:if test='<%=type.equals("QG")%>'>
						 <img src="<%=path%>/assets/companyPic/quanguo.jpg" alt="全国" style="border:solid 2px blue;max-height:60px">
					</c:if>
					
					<c:if test='<%=type.equals("ZSY")%>'>
						<a target="_blank"  href="<%=path%>/assets/companyIntro/zhongshiyou.html" title="中石油公司相关介绍">
						 	<img src="<%=path%>/assets/companyPic/zhongshiyou.jpg" alt="中石油"  style="border:solid 2px blue;max-height:60px">
						 </a>
					</c:if>
					
					<c:if test='<%=type.equals("ZSH")%>'>
						 <img src="<%=path%>/assets/companyPic/zhongshihua.jpg" alt="中石化"  style="border:solid 2px blue;max-height:60px">
					</c:if>
					
					<c:if test='<%=type.equals("ZHY")%>'>
						 <img src="<%=path%>/assets/companyPic/zhonghaiyou.jpg" alt="中海油"  style="border:solid 2px blue;max-height:60px">
					</c:if>
					
					<c:if test='<%=type.equals("YC")%>'>
						 <img src="<%=path%>/assets/companyPic/yanchangshiyou.jpg" alt="延长"  style="border:solid 2px blue;max-height:60px">
					</c:if>
					
					<c:if test='<%=type.equals("ZLM")%>'>
						 <img src="<%=path%>/assets/companyPic/zhonglianmei.jpg" alt="中联煤"  style="border:solid 2px blue;max-height:60px">
					</c:if>
					
					<c:if test='<%=type.equals("QT")%>'>
						<img src="<%=path%>/assets/companyPic/qita.jpg" alt="其他公司"  style="border:solid 2px blue;max-height:60px">				
					</c:if>	
				</div>
				<div class="col-lg-3" style="height:100%"></div>
				<div class="col-lg-7" style="height:100%">
				<form action="<%=path%>/plan/list" method="post">
					<div class="input-group" style="margin:5px">						
							 <input type="hidden" name="type" value="${type}">
					 <%-- <c:if test='<%=!plansNumber.equals("0")%>'> --%>
							 <input class="form-control" type="text" value="${condition}" name="condition">
						<%-- </c:if> --%>
							 <span class="input-group-btn">
						<%-- <c:if test='<%=!plansNumber.equals("0")%>'> --%>
						        <button class="btn btn-default" type="submit"><i class="icon-search "></i>搜索</button>
						 <%-- </c:if> --%>
						         <shiro:hasPermission name="plan:add">
						         <button class="btn btn-default" type="button" onclick="newPlan('${type}')"><i class="icon-plus"></i> 新建</button>
						         </shiro:hasPermission>
						         
						         <%-- <c:if test='<%=!plansNumber.equals("0")%>'> --%>
						       		 <button class="btn btn-default" type="button" onclick="deletePlans()"><i class="icon-plus"></i> 批量删除</button>
								<%--  </c:if> --%>
						     </span>
						</div>
					</form>	
			   </div>
		</div>
		
		<!-- 规划内容开始容器div -->
		<div class="panel-group" id="accordion">
		  <c:if test='<%=!plansNumber.equals("0")%>'> 
		    <c:forEach items="${mapList}" var="item1" varStatus="status">
			<div class="panel panel-default ">
			<c:forEach items="${item1}" var="item_plan"  begin="0" end="0">
				<div class="panel-heading plan${item_plan.key.id}">
					<h4 class="panel-title" align="left">
						<input type="checkbox" value="${item_plan.key.id }" class="checkboxs"/>
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
												<button class="editPlan" value="${item_button.key.id}">编辑</button>
												<button class="deletePlan" value="${item_button.key.id}">删除</button>
												<button class="release" value="${item_button.key.id}">发布</button>
												<button class="disrelease" value="${item_button.key.id}" style="display:none">取消发布</button>
											</c:if>
											<c:if test="${item_button.key.released}">
											    <button class="editPlan" value="${item_button.key.id}" style="display:none">编辑</button>
												<button class="deletePlan" value="${item_button.key.id}" style="display:none">删除</button>
												<button class="release" value="${item_button.key.id}" style="display:none">发布</button>
												<button class="disrelease" value="${item_button.key.id}">取消发布</button>
											</c:if>
										</shiro:hasPermission>
										
										<c:if test="${item_button.value}">	
												<button class="disconcern" value="${item_button.key.id}" >取消关注</button>
												<button class="concern" value="${item_button.key.id}" style="display:none">关注</button>
												</c:if>
												<c:if test="${!item_button.value}">
													<button class="disconcern" value="${item_button.key.id}" style="display:none">取消关注</button>
													<button class="concern" value="${item_button.key.id}">关注</button>
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
function newPlan(type)
{
	window.location.href = "<%=path%>/plan/toEditPage?type="+type
}
	$(".carousel").carousel({
		interval: 2500
	});	
	$("#collapseOne0").addClass("in");
	$("div.activePicture :first-child").addClass("active");
	
	$(".deletePlan").click(function(){
		var getTimestamp = new Date().getTime();
		var planId = $(this).attr("value");
		var isDel =  confirm('确定删除该规划吗？', '确认对话框');
		if(isDel)
		{
			$.ajax({
				url:"<%=request.getContextPath()%>/plan/deletePlan?time="+getTimestamp,
				dataType:"json",
				async:true,
				data:{"planId":planId},
				type:"GET",
				success:function(result){
					$(".plan"+planId).parent().remove();
					alert("删除规划成功");
				},
				error:function(){
					alert("出意外错误了");
				}
			});			
		}
	});

	$(".concern").click(function(){
		var planId = $(this).attr("value");
		var getTimestamp = new Date().getTime();
		//关注处理，处理成功后do
		$.ajax({
		url:"<%=request.getContextPath()%>/plan/concern?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":planId},
		type:"GET",
		success:function(result){
			$(".concern[value="+planId+"]").get(0).style.display="none";
			$(".disconcern[value="+planId+"]").get(0).style.display="";
			alert('关注成功');
		},
		error:function(){
			alert("出意外错误了");
		}
	});
	})
		
		$(".disconcern").click(function(){
			var planId = $(this).attr("value");
			var getTimestamp = new Date().getTime();
			//发布处理，处理成功后do
			$.ajax({
			url:"<%=request.getContextPath()%>/plan/disconcern?time="+getTimestamp,
			dataType:"json",
			async:true,
			data:{"planId":planId},
			type:"GET",
			success:function(result){
				$(".concern[value="+planId+"]").get(0).style.display="";
				$(".disconcern[value="+planId+"]").get(0).style.display="none";
				alert('取消关注成功');
			},
			error:function(){
				alert("出意外错误了");
			}
		});
		})
	
	$(".release").click(function(){
		var planId = $(this).attr("value");
		var getTimestamp = new Date().getTime();
		//发布处理，处理成功后do
		$.ajax({
		url:"<%=request.getContextPath()%>/plan/release?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":planId},
		type:"GET",
		success:function(result){
			$(".release[value="+planId+"]").get(0).style.display="none";
			$(".disrelease[value="+planId+"]").get(0).style.display="";
			$(".editPlan[value="+planId+"]").get(0).style.display="none";
			$(".deletePlan[value="+planId+"]").get(0).style.display="none";
			alert('发布成功');		
		},
		error:function(){
			alert("出意外错误了");
		}
	});				
	})
	
	$(".disrelease").click(function(){
	var planId = $(this).attr("value");
	var getTimestamp = new Date().getTime();
	//撤销发布处理，处理成功后do
	$.ajax({
		url:"<%=request.getContextPath()%>/plan/disrelease?time="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":planId},
		type:"GET",
		success:function(result){
			$(".disrelease[value="+planId+"]").get(0).style.display="none";
			$(".release[value="+planId+"]").get(0).style.display="";
			$(".editPlan[value="+planId+"]").get(0).style.display="";
			$(".deletePlan[value="+planId+"]").get(0).style.display="";
			alert('撤销发布成功');		
		},
		error:function(){
			alert("出意外错误了");
		}
	});	
})
	/* 编辑规划 */
	$(".editPlan").click(function(){
		var planId = $(this).attr("value");
		var type = '${type}';
		window.location.href = "<%=path%>/plan/show?flag=1&&type="+type+"&&id="+planId;
	});
	
	/* 批量删除规划 */
	function deletePlans()
	{
		var getTimestamp = new Date().getTime();
		var type = '${type}';
		var ids ='';
		var $chosedPlan = $('input:checked');
		if($chosedPlan.length==0)
		{
		alert("至少选择一个规划再删除！");
		return;
		}
		var isDelAll =  confirm('确定删除选定规划？', '确认对话框');
		if(isDelAll)
			{
			for(var i=0;i<$chosedPlan.length;i++)
			{
			ids = ids + $chosedPlan[i].value+","
			}
		$.ajax({
			url:"<%=path%>/plan/deleteBatch?time="+getTimestamp,
			dataType:"json",
			async:true,
			type:"POST",
			data:{"Ids":ids,"type":type},
			success:function(result){
				 for(var i=0;i<$chosedPlan.length;i++)
				{
					$(".plan"+$chosedPlan[i].value).parent().remove();
				} 			
				alert("批量删除规划成功");
			},
			error:function(){
				alert("出意外错误了");
			}
		});	
			}
		
		
	}
	

</script>
	</body>

</html>