<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/init.jsp" %>
 <script type="text/javascript" src="<c:url value='/assets/js/plugins/data-tables/jquery.dataTables.js'/>"></script>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../../main/main_header.jsp"%>
		<%@ include file="../../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	
	<div id="page-wrapper" style="height:100%;">
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
		<div class="btn-toolbar" style="text-align: right;">
				<div class="btn-group">
					<button id="btnAdd"  class="btn-sm btn-success">添加用户</button>
				</div>
				<div class="btn-group">
					<button id="btnAdd"  class="btn-sm">添加用户</button>
					<button id="btnAdd"  class="btn-sm">添加用户</button>
				</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<h3 class="header smaller lighter blue">jQuery dataTables</h3>
				<div class="table-header">
					Results for "Latest Registered Domains"
				</div>
				<div class="table-responsive">
					<div id="sample-table-2_wrapper" class="dataTables_wrapper" role="grid">
					<div class="row">
					<table id="sample-table-2" class="table table-striped table-bordered table-hover dataTable" aria-describedby="sample-table-2_info">
						<thead>
							<tr role="row"><th class="center sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="" style="width: 37px;">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Domain: activate to sort column ascending" style="width: 114px;">Domain</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Price: activate to sort column ascending" style="width: 80px;">Price</th><th class="hidden-480 sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Clicks: activate to sort column ascending" style="width: 89px;">Clicks</th><th class="sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="
									
									Update
								: activate to sort column ascending" style="width: 135px;">
									<i class="icon-time bigger-110 hidden-480"></i>
									Update
								</th><th class="hidden-480 sorting" role="columnheader" tabindex="0" aria-controls="sample-table-2" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 121px;">Status</th><th class="sorting_disabled" role="columnheader" rowspan="1" colspan="1" aria-label="" style="width: 118px;"></th></tr>
						</thead>
					<tbody role="alert" aria-live="polite" aria-relevant="all"><tr class="odd">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">app.com</a>
								</td>
								<td class=" ">$45</td>
								<td class="hidden-480 ">3,330</td>
								<td class=" ">Feb 12</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="even">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">base.com</a>
								</td>
								<td class=" ">$35</td>
								<td class="hidden-480 ">2,595</td>
								<td class=" ">Feb 18</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="odd">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">max.com</a>
								</td>
								<td class=" ">$60</td>
								<td class="hidden-480 ">4,400</td>
								<td class=" ">Mar 11</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="even">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">best.com</a>
								</td>
								<td class=" ">$75</td>
								<td class="hidden-480 ">6,500</td>
								<td class=" ">Apr 03</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="odd">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">pro.com</a>
								</td>
								<td class=" ">$55</td>
								<td class="hidden-480 ">4,250</td>
								<td class=" ">Jan 21</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="even">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">team.com</a>
								</td>
								<td class=" ">$40</td>
								<td class="hidden-480 ">3,200</td>
								<td class=" ">Feb 09</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-inverse arrowed-in">Flagged</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="odd">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">up.com</a>
								</td>
								<td class=" ">$95</td>
								<td class="hidden-480 ">8,520</td>
								<td class=" ">Feb 22</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="even">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">view.com</a>
								</td>
								<td class=" ">$45</td>
								<td class="hidden-480 ">4,100</td>
								<td class=" ">Mar 12</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-success">Registered</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="odd">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">nice.com</a>
								</td>
								<td class=" ">$38</td>
								<td class="hidden-480 ">3,940</td>
								<td class=" ">Feb 12</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-info arrowed arrowed-righ">Sold</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr><tr class="even">
								<td class="center  sorting_1">
									<label>
										<input type="checkbox" class="ace">
										<span class="lbl"></span>
									</label>
								</td>

								<td class=" ">
									<a href="#">fine.com</a>
								</td>
								<td class=" ">$25</td>
								<td class="hidden-480 ">2,983</td>
								<td class=" ">Apr 01</td>

								<td class="hidden-480 ">
									<span class="label label-sm label-warning">Expiring</span>
								</td>

								<td class=" ">
									<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
										<a class="blue" href="#">
											<i class="icon-zoom-in bigger-130"></i>
										</a>

										<a class="green" href="#">
											<i class="icon-pencil bigger-130"></i>
										</a>

										<a class="red" href="#">
											<i class="icon-trash bigger-130"></i>
										</a>
									</div>

									<div class="visible-xs visible-sm hidden-md hidden-lg">
										<div class="inline position-relative">
											<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown">
												<i class="icon-caret-down icon-only bigger-120"></i>
											</button>

											<ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
												<li>
													<a href="#" class="tooltip-info" data-rel="tooltip" title="" data-original-title="View">
														<span class="blue">
															<i class="icon-zoom-in bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-success" data-rel="tooltip" title="" data-original-title="Edit">
														<span class="green">
															<i class="icon-edit bigger-120"></i>
														</span>
													</a>
												</li>

												<li>
													<a href="#" class="tooltip-error" data-rel="tooltip" title="" data-original-title="Delete">
														<span class="red">
															<i class="icon-trash bigger-120"></i>
														</span>
													</a>
												</li>
											</ul>
										</div>
									</div>
								</td>
							</tr></tbody></table><div class="row"><div class="col-sm-6"><div class="dataTables_info" id="sample-table-2_info">Showing 1 to 10 of 23 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap"><ul class="pagination"><li class="prev disabled"><a href="#"><i class="icon-double-angle-left"></i></a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li class="next"><a href="#"><i class="icon-double-angle-right"></i></a></li></ul></div></div></div></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
	var oTable1 = $('#sample-table-2').dataTable( {
	"aoColumns": [
      { "bSortable": false },
      null, null,null, null, null,
	  { "bSortable": false }
	] } );
	
	
	$('table th input:checkbox').on('click' , function(){
		var that = this;
		$(this).closest('table').find('tr > td:first-child input:checkbox')
		.each(function(){
			this.checked = that.checked;
			$(this).closest('tr').toggleClass('selected');
		});
			
	});


	$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
	function tooltip_placement(context, source) {
		var $source = $(source);
		var $parent = $source.closest('table')
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		var w2 = $source.width();

		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
		return 'left';
	}
})

</script>
</html>
	