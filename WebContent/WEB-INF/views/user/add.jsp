<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<div class="main-container" id="main-container">
	<div class="main-container-inner">
		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs" style="text-align: left;">
				<ul class="breadcrumb">
					<li>
						<i class="icon-home home-icon"></i>
						<a href="#">首页</a>
					</li>
					<li>
						<a href="#">系统管理</a>
					</li>
					<li>
						<a href="#">用户管理</a>
					</li>
					<li class="active">添加用户</li>
				</ul>
			</div>
			<div>
				<form class="form-horizontal" role="form" action="<%=path%>/user/save">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Text Field </label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="Username" class="col-xs-10 col-sm-5">
						</div>
					</div>

					<div class="space-4"></div>

					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 密码 </label>

						<div class="col-sm-9">
							<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5">
							<span class="help-inline col-xs-12 col-sm-7">
								<span class="middle">Inline help text</span>
							</span>
						</div>
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 重复输入 </label>

						<div class="col-sm-9">
							<input type="password" id="form-field-2" placeholder="Password" class="col-xs-10 col-sm-5">
							<span class="help-inline col-xs-12 col-sm-7">
								<span class="middle">Inline help text</span>
							</span>
						</div>
					</div>

					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn btn-info" type="submit" >
								<i class="icon-ok bigger-110"></i>
								确认
							</button>

							&nbsp; &nbsp; &nbsp;
							<button class="btn" type="reset">
								<i class="icon-undo bigger-110"></i>
								重置
							</button>
						</div>
					</div>
				</form>
			</div>
		</div><!-- /.main-content -->
	</div>
</div><!-- /.main-container -->
	