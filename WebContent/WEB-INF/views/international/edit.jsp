<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <script type="text/javascript" src="<%=path%>/assets/js/webuploader.js"></script>
    <link href="<%=path%>/assets/css/webuploader.css" rel="stylesheet">
    <title>油气资源规划管理系统</title>
</head>
<html >
<body >
<div id="wrapper" style="height:100%">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav_admin.jsp"%>
	</nav>
	<!--网页主体 -->	
	<div id="page-wrapper" style="height:98%;width:100%">	
		<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
			<ul class="breadcrumb">	
				<li class="active">
				<c:if test="${international.companyName.equals('bp')}">英国石油</c:if>
				<c:if test="${international.companyName.equals('kp')}">壳牌</c:if>
				<c:if test="${international.companyName.equals('xfl')}">雪佛龙</c:if>
				<c:if test="${international.companyName.equals('dde')}">道达尔</c:if>
				<c:if test="${international.companyName.equals('amfks')}">埃克森美孚</c:if>
				</li>
			</ul>
		</div>	
		<div class="row" style="background:white">
		<div class="col-md-12">
				 <!-- 加载编辑器的容器 -->
				 <form action="<%=path%>/international/save" method="post" >
				 	<input type="hidden" name="companyName" value="${international.companyName}">
				    <script id="container" name="content" type="text/plain" style="height:400px">${international.content}</script>
					
					<c:if test="${international.fileName!=null}">
						附件:${international.fileName}
						<a  href="<c:url value='/international/download?companyName=${international.companyName}'/>" class="btn-sm btn-app btn-primary no-radius">
							<i class="icon-arrow-down bigger-200"></i>
							下载
						</a>&nbsp;&nbsp;&nbsp;&nbsp;
						
					</c:if>
					<button type="button" onclick="showModal('${international.companyName}')">选择附件...</button>&nbsp;&nbsp;&nbsp;
    				<button type="submit">保存</button>

		    	</form>
			    <!-- 配置文件 -->
			    <script type="text/javascript" src="<%=path%>/assets/UEditor/ueditor.config.js"></script>
			    <!-- 编辑器源码文件 -->
			    <script type="text/javascript" src="<%=path%>/assets/UEditor/ueditor.all.js"></script>
			    <!-- 实例化编辑器 -->
			    <script type="text/javascript">
			        var ue = UE.getEditor('container');
			    </script>
		    </div>
	    </div>	
	</div>	
</div>

			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="width: 1600px;margin-top:100px">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<button type="button"  id="closeFileUploadModel" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h3 class="modal-title">文件上传(只允许上传一个文件)</h3>
									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-md-12">
											<div id="uploader" class="wu-example">
    												<!--用来存放文件信息-->
											    <div id="thelist" class="uploader-list"></div>
												    <div class="btns">
												        <div id="picker">选择文件</div>
												        <button id="ctlBtn" class="btn btn-default">开始上传</button>
												    </div>
												</div>
											</div>
										</div>

									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						
</body>
<script type="text/javascript">

/* 初始化模态框，清空模态框一切信息，设置上传按钮可用，警示信息隐藏 */
function showModal()
{	
	$('#myModal').modal({backdrop: 'static', keyboard: false});
	$('#thelist').empty();
	uploader = WebUploader.create({
	    // swf文件路径
	    swf: '<%=path%>/assets/js/Uploader.swf',
	    // 文件接收服务端。
	    server: '<%=path%>/international/uploadFile?companyName=${international.companyName}',
	    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
	    pick: '#picker',
	    fileNumLimit: 1 //文件个数限制
	});
	var total = 0;
	var success = 0;
	var f = 1 ;//为了重新选择文件所用
	var hasFile = 0 ;
	var fileId = "";
    
         //webuploader注册监听事件 添加文件前先重置uploader
	uploader.on( 'beforeFileQueued', function( file ){
	     if(f==1)
	    	 {
	    	 total = 0;
	    	 uploader.reset();
	    	 $('#thelist').empty();
	    	 f=0;
	    	 }
		 
	}); 

	//文件加入队列之后触发
	uploader.on( 'fileQueued', function( file ) {
		fileId = fileId + file.id ;
		total = total +1 ;
	    $('#thelist').append( '<div class="item">' +
	        '<h4 class="info">' + file.name + '</h4><div class="progress" style="width: 100%"><div id="'+file.id+'1"class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" style="width: 0%">'+
				'<span id="'+file.id+'"></span></div></div></div>' );
	});

	//当一批文件添加进队列以后触发
	uploader.on( 'filesQueued', function( files ) {
	    hasFile = 1;
		f=1;
	});

	uploader.on( 'uploadSuccess', function( file ) {
		 success = success + 1 ;
		 
	}); 

	uploader.on( 'uploadComplete', function( file ) {

		if(total == success)
			{
			$("#myModal").modal("hide");
			window.location.href = "<%=path%>/international/edit?companyName=${international.companyName}";
			}
			
	});

	uploader.on( 'uploadProgress', function( file , percentage) {

		$('#'+file.id+'1').css('width',percentage*100+''+'%');  
	    $('#'+file.id)[0].innerHTML = percentage*100;  	

	});
	
	$('#ctlBtn').on("click",function(){
		if(hasFile == 0)
			alert("请选择文件再上传");
		else
			{
			uploader.upload();
			}		
	});	
}

$(function(){
	$("#closeFileUploadModel").click(function(){
		$("#ctlBtn").off("click");
		uploader.destroy();
	});
});
</script>
</html>
	