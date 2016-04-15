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
		  规划信息详情
	</h4>
</div>
<div class="modal-body" id="myModalContent">
	<div class="row">
		<div class="col-md-12" >
			<form class="form-horizontal" role="form">
				<div class="form-group col-md-8 col-md-offset-2 " >
				    <label class="col-md-4 control-label">规划时间段</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.planPeriod}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">勘探投资</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.investment}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">石油探明地质储量</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.explore_oil}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">天然气探明地质储量</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.explore_gas}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">石油产量</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.production_oil}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">天然气产量</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.production_gas}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">勘探工程</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.exploration}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">销售收入</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.revenue}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">油田勘探</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.ytkt}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">油气集输</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.yqjs}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">油田开发</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.ytkf}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">炼油工程</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.lygc}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">化工生产</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.hgsc}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">水电设施规划</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.sdszgh}</p>
				    </div>
				</div>
				<div class="form-group col-md-offset-2 col-md-8" >
					<label class="col-md-4 control-label">产品销售</label>
				    <div class="col-md-8">
						<p class="form-control-static">${sinopecPlan.cpxs}</p>
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
