<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--  tab页第二项 -->
<%
String tomcatPath = request.getSession().getServletContext().getRealPath("/");
%>
<div class="tab-pane fade" id="document">
	&nbsp;
	<div class="row">
		<div class="col-md-12">
			<div class="portlet box light-grey">
				<div class="portlet-title"></div>
				<div class="portlet-body">
					<div class="table-toolbar" style="text-align: right;">
						<div class="btn-group">
							<a href="javascript:showModal();"
								class="btn-sm btn-app btn-success no-radius"> <i
								class="icon-arrow-up bigger-200">&nbsp;上传文档</i>
							</a>
							
							&nbsp;
								<a href="javascript:delChosenDoc();" class="btn-sm btn-app btn-danger no-radius">
									<i class="icon-trash bigger-200">&nbsp;批量删除(未实现)</i>
								</a>
						</div>
					</div>
					<div class="dataTables_wrapper form-inline" role="grid">
						<div class="table-scrollable">
							<table class="table table-striped table-bordered table-hover"
								id="data-table">
								<thead>
									<tr>
										<th class="table-checkbox"><input type="checkbox"
											class="group-checkable" name="checkboxFirst" />全选</th>
										<th>文档名称</th>
										<th>文档描述</th>
										<th>上传时间</th>
										<!-- <th>上传者</th> -->
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
								  <c:forEach items="${planDocumentSet}" var="item">
									<c:if test='${item.deleted==false}'>
										<tr class="odd gradeX">
											<td class="check_cell"><input type="checkbox"
												class="checkboxes" name="checkbox" value="${item.id}" /></td>
											<td>${item.documentName}</td>
											<td>${item.documentDescription}</td>
											<td>${item.uploadDate}</td>
											<td>
												<p>
													<a
														href="<%=request.getContextPath()%>/${item.documentAddress}"
														class="btn-sm btn-app btn-primary no-radius"> <i
														class="icon-success icon-arrow-down bigger-200"></i> 下载
													</a> &nbsp; <a
														href="javascript:del('<c:url value='/plan/national/deleteDoc?id=${item.id}&&nationalPlanId=${nationalPlan.id}'/>');"
														class="btn-sm btn-app btn-danger no-radius"> <i
														class="icon-trash bigger-200"></i> 删除
													</a>
												</p>
											</td>
										</tr>
									  </c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- 模态框保存文件 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="width: 1600px">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3 class="modal-title">文件上传</h3>
									</div>
									<div class="modal-body">

										<div class="row">
											<div class="col-md-12">
												<form id="docForm" class="form-horizontal" role="form"
													action="<%=request.getContextPath()%>/plan/national/uploadFiles?id=${nationalPlan.id}"
													method="post" encType="multipart/form-data">
													<div class="form-group col-md-8 col-md-offset-2 ">
														<label class="col-md-4 control-label">选择文件</label>
														<div class="col-md-8">
															<input id="file" class="file" type="file" name="file"
																onchange="showFileList()" multiple>
														</div>
													</div>

													<div class="form-group col-md-offset-2 col-md-8">
														<label class="col-md-4 control-label">文件清单</label>
														<div class="col-md-8">
															<textarea id="fileList" name="fileList" rows="4"
																cols="20" style="height: 120px; width: 400px" readonly></textarea>
														</div>
													</div>

													<div class="form-group col-md-offset-2 col-md-8">
														<label class="col-md-4 control-label"></label>
													</div>

													<div class="form-group col-md-offset-2 col-md-8">
														<label class="col-md-4 control-label">文件描述</label>
														<div class="col-md-8">
															<textarea id="fileDescription" name="fileDescription"
																rows="4" cols="20" style="height: 120px; width: 400px"></textarea>
														</div>
													</div>
												</form>
											</div>
										</div>

									</div>
									<div class="modal-footer">
										<span id="sizeWarning" style="color: red; display: none"></span>
										<button type="button" class="btn btn-primary" id="upload">上传</button>
										<button type="button" class="btn btn-default" id="cancel">取消</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->


						<!-- 模态框上传进度条 -->
						<div class="modal fade" id="myModalProgress" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
							style="width: 1600px">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h3 class="modal-title">文件上传进度</h3>
									</div>
									<div class="modal-body">
										<div class="row">
											<div class="col-md-12">
												<div class="progress" style="width: 100%">
													<div id="proBar"
														class="progress-bar progress-bar-success progress-bar-striped"
														role="progressbar" style="width: 0%">
														<span id="showProgress"></span>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											id="cancelUploading">取消上传(未实现)</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->



					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	/* 全选响应函数 */
	$(function() {
		$("[name='checkboxFirst']").click(function() {
			if ($("[name='checkboxFirst']")[0].checked) {
				for (var i = 0; i < $("[name='checkbox']").length; ++i)
					$("[name='checkbox']")[i].checked = true;
			} else {
				for (var i = 0; i < $("[name='checkbox']").length; ++i)
					$("[name='checkbox']")[i].checked = false;
			}
		});
	});
	
    /*删除文件交互对话框 */
	function del(url){
		var isDel =  confirm('确定删除该文档？', '确认对话框');
		if(isDel){
			window.location.href=url;
		}
	}
    

</script>