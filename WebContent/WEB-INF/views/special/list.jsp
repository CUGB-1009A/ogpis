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
       
    %>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assets/dist/echarts.js"></script>
    	<script type="text/javascript" src="<%=path%>/assets/js/webuploader.js"></script>
    	<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/AdminLTE.css">
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/_all-skins.min.css">	
		<link type="text/css" rel="stylesheet" href="<%=path%>/assets/bootstrap/css/blue.css">
		<link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
		<style type="text/css">
		td{border:solid 3px #add9c0;}
		</style>
</head>
<html>
<body>
	<div id="wrapper" style="height:100%">
		<!-- 网站头及导航栏 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
			<%@ include file="../main/main_header.jsp"%>
			<%@ include file="../main/main_nav.jsp"%>
		</nav>
		
			<!--网页主体 -->	
		<div id="page-wrapper" style="height:98%;width:100%">		
			<div class="row">
	            <div class="col-md-12">
						<div class="portlet-title">
							<h1>
								<c:if test="${mineType.equals('1')}">石油专题</c:if>
								<c:if test="${mineType.equals('2')}">天然气专题</c:if>
								<c:if test="${mineType.equals('3')}">煤层气专题</c:if>
								<c:if test="${mineType.equals('4')}">页岩气专题</c:if>
							</h1>
						</div>
							<div class="portlet-body">
								<div class="table-toolbar" style="text-align: right;">
									<div class="btn-group">
									</div>
								</div>
							</div>
	            </div>
			</div>
			
			<div class="col-xs-12">  
	    		<!-- 主图 -->	
	    		<div class="col-xs-6"> 
	    			<textarea class="inputs" style="display:none">${result}</textarea>
	    			
					<div class="charts1" style="height:350px;width:100%;" align="center">	
	
					</div>
				</div>
				<!-- two tables -->
				<div class="col-xs-6">
				  		<c:forEach items="${indexList}" var="item"  varStatus="status">
				  			<div id="tableDiv_${status.index}">
				  				<table class="col-xs-12">
									<caption align="top" id="caption_${status.index}"></caption>
									<thead id="thead_${status.index}">
										<tr id="tr_${status.index}">
											
										</tr>
									
									</thead>
									<tbody id="tbody_${status.index}">
									
									</tbody>
								
								</table>
				  			</div>
				  		</c:forEach>
			
				</div>				 
		  </div>
			
			<c:forEach items="${indexList}" var="item"  varStatus="status"><!--  每个专题里又分储、产量等 -->
				<%@ include file="special.jsp"%>
			</c:forEach>
		</div>	
	</div>
	<script type="text/javascript">
	var data = $('.inputs')[0].value; 
	var obj = eval("(" + data+ ")");
	
	for(var t=0;t<obj.length;t++)//几个table
		{
		$("#caption_"+t)[0].innerHTML = obj[t].indexName+'各规划历年完成百分比';
		for(var n=-1;n<obj[0].plans.length;n++)//table的行数
			{
			if(n==-1)//table的第一行
				{
				$("#tr_"+t).append("<td></td>");
				for(m=1;m<obj[0].plans[0].year.length+1;m++)
					$("#tr_"+t).append("<td>第"+m+"年</td>");
				$("#tr_"+t).append("<td>总体完成比例</td>");
				
				}
			else
				{
				$("#tbody_"+t).append("<tr>")
				$("#tbody_"+t).append("<td>"+obj[t].plans[n].planName+"</td>");
				for(y=0;y<obj[0].plans[0].year.length;y++)
					{
					$("#tbody_"+t).append("<td>"+(obj[t].plans[n].value[y]/obj[t].plans[n].indexValue*100).toFixed(1)+"%</td>")
					}
				$("#tbody_"+t).append("<td>"+(obj[t].plans[n].hasFinished/obj[t].plans[n].indexValue*100).toFixed(1)+"%</td>")
				$("#tbody_"+t).append("</tr>")
				}
				
			}
		}
	
	var mineType = 	'${mineType}'
	if(mineType=='1')
		mineName = '石油'
	if(mineType=='2')
		mineName = '天然气'
	if(mineType=='3')
		mineName = '煤层气'
	if(mineType=='4')
		mineName = '页岩气'
		var option1 = {
			    title : {
			         text:'全国规划'+mineName+'专题情况',
			         x: 'center',            
			         y: 'top'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        orient:'vertical',
			        x:'left',
			        y:'top'
			        
			    },
			    grid: {
			        x: '150px',
			        x2:'40px'
			    }, 
			    xAxis : [
			        {
			            type : 'value',
			            axisLabel: {
			              	 show: true,
			              	 interval: 'auto',
			              	 formatter: '{value} %'
			              	 },
			            boundaryGap : [0, 0.01]
			        }
			    ],
			    yAxis : [
			        {
			            type : 'category',
			            data:[]
			        }
			    ],
			    series : [
			    ]
			};
	
	var option2 = {
		    title: {
		        text: '',
		        x: 'right',            
		        y: 'top'
		    },
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        data:[],
		        orient:'vertical',
		        x:'left',
		        y:'top'
		    },
		    grid: {
		        x: '150px',
		        x2:'40px'
		    }, 
		    xAxis:  {
		        type: 'category',
		        boundaryGap: false,
		         data : []
		    },
		    yAxis: {
		        type: 'value',
		        name:''
		    },
		    series: [
		    ]
		};
	
		require.config({
		    paths: {
		        echarts: '<%=request.getContextPath()%>/assets/dist'
		    }
		});
		
		option3 = {
			    title : {
			        text: '',
			        x: 'right',            
			        y: 'top'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['规划完成情况'],
			        x: 'left',            
			        y: 'top'
			    },
			    xAxis : [
			        {
			            type : 'category',
			           data:[]
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            name:''
			        }
			    ],
			    series : [
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
			            name:'规划完成情况',
			            type:'bar',
			           data:[]
			        }
			    ]
			};                       
		// 使用
		require(
		    [
		        'echarts',
		        'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
		        'echarts/chart/line'
		    ],
		    function (ec) {
				var legendData = "{\"legend\":[";
				var yAxisData = "{\"yAxis\":[";
				var tempSeries = "{\"series\":[";
				for(var i=0;i<obj[0].plans.length;i++)
					{
					legendData = legendData + "'"+obj[0].plans[i].planName+"',"
					}
				for(var j=0;j<obj.length;j++)
					{
					yAxisData = yAxisData +"'"+obj[j].indexName+"',";
					}
				legendData = legendData.substring(0,legendData.length-1)+"]}";
				yAxisData = yAxisData.substring(0,yAxisData.length-1)+"]}";
				
				for(k=0;k<obj[0].plans.length;k++)
					{
						tempSeries = tempSeries + "{itemStyle:{normal:{label : {show:true,formatter:'{c} %'}} },name:'"+obj[0].plans[k].planName+"',type:'bar',data:[";
						for(l=0;l<obj.length;l++)
							{
							tempSeries = tempSeries + (obj[l].plans[k].hasFinished/obj[l].plans[k].indexValue*100).toFixed(1)+",";
							}
						tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]},"		
					}
				tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
				var legend = eval("(" + legendData + ")");
				var yAxis = eval("(" + yAxisData + ")");
				var series = eval("(" + tempSeries + ")");					
				option1.legend.data = legend.legend;
				option1.yAxis[0].data = yAxis.yAxis;
				option1.series = series.series;
		    	var myCharts = ec.init($(".charts1")[0]);
		    	myCharts.setOption(option1);
		    	
		    	/* 专题下有几行，一个类别（index） 一行 */
		    	
		    	var chart1_X = "{\"xAxis\":["
    			for(mm=1;mm<obj[0].plans[0].year.length+1;mm++)
					{
    				chart1_X = chart1_X + "'第" + mm + "年',";
					}
		    	chart1_X = chart1_X.substring(0,chart1_X.length-1)+"]}";
		    	var xAxis = eval("(" + chart1_X + ")");
		    	var $charts2 = $(".charts2")
		    	for(var ii=0;ii<$charts2.length;ii++)
			    	{
		    		/* 显示右图 */
			    		var tempSeriesChart1 = "{\"series\":[";
			    		for(k=0;k<obj[0].plans.length;k++)
						{
			    			tempSeriesChart1 = tempSeriesChart1 + "{itemStyle:{normal:{label : {show:true}} },name:'"+obj[0].plans[k].planName+"',type:'line',data:["+obj[ii].plans[k].value+"]},";
			    		}
			    		tempSeriesChart1 = tempSeriesChart1.substring(0,tempSeriesChart1.length-1)+"]}"	
			    		var seriesChart1 = eval("(" + tempSeriesChart1 + ")");
			    		var charts2 = ec.init($charts2[ii]);
			    		option2.title.text = obj[ii].indexName+"规划年间各年情况";
			    		option2.legend.data = legend.legend;
			    		option2.yAxis.name = obj[ii].indexUnit;
			    		option2.xAxis.data = xAxis.xAxis;
			    		option2.series = seriesChart1.series;
			    		charts2.setOption(option2);
		    		}
		    	var $charts3 = $(".charts3")
		    	for(var jj=0;jj<$charts3.length;jj++)
		    	{
		    	/* 显示左图 */
		    		var tempSeriesChart2 = "{\"series\":[";
		    		for(k=0;k<obj[0].plans.length;k++)
					{
		    			tempSeriesChart2 = tempSeriesChart2 +obj[jj].plans[k].hasFinished+",";
		    		}
		    		tempSeriesChart2= tempSeriesChart2.substring(0,tempSeriesChart2.length-1)+"]}"
		    		var seriesChart2 = eval("(" + tempSeriesChart2 + ")");
		    		var charts3 = ec.init($charts3[jj]);
		    		option3.series[0].data = seriesChart2.series;
		    		option3.xAxis[0].data = legend.legend;
		    		option3.title.text = obj[jj].indexName+"规划年间完成情况";
		    		option3.yAxis[0].name = obj[jj].indexUnit;	
		    		charts3.setOption(option3);
		    	}
		    });
			                    
	</script>
</body>

</html>