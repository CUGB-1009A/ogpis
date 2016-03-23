<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<!-- 模态框（Modal） -->
<div class="modal-header">
	<button type="button" class="close" 
	   data-dismiss="modal" aria-hidden="true">
	      &times;
	</button>
	<h4 class="modal-title" id="myModalLabel">
		  用户详情
	</h4>
</div>
<div class="modal-body" id="myModalContent">
	<div class="row">
		<div class="col-md-12" >
			<form class="form-horizontal" role="form">
				<div class="form-group col-md-8 col-md-offset-2 " >
				    <label class="col-md-4 control-label">登录账号</label>
				    <div class="col-md-8">
						<p class="form-control-static">${user.loginId }</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">显示名称</label>
				    <div class="col-md-8">
						<p class="form-control-static">${user.name }</p>
				    </div>
				</div>
			</form>
		</div>
	</div>
</div>
<div class="modal-footer">
</div>
<script type="text/javascript">
$(function(){
	alert("niexiao");
	$("#btnOK").bind("click",function(){
		alert("sdf");
	});
});

function test(){
	alert('sdfsdaf');
	 $("#form").submit();
}
</script>
