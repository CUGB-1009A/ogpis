<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  tab页第4项 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="tab-pane fade" id="completeEntry">
        &nbsp;
		<div class="row">
            <div class="col-md-12">
            	<div class="portlet box light-grey">
					<div class="portlet-title">
					</div>
					<div class="portlet-body">
						<div class="table-toolbar" style="text-align: right;">
							<div class="btn-group">
								<a href="javascript:openTheModel();" class="btn-sm btn-app btn-success no-radius">
								    <i class="icon-plus bigger-200">&nbsp;录入</i>
								</a>
							</div>
						</div>
						
						<div class="dataTables_wrapper form-inline" role="grid">
							<div class="table-scrollable">
								<table class="table table-striped table-bordered table-hover" id="data-table">
									<thead>
										<tr>
											<th>指标</th>
											<th>目标值</th>
											
											 <c:forEach items="${map}" var="temp" begin="0" end="0" step="1">
												 <c:forEach items="${temp.value}" var="indexValue">
											 		<th>
											 		<fmt:formatDate value="${indexValue.collectedTime}" pattern="YYYY-MM-dd"/>
											 		</th>
												 </c:forEach>
											
											</c:forEach>
											 <th>操作</th>
											
										</tr>
									</thead>
									<tbody>
										 <c:forEach items="${map}" var="item" varStatus="bag">
											<tr class="odd gradeX">
												
												<td>${item.key.indexName}</td>
												<td>${item.key.indexValue}</td>
												 <c:forEach items="${item.value}" var="indexValue">
											 		<td>
											 		${indexValue.finishedWorkload}
											 		</td>
												 </c:forEach>
												<td>
													<p>
														<a  href="#"class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-edit bigger-200"></i>
															修改（未实现）
														</a>
													</p>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- <c:import url ="../common/paging.jsp">
		        				<c:param name="pageModelName" value="indexs"/>
		        				<c:param name="urlAddress" value="/plan/show"/>
	        				</c:import> -->
						</div>
					</div>
            	</div>
            </div>
		</div>
</div>

<!-- 模态框修改已录入指标项的完成情况 -->
	<div class="modal fade" id="IndexDataEditModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="width: 1600px">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">完成情况录入</h3>
				</div>
				<div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							
 			<form class="form-horizontal" role="form"> 
				  <div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="collectedTime">录入时间</label>
					   	
					   	<div class="col-sm-9">
						   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="collectedTime" data-link-format="yyyy-mm-dd">
						   		<input type="text" id="collectedTime" placeholder="发布时间..." class="col-xs-10 col-sm-5 indexData" name="collectedTime" value="" readonly>
						   		<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
						   	</div>		   
						</div>
				 </div> 
				
				<c:forEach items="${tab4Indexs}" var="itemFinish">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${itemFinish.indexName}</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-xs-10 col-sm-5 indexData" name="${itemFinish.id}" value="0">
						</div>
					</div>
					<div class="space-4"></div> 
					</c:forEach>
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="button" onclick="addRecord()">
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
						</div>
				</form> 
							
						</div>
					</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

<!-- 模态框录入指标项的完成情况 -->
	<div class="modal fade" id="myIndexDataModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="width: 1600px">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">完成情况录入</h3>
				</div>
				<div class="modal-body">

					<div class="row">
						<div class="col-md-12">
							
 			<form class="form-horizontal" role="form"> 
				  <div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="collectedTime">录入时间</label>
					   	
					   	<div class="col-sm-9">
						   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="collectedTime" data-link-format="yyyy-mm-dd">
						   		<input type="text" id="collectedTime" placeholder="发布时间..." class="col-xs-10 col-sm-5 indexData" name="collectedTime" value="" readonly>
						   		<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
						   	</div>		   
						</div>
				 </div> 
				
				<c:forEach items="${tab4Indexs}" var="itemFinish">
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${itemFinish.indexName}</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-xs-10 col-sm-5 indexData" name="${itemFinish.id}" value="0">
						</div>
					</div>
					<div class="space-4"></div> 
					</c:forEach>
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="button" onclick="addRecord()">
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
						</div>
				</form> 
							
						</div>
					</div>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
<script type="text/javascript">
/* Ajax提交表单，后台插入指标体系的完成情况 */
function addRecord()
{
	var planId = "${plan.id}";
	var type = "${type}";
	var indexIds="";
	var indexValues="";
	var collectTime="";
	var inputObject = $(".indexData")
	collectTime = inputObject[0].value;
	for(var i=1;i<inputObject.length;i++){
		indexValues += inputObject[i].value+";";
		indexIds += inputObject[i].name+";";
	}
	$.ajax({
		url:"<%=request.getContextPath()%>/indexData/add",
		dataType:"json",
		async:true,
		data:{"indexIds":indexIds,"indexValues":indexValues,"collectTime":collectTime,"planId":planId,"type":type},
		type:"GET",
		success:function(result){

			var planId = result.planId;
			var type = result.type;
			window.location.href="<%=request.getContextPath()%>/plan/show?type="+type+"&&id="+planId+"&&flag=4";
			
		},
		error:function(){
			alert("出错了");
		}
	})
	
	$("#myIndexDataModal").modal("hide");
}

function openTheModel()
{
	$("#myIndexDataModal").modal("show");
}
/* 日期选择定制 */
$(function(){
	$(".date_picker").datetimepicker({
			language:"ch",
		    weekStart: 1,
	        todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
	});
});


</script>
