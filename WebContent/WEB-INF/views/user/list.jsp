<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/taglib/c.tld" prefix="c"%>
<div class="main-container" id="main-container">
	<script type="text/javascript">
		try{ace.settings.check('main-container' , 'fixed')}catch(e){}
	</script>

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
					<li class="active">用户管理</li>
				</ul>
			</div>

			<div class="page-content">
				<div class="page-header">
					<h1>
						Tables
						<small>
							<i class="icon-double-angle-right"></i>
							Static &amp; Dynamic Tables
						</small>
					</h1>
					<button type="button" class="btn btn-sm" click="javastript:alert('dsf');">添加用户</button>
					<a href="javascript:main_center_load('/user/add')" class="btn btn-primary btn-lg" role="button">Learn more</a>
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->

						<div class="row">
							<div class="col-xs-12">
								<div class="table-responsive">
									<table id="sample-table-1" class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</th>
												<th>ID</th>
												<th>用户名</th>
												<th class="hidden-480">状态</th>
												<th class="hidden-480">状态</th>
												<th class="hidden-480">状态</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${users}" var="item">  
	                    						<tr>
												<td class="center">
													<label>
														<input type="checkbox" class="ace" />
														<span class="lbl"></span>
													</label>
												</td>

												<td>
													<a href="#">ace.com</a>
												</td>
												<td>${item.name}ss</td>
												<td class="hidden-480">3,330</td>
												<td>Feb 12</td>

												<td class="hidden-480">
													<span class="label label-sm label-warning">Expiring</span>
												</td>

											</tr>
	                						</c:forEach>  
										</tbody>
									</table>
								</div><!-- /.table-responsive -->
							</div><!-- /span -->
						</div><!-- /row -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->
	</div>
</div><!-- /.main-container -->
	