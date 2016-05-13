<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="<%=path%>/assets/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <title>油气资源规划管理系统</title>
     <%
    	String flag = request.getAttribute("flag").toString();
     %> 

</head>
<html>
<body>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/assets/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
					<a href="<c:url value='/plan/national/list'/>">全国规划管理</a>
				</li>
				<li class="active">全国规划详情</li>

			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
		<ul id="myTab" class="nav nav-tabs">
			  
			  <c:if test='<%=flag.equals("1") %>'>
			   <li class="active"><a href="#overview" data-toggle="tab">规划概述</a></li>
			   </c:if>
			  <c:if test='<%=!flag.equals("1") %>'>
			       <li><a href="#overview" data-toggle="tab">规划概述</a></li>
			  </c:if>
			 	
			   <c:if test='<%=flag.equals("2") %>'>
			   <li class="active">
			   		<a href="#document" data-toggle="tab" >文档资料</a>
			   	</li>
			   	</c:if>			   	
			   	 <c:if test='<%=!flag.equals("2") %>'>
			   <li>
			   		<a href="#document" data-toggle="tab" >文档资料</a>
			   	</li>
			   	</c:if>
			   	
			    <c:if test='<%=flag.equals("3") %>'>
			   	<li class="active">
			   		<a href="#indexEntry" data-toggle="tab">规划指标录入</a>
			   	</li>
			   	</c:if>
			   		 <c:if test='<%=!flag.equals("3") %>'>
			   	<li>
			   		<a href="#indexEntry" data-toggle="tab">规划指标录入</a>
			   	</li>
			   	</c:if>
			   	
			    <c:if test='<%=flag.equals("4") %>'>
			   	<li class="active">
			   		<a href="#completeEntry" data-toggle="tab">完成情况录入</a>
			   	</li>
			   	</c:if>
			   		 <c:if test='<%=!flag.equals("4") %>'>
			   	<li>
			   		<a href="#completeEntry" data-toggle="tab">完成情况录入</a>
			   	</li>
			   	</c:if>
			   	 <c:if test='<%=flag.equals("5") %>'>
			   	<li class="active">
			   		<a href="#track" data-toggle="tab">规划跟踪</a>
			   	</li>
			   	</c:if>
			   		 <c:if test='<%=!flag.equals("5") %>'>
			   	<li>
			   		<a href="#track" data-toggle="tab">规划跟踪</a>
			   	</li>
			   	</c:if>
		</ul>
		
		<div id="myTabContent" class="tab-content">
		<%@ include file="Tab1Detail.jsp"%>
		<%@ include file="Tab2Doc.jsp"%>
		<%@ include file="Tab3Index.jsp"%>
		<%@ include file="Tab4Complete.jsp"%>
		<%@ include file="Tab5Track.jsp"%>


		  	
				
				</div>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>
</div>
</body>
<script type="text/javascript">
/* 回显时间和规划描述字段，去掉时分秒（虽然在库中没有，但获取的时候自动添0了) */
var description = '${nationalPlan.planDescription}';
var endtime = '${nationalPlan.endTime}';
var starttime = '${nationalPlan.startTime}';
var releasedate = '${nationalPlan.releaseDate}';
endtime = endtime.substring(0,endtime.indexOf(' '));
starttime = starttime.substring(0,starttime.indexOf(' '));
releasedate = releasedate.substring(0,releasedate.indexOf(' '));
$(function(){
	document.getElementById("form-field-4").value = releasedate ;
	document.getElementById("form-field-5").value = starttime ;
	document.getElementById("form-field-6").value = endtime ;	
	document.getElementById("form-field-7").value = description ;
});


/* 判断进入哪个TAB页 */
$(function(){
	var flag = ${flag};
	if(flag=='1')
		{
		$("#overview").toggleClass("in active");
		}
	if(flag=='2')
		{
		$("#document").toggleClass("in active");
		}
	if(flag=='3')
		{
		$("#excel").toggleClass("in active");
		}
	if(flag=='4')
		{
		$("#track").toggleClass ('in active');
		}
		 	
});

/* 初始化模态框，清空模态框一切信息，设置上传按钮可用，警示信息隐藏 */
function showModal()
{	
	$("#myModal").modal("show");
	document.getElementById("fileDescription").value = "" ;
	document.getElementById("fileList").value = "" ;
	var fileInput = $("#file");  
	fileInput.replaceWith(fileInput.clone());  
	document.getElementById("upload").disabled = false ;
	$("#sizeWarning").hide();
}

var nationalPlanId =  '${nationalPlan.id}';
$(function(){
	$("#cancel").click(function(){
		$("#myModal").modal("hide");
	});
	$("#upload").click(function(){
		
		var temp = document.getElementById("fileList").value;
		if(temp=="")
			{
			alert("请先选择文件再上传");
			return;
			}
		$("#docForm").submit();
		$('#myModalProgress').modal({backdrop: 'static', keyboard: false});
		var eventFun = function(){	
			$.ajax({
				type:'post',
				url:'<%=path%>/plan/national/process.json',
				dateType:'json',
				contentType:"application/json",
				success:function(data){
					$('#proBar').css('width',data.rate+''+'%');  
				    $('#showProgress')[0].innerHTML = data.rate+'%';  					
					if(data.rate==100) 
					{
						window.clearInterval(intId);
						$("#myModalProgress").modal("hide");
						$("#myModal").modal("hide");			
					}
				},
				error:function(){
					alert("上传文件错误");
				}
			});
		}
		var intId = window.setInterval(eventFun,1000);  
		var tempId =  document.getElementById("hiddenId").value;
		document.getElementById("fileDescription").value = "" ;
		document.getElementById("fileList").value = "" ;
		var fileInput = $("#file");  
		fileInput.replaceWith(fileInput.clone());  
	});
	
});

/* 文件选择完成后执行函数（判断是否有文件超过范围） */
function showFileList()
{
	var firstOver="";//记录哪些文件超过规定Size
	var fileMax = false ;//是否有文件超过规定Size
	var fileNames ="";//记录文件清单 内容
	var imageEle = document.getElementById("file");
	var fileList = imageEle.files;
	for(var i = 0 ; i < fileList.length ; i ++)
	{
		
		var file = fileList[i];
		fileNames += "第" + (i + 1) + "个：" + file.name+'\r\n';
		if(file.size>1000000000)
			{
			firstOver +=(i+1)+","
			fileMax = true ;		
			}
	}
	document.getElementById("fileList").value = fileNames;
	if(fileMax)
		{
		 firstOver = firstOver.substring(0,firstOver.length-1);
		 document.getElementById("sizeWarning").innerHTML = "第"+firstOver+"个文件超过500M,不允许上传！" ;		 
		 document.getElementById("upload").disabled = true ;
		 $("#sizeWarning").show();
		}
	else
		{
		document.getElementById("upload").disabled = false ;
		$("#sizeWarning").hide();
		}	
}


</script>
</html>
	