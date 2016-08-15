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
    <title>油气资源规划信息系统</title>
     <%
        String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/dist/echarts.js"></script>
    	<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/AdminLTE.css">
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/_all-skins.min.css">	
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/blue.css">
		<link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
</head>
<html>
	<body>
	<div id="wrapper" style="height:100%">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav_admin.jsp"%>
	</nav>

		<!-- 规划内容开始容器div -->
		<div class="panel-group" id="accordion" style="width:100%;height:100%;background:white">
		    	<div class="panel panel-default" style="width:100%;">
			    		<div class="panel-heading plan${plan.id}">
			    		<input class="planId" type="hidden" value="${plan.id}">
				    		<h4 class="panel-title" align="left">
						        <a data-toggle="collapse" data-parent="#accordion"  href="#collapseOne">
						          <b>${plan.planName}</b>
						        </a>
						        <span>发布时间：</span><fmt:formatDate value="${plan.releaseDate}" pattern="YYYY-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>发布单位：${plan.releaseUnit}</span>
		               		</h4>
		          		</div>
		               
			           <div id="collapseOne" class="panel-collapse collapse in" style="width:100%;">
						 <div class="panel-body">
				    		<div class="col-xs-12">  
					    		<!-- 主图 -->	
					    		<div class="col-xs-6"> 
					    				<textarea class="inputsmain" style="display:none">${plan.indexDataInPlanYear}</textarea>				
									<div class="charts" style="height:300px;width:100%" align="center" onclick="showDetail('${plan.id}')">	

									</div>
								</div>
								
								<!-- 几个指标几个图 -->	
								<div class="col-xs-6"> 
								 <textarea class="inputsindex" style="display:none"> ${plan.indexDataInBoth}</textarea>
									<div id="lunbo"  class="carousel slide" style="height:300px;width:100%">
										<div class="carousel-inner">
											<c:forEach items="${plan.indexs}" varStatus = "status">
												<div class="item">	
													<div class="mainCharts  first_${status.index}" style="height:300px;width:100%;" onclick="showDetail('${plan.id}')"></div>
												</div>
											</c:forEach>
										</div>
										 <a class="carousel-control left" href="#lunbo" data-slide="prev" style="padding-top:15%;">&lsaquo;</a>
										<a class="carousel-control right" href="#lunbo" data-slide="next" style="padding-top:15%;">&rsaquo;</a>					
									 </div>
								</div>
						 </div>
						 <div>${plan.planShortDescription}</div>
					 </div>
				 </div>	
			</div>

	</div>
</div>

<script type="text/javascript">

/* 完成总图option */
 window.onload = function(){
var option = {
		 title: {
            text: '规划完成情况',
            x: 'center',            
            y: 'top'
        },
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
     grid: {
        x: '150px',
        x2:'40px'
     
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
        data: [],
        show:true
    },
    series: []
};

var option1 = {
        title: {
            text: '',
            x: 'center',            
            y: 'top'
        },
        legend: {
        	show:false,
            data:['已经完成的情况'],
            x:'right',
            y:'top'
        },
        xAxis: {
            data: [],
        	name:'年份'
        },
        yAxis: {
        	name:''     	
        },
        series: [
	                 {
		        		itemStyle: 
		        		{
		        			normal: 
		        			{
		        				label : 
		        				{
		        					show:true
		        				}
		        	        }
	                 },
		
		            name: '已经完成的情况',
		            type: 'bar',
		            data: []
        			  }
	           ]
    };
require.config({
    paths: {
        echarts: '<%=request.getContextPath()%>/assets/dist'
    }
});

// 使用
require(
    [
        'echarts',
        'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
    ],
    function (ec) {
    	var $chartsDiv = $(".charts"); /* 所有的主图 */
    	var $inputsmain = $(".inputsmain");
    	var $inputsindex = $(".inputsindex");
    	var myCharts;

    		var $mainCharts = $(".mainCharts");/* 一个规划的附图 */ 		
			myCharts = ec.init($chartsDiv[0]);		
			var datamain = $inputsmain[0].value; 
			var objmain = eval("(" + datamain + ")"); 
			var dataindex = $inputsindex[0].value; 
			var objindex = eval("(" + dataindex + ")"); 
            var tempYdata = "{\"yData\":[";
        	var tempSeries = "{\"series\":["
				for(var j=0;j<objmain.length;j++)
					{
						tempYdata = tempYdata + "'"+objmain[j].indexName+"',";
					}
	        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	        		
					tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:true, textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:'规划完成情况',data:[";
				for(var l=0;l<objmain.length;l++)
					{
					tempSeries = tempSeries + (objmain[l].hasFinished/objmain[l].indexValue*100).toFixed(1)+","
					}
			tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
			tempSeries = tempSeries +"]}";
			var obj2 = eval("(" + tempYdata + ")");
			var obj3 = eval("(" + tempSeries + ")");
			option.yAxis.data = obj2.yData;
			option.series = obj3.series;
		 	myCharts.setOption(option);
		 	
			for(var ii=0;ii<$mainCharts.length;ii++)
			   {	   
				   myCharts = ec.init($mainCharts[ii]);
				   option1.yAxis.name = objindex[ii].indexUnit;
				   option1.title.text = objindex[ii].indexName;
				   option1.xAxis.data = objindex[ii].year;
				   option1.series[0].data = objindex[ii].value;
				   myCharts.setOption(option1);
				
			   } 			
    });

	$(".carousel").carousel({
		interval: 4000
	});
	$(".first_0").parent(".item").addClass("active");
	$(".mainCharts").css( 'width', $(".first_0").width());
}

function showDetail(planId)
{
	window.location.href = "<%=path%>/plan/user_detail?id="+planId;
}


	
</script>
	</body>

</html>