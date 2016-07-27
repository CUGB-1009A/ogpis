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
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/echarts.js"></script>
    	<script type="text/javascript" src="<%=path%>/assets/js/webuploader.js"></script>
    	<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/AdminLTE.css">
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/_all-skins.min.css">	
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/blue.css">
		<link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
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
       <div class="col-lg-12">
				<div class="col-lg-2" style="float:left">				
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
				<div class="col-lg-10" style="float:left">			
					<form action="<%=path%>/plan/list" method="post">
					     <div class="input-group" style="margin:5px">						
							 <input type="hidden" name="type" value="${type}">
							 <input class="form-control" type="text" value="${condition}" name="condition">
							 <span class="input-group-btn">
						        <button class="btn btn-default" type="submit"><i class="icon-search "></i>搜索</button>
						     </span>
						</div>
					</form>	
			   </div>
		</div>
		
		<!-- 规划内容开始容器div -->
		<div class="panel-group" id="accordion" style="width:100%;height:100%;background:white">
		    <c:forEach items="${mapList}" var="item1" varStatus="status">
			    	<c:forEach items="${item1}" var="item_plan" begin="0" end="0">	
				    	<div style="width:100%;height:400px;float:left;">
				    		<h3>${item_plan.key.planName}</h3>	  
					    	<!-- 主图 -->
					    	<div style="width:50%;height:100%;float:left;">  	
									<div class="charts charts_${status.index}" style="width:100%;height:100%" align="center">	
										<c:forEach items="${item1}" var="item_charts" begin="2" end="2">		    	
											<textArea class="inputs"  name="charts" style="display:none">${item_charts.value}</textArea>
										</c:forEach>
									</div>			
							</div>
							<!-- 几个指标几个图 -->								
								<div id="lunbo${status.index}"  class="carousel slide" style="width:50%;height:100%;float:left;">
									<div class="carousel-inner activeCharts" style="width:100%;height:100%">
										<c:forEach items="${item_plan.key.index}" var="index" varStatus = "indexstatus">
											<div class="maincharts_${status.index} item" style="width:400px;height:400px" align="center">	
												
											</div>
										</c:forEach>
									</div>
									<a class="carousel-control left" href="#lunbo${status.index}" data-slide="prev" style="padding-top:15%;">&lsaquo;</a>
									<a class="carousel-control right" href="#lunbo${status.index}" data-slide="next" style="padding-top:15%;">&rsaquo;</a>					
								</div>	
						</div>
						<hr>			
						</c:forEach>	
				 </c:forEach>
		</div>
</div>

<script type="text/javascript">


/* 完成总图 */
 option = {
		 title: {
             text: '规划完成情况'
         },
     tooltip : {
         trigger: 'axis',
         axisPointer : {            // 坐标轴指示器，坐标轴触发有效
             type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
         }
     },
     legend: {
         data: [ ]
     },
     grid: {
         left: '3%',
         right: '4%',
         bottom: '3%',
         containLabel: true
     },
     xAxis:  {
         type: 'value',
         axisLabel: {
        	 show: true,
        	 interval: 'auto',
        	 formatter: '{value} %'
        	 }
     },
     yAxis: {
         type: 'category',
         data: [ ]
     },
     series: [ ]
 };
 
 option1 = {
         title: {
             text: ''
         },
         tooltip: {},
         legend: {
             data:['已经完成']
         },
         xAxis: {
             data: []
         },
         yAxis: {},
         series: [{
             name: '已经完成',
             type: 'bar',
             data: []
         }]
     };

 	var $chartsDiv = $(".charts");
 	var $inputs = $(".inputs");
	for (var i=0;i<$chartsDiv.length;i++)
		{
	 		var $mainCharts = $(".maincharts_"+i);
			var myChart = echarts.init($chartsDiv[i]);	

			var data = $inputs[i].value;
			var obj = eval("(" + data + ")");
			var tempLegend = "{\"legend\":["
        	var tempYdata = "{\"yData\":[";
        	var tempSeries = "{\"series\":["
				for(var j=0;j<obj.length;j++)
					{
						tempYdata = tempYdata + "'"+obj[j].indexName+"',";
					}
	        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";
				for(var k=0;k<obj[0].year.length;k++)
				{
					tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:true,position:'top',formatter:'{c} %'}}},type:'bar',stack:'总量',label: {normal: {show: true,position: 'insideRight'}},name:'"+obj[0].year[k]+"',data:[";
					tempLegend = tempLegend + "'"+ obj[0].year[k]+"',"
					for(var l=0;l<obj.length;l++)
						{
						tempSeries = tempSeries + (obj[l].value[k]/obj[l].indexValue*100).toFixed(1)+","
						}
					tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]},"
				}
				tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
				tempLegend = tempLegend.substring(0,tempLegend.length-1)+"]}";
			var obj1 = eval("(" + tempLegend + ")");
			var obj2 = eval("(" + tempYdata + ")");
			var obj3 = eval("(" + tempSeries + ")");
			myChart.setOption(option);
			   myChart.setOption({
				   legend: {
				         data: obj1.legend
				     },
			   yAxis : [
				          {
				              data : obj2.yData
				          }
				      ],
		      series : obj3.series
		                				
			});
			   for(var ii=0;ii<$mainCharts.length;ii++)
				   {
					var myChart1 = echarts.init($mainCharts[ii]);
					myChart1.setOption(option1);
					myChart1.setOption({
				        title: {
				            text:obj[ii].indexName
				        },
				        xAxis: {
				            data: obj[ii].year
				        },
				      
				        series: [{
				            data: obj[ii].value
				        }]
				});
				   } 			
			} 

	$(".carousel").carousel({
		interval: 2500
	});	
	$("div.activeCharts :first-child").addClass("active");

</script>
	</body>

</html>