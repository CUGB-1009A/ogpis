<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>油气资源规划管理系统</title>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<html>
<body>
	<!-- wrapper -->
	<div id="wrapper">
		<!-- 网站头及导航栏 -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<%@ include file="../main/main_header.jsp"%>
			<%@ include file="../main/main_nav.jsp"%>
		</nav>
		<!--网页主体 -->
	<div id="page-wrapper" style="height:100%;">
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb" id="ul">
				<li>
					<i class="icon-home home-icon"></i>
					<a href="<%=path%>/main">首页</a>
				</li>
				<li>
					<a href="<%=path%>/menu/list?id=&&currentPage=1">菜单管理</a>
				</li>
			</ul>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<form class="form-horizontal" role="form" id="formMenu" name="formMenu" action="<%=path%>/menu/save?pageId=${pageId}" onsubmit="return checkRight()">
					<input type="hidden" name="hidden_id" value="${menuItem.id}">
					<input type="hidden" name="pageId" value="${pageId}">
					<input type="hidden" name="currentPage" value="${currentPage}">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">菜单名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="菜单名称..." class="col-xs-10 col-sm-5" name="name" value="${menuItem.name}">
						    <span class="help-inline col-xs-4 col-sm-2">
								<span class="middle" style="color:red">*必填项</span>
							</span>
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">功能描述</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-2" placeholder="功能简单描述..." class="col-xs-10 col-sm-5" name="description" value="${menuItem.description}">
						</div>
					</div>
					
                   <div class="space-4"></div>
                   
                    <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">显示顺序</label>

						<div class="col-sm-9">
							<input type="text"  id="form-field-3" placeholder="菜单显示顺序..." class="col-xs-10 col-sm-5" name="priority" value="${menuItem.priority}">
						    <span class="help-inline col-xs-4 col-sm-2">
								<span class="middle" style="color:red">*必填项</span>
							</span>
						</div>
						
					</div>
					
					<div class="space-4"></div>
                   
                    <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">URL</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-4" placeholder="URL..." class="col-xs-10 col-sm-5" name="url" value="${menuItem.url}">
						</div>
					</div>

					<div class="clearfix form-actions">
						<div class="col-md-10">
							<button class="btn btn-info" type="submit" >
								<i class="icon-ok bigger-110"></i>
								保存
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn" type="reset">
								<i class="icon-undo bigger-110"></i>
								重置
							</button>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn" type="button" onclick="reback()">
								<i class="icon-undo bigger-110"></i>
								返回
							</button>
						</div>
					</div>
				</form>
			</div><!-- /span -->
		</div><!-- /row -->
	</div>	
	</div>
</body>
<script type="text/javascript">
function reback()
{
	window.location.href="<%=path%>/menu/editToList?pageId=${pageId}&&currentPage=${currentPage}";
};
$(function(){
	var param1 = "${pageId}";
	$("#form-field-3").keyup(function(ev){	
		    var oEvent = ev || event; 
		    /*
		    *判断第三个输入框中输入的是否为数字，不是数字的无效
		    */
		    if(!(String.fromCharCode(oEvent.keyCode)>='0'&&String.fromCharCode(oEvent.keyCode)<='9'))
               {
		    	alert("请输入数字");
		    	 var  temp= $("#form-field-3").val();
				 $("#form-field-3").val(temp);
               }		
	});	
});

$(function(){
	 var ul=document.getElementById("ul"); 
	 var obj=document.createElement("li"); 
	 var param = ${flag};
	 if(param =='1')
	    obj.innerHTML="添加菜单"; 
	 if(param =='2')
	    obj.innerHTML="修改菜单";  
	 ul.appendChild(obj); 

});
//检查提交表单的必要信息是否填写完整
function checkRight(){
	 var  temp1 = $("#form-field-1").val();
	 var  temp2 = $("#form-field-3").val();
	 alert(temp1);
	 alert(temp2);
	if(temp1==""||temp2=="")
		{
		alert("请将信息填写完整");
		return false;
		}  
} 

</script>
</html>