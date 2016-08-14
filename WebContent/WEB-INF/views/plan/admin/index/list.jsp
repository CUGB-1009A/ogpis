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
								<a href="" class="btn-sm btn-app btn-success no-radius" data-toggle="modal" data-target="#selectModal" data-backdrop="static">
								    <i class="icon-plus bigger-200">&nbsp;指定指标项</i>
								</a>
							</div>
						</div>
			
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th>指标项</th>
											<th>类型</th>
											<th>单位</th>
											<th>目标值</th>											
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										 <c:forEach items="${plan_indexs}" var="item">
											<tr class="odd gradeX">
												<td>${item.index.indexName}</td>
												<td>${item.index.indexType}</td>
												<td>${item.index.indexUnit}</td>
												<td>${item.targetValue}</td>
												<td>
													<p>
														<a href="<c:url value='/plan/admin/targetValueEdit?planId=${item.plan.id}&indexId=${item.index.id}'/>"class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															编辑
														</a>
														&nbsp;
														<a href="<c:url value='/plan/admin/deleteIndex?planId=${item.plan.id}&&indexId=${item.index.id}&&type=${type}'/>"
															onclick="return delIndex()" 
															class="menu btn-sm btn-app btn-danger no-radius" >
															<i class="icon-trash bigger-200"></i>
															删除
														</a>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					
						<div class="modal fade" id="selectModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true"
								style="width: 1600px ;margin-top: 150px;">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h3 class="modal-title">指定指标项</h3>
										</div>
										<div class="modal-body">
											<div class="dataTables_wrapper form-inline" role="grid">
												<form id="selectIndexForm" class="form-horizontal" role="form" action="<%=request.getContextPath()%>/plan/admin/selectIndex" method="post">
													<input type="hidden" name="planId" value="${plan.id}" />
													<input type="hidden" name="type" value="${type}" />
													<div class="table-scrollable">
														<table class="table table-striped table-bordered table-hover" id="data-table">
															<thead>
																<tr>
																	<th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxIndexFirst"/></th>
																	<th>指标项名称</th>
																	<th>类型</th>
																	<th>单位</th>
																</tr>
															</thead>
															<tbody>
																 <c:forEach items="${allIndexs}" var="item">
																	<tr class="odd gradeX">
																		<td class="check_cell">
																		 <input type="checkbox" class="checkboxes" name="indexIds" value="${item.id}" 
																		 <c:if test='${plan.indexIds.contains(item.id)}'>checked='checked' disabled='true'</c:if>/>
																		</td>
																		<td>${item.indexName}</td>
																		<td>${item.indexType}</td>
																		<td>${item.indexUnit}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
													<button type="submit" class="btn btn-default" id="submit" onclick="return isSelected()">确定</button>
												</form>
											</div>
										</div>
										<!--  
										<div class="modal-footer">
											<a href="<c:url value='/plan/admin/selectIndex?planId=${item.plan.id}&&indexId=${item.index.id}'/>"type="button" class="btn btn-primary" id="upload">确定</a>
											<button type="button" class="btn btn-default" id="cancel">取消</button>
										</div>
										-->
									</div><!-- /.modal-content -->
								</div><!-- /.modal-dialog -->
							</div><!-- /.modal -->	
					
					</div>
            	</div>
            </div>
		</div>
</div>
<script type="text/javascript">
/* 全选响应函数 */
$(function() {
	$("[name='checkboxIndexFirst']").click(function() {
		if ($("[name='checkboxIndexFirst']")[0].checked) {
			for (var i = 0; i < $("[name='indexIds']").length; ++i){
				$("[name='indexIds']:checkbox:enabled")[i].checked=true;
			}
				

		} else {
			for (var i = 0; i < $("[name='indexIds']").length; ++i){
				$("[name='indexIds']:checkbox:enabled")[i].checked = false;
			}
		}
	});
});

/* 删除指标提醒框 */
function delIndex(url) {
	var isDel = confirm('确定删除该指标项？', '确认对话框');
	if (isDel) {
		window.location.href = url;
	}
}
function delIndex(){
	alert("sdf");
	var isDel = confirm('确定删除该指标项？', '确认对话框');
	return isDel;
	
}
function isContains(plan){
	
}
function isSelected(){
	$('#selectModal').modal('hide')
	return $("#selectIndexForm .checkboxes:checked:enabled").length>0;
}

</script>