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
								<a href="" class="btn-sm btn-app btn-success no-radius">
								    <i class="icon-plus bigger-200">&nbsp;指定指标项</i>
								</a>
							</div>
						</div>
						
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th class="table-checkbox"><input type="checkbox" class="group-checkable" name="checkboxIndexFirst"/>全选</th>
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
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkboxIndex" value="${item.id}" />
												</td>
												<td>${item.index.indexName}</td>
												<td>${item.index.indexType}</td>
												<td>${item.index.indexUnit}</td>
												<td>${item.targetValue}</td>
												<td>
													<p>
														<a  href="<c:url value='/plan/admin/targetValueEdit?planId=${item.plan.id}&&indexId=${item.index.id}'/>"class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															编辑
														</a>
														&nbsp;
														<a href="javascript:delIndex('<c:url value='/plan/admin/deleteIndex?planId=${item.plan.id}&&indexId=${item.index.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
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
					</div>
            	</div>
            </div>
		</div>
</div>
<script type="text/javascript">
/* 删除指标提醒框 */
 function delIndex(url){
			var isDel =  confirm('确定删除该指标项？', '确认对话框');
			if(isDel){
				window.location.href=url;
			}	
}
/* 全选响应函数 */
$(function(){
			$("[name='checkboxIndexFirst']").click(function(){		
			if($("[name='checkboxIndexFirst']")[0].checked)
				{
				 for(var i=0;i<$("[name='checkboxIndex']").length;++i)
					$("[name='checkboxIndex']")[i].checked=true; 
				}
			else
				{
				 for(var i=0;i<$("[name='checkboxIndex']").length;++i)
					$("[name='checkboxIndex']")[i].checked=false; 
				}			
	});
});
</script>