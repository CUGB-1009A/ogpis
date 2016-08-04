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
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/dist/echarts.js"></script>
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
						<img src="<%=path%>/assets/companyPic/zhongshiyou.jpg" alt="中石油"  style="border:solid 2px blue;max-height:60px">
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
		    	<div class="panel panel-default" style="width:100%;">
			    	<c:forEach items="${item1}" var="item_plan" begin="0" end="0">
			    		<div class="panel-heading plan${item_plan.key.id}">
			    		<input class="planId" type="hidden" value='${item_plan.key.id}'>
				    		<h4 class="panel-title" align="left">
						        <a data-toggle="collapse" data-parent="#accordion"  href="#collapseOne${status.index}">
						          <b>${item_plan.key.planName}</b>
						        </a>
						        <span>发布时间：</span><fmt:formatDate value="${item_plan.key.releaseDate}" pattern="YYYY-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;
								<span>发布单位：${item_plan.key.releaseUnit}</span>
		               		</h4>
		          		</div>
		               
			           <div id="collapseOne${status.index}" class="removeIn panel-collapse collapse in" style="width:100%;">
						 <div class="panel-body">
				    		<div class="col-xs-12">  
					    		<!-- 主图 -->	
					    		<div class="col-xs-6"> 
					    			<textarea id="inputs${status.index}" class="inputs" style="display:none"  >${item1.get('charts')}</textarea>
									<div class="charts charts_${status.index}" style="height:300px;width:100%" align="center" onclick="showDetail('${item_plan.key.id}')">	

									</div>
								</div>
								<div class="col-xs-6">  			
								<!-- 几个指标几个图 -->							
									<div id="lunbo${status.index}"  class="carousel slide" style="height:300px;width:100%">
										<div class="carousel-inner activeCharts">
											<c:forEach items="${item_plan.key.index}" varStatus = "indexstatus">
												<div class="item">	
													<div class="mainCharts maincharts_${status.index} first_${indexstatus.index}" style="height:300px;width:100%;" onclick="showDetail('${item_plan.key.id}')"></div>
												</div>
											</c:forEach>
										</div>
										 <a class="carousel-control left" href="#lunbo${status.index}" data-slide="prev" style="padding-top:15%;">&lsaquo;</a>
										<a class="carousel-control right" href="#lunbo${status.index}" data-slide="next" style="padding-top:15%;">&rsaquo;</a>					
									 </div>
								</div>
						 </div>
					 </div>
					 <div class="panel-footer" style="text-align:right">
						<c:if test="${item_plan.value}">	
							 <button class="disconcern" value="${item_plan.key.id}" >取消收藏</button>
							 <button class="concern" value="${item_plan.key.id}" style="display:none">收藏</button>
						</c:if>		
						<c:if test="${!item_plan.value}">
							<button class="disconcern" value="${item_plan.key.id}" style="display:none">取消收藏</button>
							<button class="concern" value="${item_plan.key.id}">收藏</button>
						</c:if>						
					 </div>
				 </div>	
			  </c:forEach>
			</div>
		</c:forEach>
	</div>
</div>

<script type="text/javascript">

/* 关注 和 取消关注  按钮的ajax提交 */
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
		alert('收藏成功');
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
			alert('取消收藏成功');
		},
		error:function(){
			alert("出意外错误了");
		}
	});
	})

/* 完成总图 */
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
    toolbox: {
        show : true,
        feature : {
            saveAsImage : {show: true},
            dataView : {show: true, readOnly: false}
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
        toolbox: {
            show : true,
            feature : {
                saveAsImage : {show: true},
                dataView : {show: true, readOnly: false}
            }
        },
        legend: {
        	show:false,
            data:['历史数据'],
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
		
		            name: '历史数据',
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
    	var $inputs = $(".inputs");
    	var myCharts;
    	var $planId = $(".planId");;
    	for (var i=0;i<$chartsDiv.length;i++)
		{	
    		var planId = $planId[i].value;
    		var $mainCharts = $(".maincharts_"+i);/* 一个规划的附图 */ 		
			myCharts = ec.init($chartsDiv[i]);		
			var data = $inputs[i].value; 
			var obj = eval("(" + data + ")");
        	var tempYdata = "{\"yData\":[";
        	var tempSeries = "{\"series\":["
				for(var j=0;j<obj.length;j++)
					{
						tempYdata = tempYdata + "'"+obj[j].indexName+"',";
					}
	        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	        		
					tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:true, textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:'规划完成情况',data:[";
					for(var l=0;l<obj.length;l++)
						{
						tempSeries = tempSeries + (obj[l].hasFinished/obj[l].indexValue*100).toFixed(1)+","
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
				   myCharts = ec.init($(".maincharts_"+i+".first_"+ii)[0]);
				   option1.yAxis.name = obj[ii].indexUnit;
				   option1.title.text = obj[ii].indexName;
				   option1.xAxis.data = obj[ii].year;
				   option1.series[0].data = obj[ii].value;
				   myCharts.setOption(option1);
				
			   } 			
			} 
    });

	$(".carousel").carousel({
		interval: 4000
	});

	$(".first_0").parent(".item").addClass("active");
	$(".mainCharts").css( 'width', $(".first_0").width() );
	$(".charts").css( 'width', $(".charts_0").width() );
}
$(".removeIn").removeClass("in");
$("#collapseOne0").addClass("in");

function showDetail(planId)
{
	window.location.href = "<%=path%>/plan/user_detail?id="+planId;
}


	
</script>
	</body>

</html>