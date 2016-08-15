<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand"><span style="color:white">油气资源规划信息系统</span></a>
</div>
<!-- Top Menu Items -->
<ul class="nav navbar-right top-nav">
	<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user">
		</i> 欢迎 , <shiro:principal/></a>
		<%-- <ul class="dropdown-menu">
			<li><a href="javascript:showUserInfo();"><i class="fa fa-fw fa-user"></i> 个人资料</a></li>
			<li class="divider"></li>
			<li><a href="<c:url value='/logout'/>"><i class="fa fa-fw fa-power-off"></i> 注销</a></li>
		</ul> --%>
	</li>
</ul>
<!-- 修改用户密码的摸态框 -->
<div class="modal fade" id="userInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width: 1600px;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 class="modal-title">个人信息</h3>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<form class="form-horizontal" role="form"> 
							 <div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名：</label>
								<div class="col-sm-9">
									<input type="text" id="form-userName" class="col-xs-10 col-sm-5" name="userName" readonly>
								</div>
							 </div> 
							 <div class="space-4"></div> 							 
							 <div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-2">密码：</label>
								<div class="col-sm-9">
									<input type="text" id="form-password" class="col-xs-10 col-sm-5" name="password">
								</div>
							 </div> 
							 <div class="col-md-12">
								<button class="btn-sm btn-success no-radius" type="button" onclick="saveUserInfo()">
									<i class="icon-edit bigger-200"></i>
									保存修改
								</button>
							</div>
						</form> 
					</div>
				</div>
			</div>
		</div>
	</div>			
</div>
		
<script type="text/javascript">
/* url后传递的参数：timeStamp，是时间戳，这个保证加载的不是缓存中的数据 */
function showUserInfo()
{
	var getTimestamp = new Date().getTime();
	$("#userInfo").modal("show");
 	$.ajax({
		url:"<%=request.getContextPath()%>/getUserInfo?timeStamp="+getTimestamp,
		dataType:"json",
		async:true,
		type:"GET",
		success:function(result){
			$("#form-userName").attr("value",result.username);
			$("#form-password").attr("value",result.password);
		},
		error:function(){
			alert("出错了");
		}
	});	
}

function saveUserInfo()
{
	var password = document.getElementById("form-password").value; 
	var getTimestamp = new Date().getTime();
	$.ajax({
		url:"<%=request.getContextPath()%>/system/user/changePassword?timeStamp="+getTimestamp,
		dataType:"json",
		data:{"password":password},
		async:true,
		type:"GET",
		success:function(result){
			$("#userInfo").modal("hide");
			alert('保存成功，请重新登录');
			window.location.href = "<%=request.getContextPath()%>/index";			
		},
		error:function(){
			alert("出错了");
		}
	});	
	
}
</script>