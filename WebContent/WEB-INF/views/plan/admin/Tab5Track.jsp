<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  tab页第5项 -->
 <script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/echarts.js"></script>
 <div class="tab-pane fade" id="track">
    <div id="main" style="width: 700;height:400px" align="center"></div>
    <div id="main1" style="width: 700;height:400px" align="center"></div>
    	<script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
		var myChart1 =echarts.init(document.getElementById('main1'));
        // 指定图表的配置项和数据
      option = {
    title: {
        text: '十二五油气勘探开发规划完成情况\n',
        left:'center'
    },
    tooltip : {
        trigger: 'axis'
       
    },
    legend: {
        data:['新增石油探明地质储量','新增天然气探明地质储量','新增页岩气探明地质储量','新增煤层气探明地质储量','石油产量','天然气产量','页岩气产量','煤层气产量'],
        left:'left',
        orient: 'vertical'
    },
    toolbox: {
        feature: {
            saveAsImage: {}
        }
    },
    grid: {
        left: '30%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            data : ['2011','2012','2013','2014','2015']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'新增石油探明地质储量',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[120, 132, 101, 134, 90]
        },
        {
            name:'新增天然气探明地质储量',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[220, 182, 191, 234, 290]
        },
        {
            name:'新增页岩气探明地质储量',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[150, 232, 201, 154, 190]
        },
        {
            name:'新增煤层气探明地质储量',
            type:'line',
            stack: '总量',
            areaStyle: {normal: {}},
            data:[320, 332, 301, 334, 390]
        },
        {
            name:'石油产量',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[820, 932, 901, 934, 1290]
        },
        {
            name:'天然气产量',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[98, 93, 90, 94, 90]
        },
        {
            name:'页岩气产量',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[8, 9, 9, 9, 12]
        },
        {
            name:'煤层气产量',
            type:'line',
            stack: '总量',
            label: {
                normal: {
                    show: true,
                    position: 'top'
                }
            },
            areaStyle: {normal: {}},
            data:[2, 3, 1, 3.4, 1.2]
        }
    ]
};
        
      option1 = {
    		    title: {
    		        text: '完成情况最好和最差的指标',
    		    },
    		    tooltip: {
    		        trigger: 'axis'
    		    },
    		    legend: {
    		        data:['完成最好指标','完成最差指标']
    		    },
    		    toolbox: {
    		        show: true,
    		        feature: {
    		            dataZoom: {
    		                yAxisIndex: 'none'
    		            },
    		            dataView: {readOnly: false},
    		            magicType: {type: ['line', 'bar']},
    		            restore: {},
    		            saveAsImage: {}
    		        }
    		    },
    		    xAxis:  {
    		        type: 'category',
    		        boundaryGap: false,
    		        data: ['2011','2012','2013','2014','2015']
    		    },
    		    yAxis: {
    		        type: 'value',
    		        axisLabel: {
    		            formatter: '{value} %'
    		        }
    		    },
    		    series: [
    		        {
    		            name:'完成最好指标',
    		            type:'line',
    		            data:[11, 11, 15, 13, 12],
    		            markPoint: {
    		                data: [
    		                    {type: 'max', name: '最大值'},
    		                    {type: 'min', name: '最小值'}
    		                ]
    		            },
    		            markLine: {
    		                data: [
    		                    {type: 'average', name: '平均值'}
    		                ]
    		            }
    		        },
    		        {
    		            name:'完成最差指标',
    		            type:'line',
    		            data:[1, 2, 2, 5, 3],
    		            markPoint: {
    		                data: [
    		                    {name: '周最低', value: 2, xAxis: 1, yAxis: 1.5}
    		                ]
    		            },
    		            markLine: {
    		                data: [
    		                    {type: 'average', name: '平均值'},
    		                    [{
    		                        symbol: 'none',
    		                        x: '90%',
    		                        yAxis: 'max'
    		                    }, {
    		                        symbol: 'circle',
    		                        label: {
    		                            normal: {
    		                                position: 'start',
    		                                formatter: '最大值'
    		                            }
    		                        },
    		                        type: 'max',
    		                        name: '最高点'
    		                    }]
    		                ]
    		            }
    		        }
    		    ]
    		};


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
        myChart1.setOption(option1);
    </script>	     
</div>