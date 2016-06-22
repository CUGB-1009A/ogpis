<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  tab页第3项 -->

<div class="tab-pane fade" id="indexEntry">
        &nbsp;
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
					</div>
					<div class="portlet-body">
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
					<a href='<c:url value='/plan/national/index/edit'/>' class="btn-sm btn-app btn-success no-radius">
					    <i class="icon-plus bigger-200">&nbsp;添加指标项</i>
					</a>
					
							</div>
						</div>
						
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxFirst"/>全选</th>
											<th>指标项</th>
											<th>类型</th>
											<th>单位</th>
											<th>目标值</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<!-- <c:forEach items="" var="item"> -->
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkbox" value="" />
												</td>
												<td>石油储量</td>
												<td>float</td>
												<td>万吨</td>
												<td>1000</td>
												<td>
													<p>
													
														<a  href="<c:url value=''/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															查看
														</a>
														&nbsp;
														<a href="javascript:del('<c:url value='/plan/national/delete?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
															<i class="icon-trash bigger-200"></i>
															修改
														</a>
														&nbsp;
														<a href="javascript:del('<c:url value='/plan/national/delete?id=${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
															<i class="icon-trash bigger-200"></i>
															删除
														</a>
													</p>
												</td>
											</tr>
										<!-- </c:forEach> -->
									</tbody>
								</table>
							</div>
						</div>
					</div>
            	</div>
            </div>
		</div>
</div>