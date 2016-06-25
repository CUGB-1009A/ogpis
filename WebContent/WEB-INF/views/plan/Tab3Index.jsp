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
								<a href="<%=request.getContextPath()%>/index/add?planId=${plan.id}" class="btn-sm btn-app btn-success no-radius">
								    <i class="icon-plus bigger-200">&nbsp;添加指标项</i>
								</a>
								&nbsp;
								<a href="<%=request.getContextPath()%>/index/import?planId=${plan.id}" class="btn-sm btn-app btn-success no-radius">
								    <i class="icon-plus bigger-200">&nbsp;导入指标项</i>
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
										 <c:forEach items="${indexs.items}" var="item">
											<tr class="odd gradeX">
												<td class="check_cell">
												 <input type="checkbox" class="checkboxes" name="checkboxIndex" value="${item.id}" />
												</td>
												<td>${item.indexName}</td>
												<td>${item.indexType}</td>
												<td>${item.indexUnit}</td>
												<td>${item.indexValue}</td>
												<td>
													<p>
														<a  href="<c:url value='/index/edit?id=${item.id}&&planId=${plan.id}'/>"class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															编辑
														</a>
														&nbsp;
														<a href="javascript:delIndex('<c:url value='/index/delete?id=${item.id}&&planId=${plan.id}'/>');" class="btn-sm btn-app btn-danger no-radius" >
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
							<c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="indexs"/>
		        				<c:param name="urlAddress" value="/plan/show"/>
	        				</c:import>
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