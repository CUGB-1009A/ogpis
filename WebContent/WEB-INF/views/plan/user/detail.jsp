<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="<%=path%>/assets/bootstrapTable/css/bootstrap-table.min.css">
    <title>${plan.planName}详情</title>
    <%
   		 String type = request.getAttribute("type").toString();
    %>
</head>
<html>
<body>

<script src="<%=path%>/assets/bootstrapTable/js/jquery.min.js"></script>
<script src="<%=path%>/assets/bootstrapTable/js/bootstrap.min.js"></script>
<script src="<%=path%>/assets/bootstrapTable/js/tableExport.js"></script>
<script src="<%=path%>/assets/bootstrapTable/js/jquery.base64.js"></script>
<script src="<%=path%>/assets/bootstrapTable/js/bootstrap-table.js"></script>
<script src="<%=path%>/assets/bootstrapTable/js/bootstrap-table-export.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="<%=path%>/assets/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/assets/dist/echarts.js"></script>
    	
<div id="wrapper" style="height:100%">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
<div id="page-wrapper" style="height:100%">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="<c:url value='/main'/>">首页</a>
				</li>
				<li>
					<a href="<%=path%>/plan/list?type=${type}&&condition=">
					<c:if test='<%=type.equals("QG")%>'>
							全国规划
						</c:if>
						
						<c:if test='<%=type.equals("ZSY")%>'>
							中石油规划
						</c:if>
						
						<c:if test='<%=type.equals("ZSH")%>'>
							中石化规划
						</c:if>
						
						<c:if test='<%=type.equals("ZHY")%>'>
							中海油规划
						</c:if>
						
						<c:if test='<%=type.equals("YC")%>'>
							延长石油规划
						</c:if>
						
						<c:if test='<%=type.equals("ZLM")%>'>
							中联煤规划
						</c:if>
						
						<c:if test='<%=type.equals("QT")%>'>
							其它公司规划
						</c:if></a>
				</li>
				<li class="active">${plan.planName}</li>

			</ul>
		</div>
		
						<div class="col-xs-12">  
					    		<!-- 主图 -->	
					    		<div class="col-xs-9"> 
					    			<textarea class="inputs1" style="display:none">${plan.indexDataInPlanYear}</textarea>
					    			
									<div class="charts1" style="height:300px;width:100%;" align="center">	

									</div>
								</div>
								<div class="col-xs-3">  			
								<!--规划概述-->							
									<h5><b>概述</b></h5>
										<p style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 275px;overflow:auto; width:100%">
											<b>${plan.planName}</b>是<b>${plan.releaseUnit}</b>于<b><fmt:formatDate value="${plan.releaseDate}" pattern="YYYY-MM-dd"/></b>
											发布的规划，规划代号为<b>${plan.planCode}</b>，规划时间段是从<b><fmt:formatDate value="${plan.startTime}" pattern="YYYY-MM-dd"/></b>到<b><fmt:formatDate value="${plan.endTime}" pattern="YYYY-MM-dd"/></b>。
										</p>						
								</div>
						 </div>
						 
		<div class="row">
			<div class="col-xs-12" style="margin:0;padding:0">
				<ul id="myTab" class="nav nav-tabs">		
					   <li class="active"><a href="#overview" data-toggle="tab">规划背景和依据</a></li> 
					   <li><a href="#planDistination" data-toggle="tab">规划目标</a></li>
					   <li><a href="#planComplete" data-toggle="tab">规划跟踪与评价</a></li>
					   <li><a href="#planDocument" data-toggle="tab">相关文档</a></li>	  
				</ul>				
				<div id="myTabContent" class="tab-content">
					<%@ include file="tab1_user.jsp"%>
					<%@ include file="tab2_user.jsp"%>
					<%@ include file="tab3_user.jsp"%>
					<%@ include file="tab4_user.jsp"%>	
				</div>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
var option = {
		 title: {
           text: '规划每年完成情况',
           x: 'center',            
           y: 'top'
       },
   tooltip : {
       trigger: 'axis',
       axisPointer : {            // 坐标轴指示器，坐标轴触发有效
           type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
       }
   },
   legend: {
	 data:[],
	 x:'left',
     y:'top'
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
       x2:'50px'
    
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
		        				color:function(params){
		        					if(params.dataIndex==option1.xAxis.data.length-1)
		        						return '#FF0000';
		        					else
		        						return '#00FF00';
		        				},
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
    
var option2 = {
		title:{
			text: '',
            x: 'center',            
            y: 'top'
		},
	    tooltip : {
	        trigger: 'axis'
	    },
	    dataZoom : {
	        show : true,
	        realtime : true,
	     /*   动态配置能看的起始位置 start */
	        end : 100
	    },
	    xAxis : [
	        {
	            type : 'category',
	            name:'年份',
	            data : []
	        }
	    ],
	    yAxis : [
	        {
	        	name:'',
	            type : 'value'
	        }
	    		],
	    series : [
	        {
	            type:'bar',
	            data:[]
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
        'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
        'echarts/chart/line'
    ],
    function (ec) {

			var myCharts = ec.init($(".charts1")[0]);		
			var data = $(".inputs1")[0].value; 
			var obj = eval("(" + data + ")");
			
			var $myCharts1 = $(".charts2");		
			var data1 = $(".inputs2")[0].value; 
			var obj_1 = eval("(" + data1 + ")");
			
			//按指标的类型分 indexType
			var $myCharts2 = $(".charts3");
			var $myCharts3 = $(".charts4");
			var data2 = $(".inputs3")[0].value;
			var obj_2 = eval("(" + data2 + ")");
			
		 	var tempLegend = "{\"legend\":[";
		 	var tempYdata = "{\"yData\":[";
        	var tempSeries = "{\"series\":["
				for(var j=0;j<obj.length;j++)
						{
							tempYdata = tempYdata + "'"+obj[j].indexName+"',";
						}
	        		tempYdata = tempYdata.substring(0,tempYdata.length-1)+"]}";	
	        		tempLegend = tempLegend +obj[0].year + "]}";
	        	for(var ii=0;ii<obj[0].year.length;ii++)
	        		{
						tempSeries = tempSeries + "{ itemStyle: {normal: {label : {show:true, position: 'insideRight',textStyle: {color: '#800080'},formatter:'{c} %'}}},type:'bar',stack:'总量',name:"+ obj[0].year[ii]+",data:[";
						for(var l=0;l<obj.length;l++)
							{
							tempSeries = tempSeries + (obj[l].value[ii]/obj[l].indexValue*100).toFixed(1)+","
							}
						tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]},"
					}
				tempSeries = tempSeries.substring(0,tempSeries.length-1)+"]}";
			
			var obj1 = eval("(" + tempLegend + ")");
			var obj2 = eval("(" + tempYdata + ")");
			var obj3 = eval("(" + tempSeries + ")");
			option.legend.data = obj1.legend;
			option.yAxis.data = obj2.yData;
			option.series = obj3.series;
		 	myCharts.setOption(option);

		 	//第二个tab页显示
		 	var myCharts2;
		 	for(var jj=0;jj<obj_1.length;jj++)
		 		{
		 		   myCharts2 = ec.init($myCharts1[jj]);
				   option1.yAxis.name = obj_1[jj].indexUnit;
				   option1.title.text = '历史'+obj_1[jj].indexName+'及规划目标';
				   option1.xAxis.data = obj_1[jj].year;
				   option1.series[0].data = obj_1[jj].value;
				   myCharts2.setOption(option1);
		 		}
		 	
		 	var myCharts3;
		 	var m=0,n=0;
		 	var rows;
		 	var $table1 = $(".table_1");
		 	var $table2 = $(".table_2");
		 	var tableshow;
		 	var tableId;
		 	for(var kk=0;kk<obj_2.length;kk++)
		 		{
		 		 columns = [], data = [];
		 		 option2.title.text = obj_2[kk].indexName+'历史数据';
		 		 option2.yAxis[0].name = obj_2[kk].indexUnit;
		 		 option2.xAxis[0].data = obj_2[kk].year;
		 		 option2.series[0].data = obj_2[kk].value;
		 		 columns.push({
		 			field:'field0',
		 			title:'年份'
		 		 });
		 		columns.push({
		 			field:'field1',
		 			title:'完成量（'+ obj_2[kk].indexUnit+'）'
		 		 });
		 		    if(obj_2[kk].year.length>10)
		 		    	 option2.dataZoom.start = 0;
		 		    else
		 		    	 option2.dataZoom.start = 100-1000/obj_2[kk].year.length;
					if(obj_2[kk].indexType=='1')
						{
							myCharts3 = ec.init($myCharts2[m]);
	
							//填充表格中数据
							for(var ll = 0; ll<obj_2[kk].year.length; ll++)
								{
									row={};
									row['field0']=obj_2[kk].year[ll];
									row['field1']=obj_2[kk].value[ll];
									data.push(row);
								}
							var id = $('.table_1')[m].id;
							$('#'+id).bootstrapTable('destroy').bootstrapTable({
					            columns: columns,
					            data: data
					        }); 
							m = m + 1 ;
						}
					if(obj_2[kk].indexType=='2')
						{
							myCharts3 = ec.init($myCharts3[n]);
	
							//填充表格中数据
							for(var ll = 0; ll<obj_2[kk].year.length; ll++)
								{
									row={};
									row['field0']=obj_2[kk].year[ll];
									row['field1']=obj_2[kk].value[ll];
									data.push(row);
								}
							var id = $('.table_2')[n].id;
							$('#'+id).bootstrapTable('destroy').bootstrapTable({
					            columns: columns,
					            data: data
					        }); 
							n = n + 1 ;
						}
					myCharts3.setOption(option2);
					
					
		 		}
		 	
});
$("#overview").toggleClass("in active"); 
function build() {
    var cells = $('#cells').val(),
        rows = $('#rows').val(),
        i, j, row,
        columns = [],
        data = [];

    for (i = 0; i < cells; i++) {
        columns.push({
            field: 'field' + i,
            title: 'Cell' + i
        });
    }
    for (i = 0; i < rows; i++) {
        row = {};
        for (j = 0; j < cells; j++) {
            row['field' + j] = 'Row-' + i + '-' + j;
        }
        data.push(row);
    }
    $('#table').bootstrapTable('destroy').bootstrapTable({
        columns: columns,
        data: data
    });
}
</script>
</html>
	