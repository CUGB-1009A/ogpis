<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--  tab页第二项 -->
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
									<i class="icon-trash bigger-200">&nbsp;批量删除</i>
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
										<th>文档大小</th>
										<th>上传时间</th>
										<!-- <th>上传者</th> -->
										<th>操作</th>
									</tr>
								</thead>

								<tbody>
								  <c:forEach items="${planDocumentSet.items}" var="item">
										<tr class="odd gradeX">
											<td class="check_cell"><input type="checkbox"
												class="checkboxes" name="checkbox" value="${item.id}" /></td>
											<td><a target="_blank" href="<c:url value='/document/previewDocument?id=${item.id}&&editType=0'/>">${item.documentName}</a></td>
											<td>${item.documentSize}</td>
											<td><fmt:formatDate value="${item.uploadDate}" pattern="YYYY-MM-dd"/></td>
											
											<td>
												<p>
													<a  href="<c:url value='/document/downloadDocument?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
															<i class="icon-arrow-down bigger-200"></i>
															下载
														</a> &nbsp; <a
														href="javascript:del('<c:url value='/plan/deleteDoc?id=${item.id}&&type=${type}&&flag=2'/>');"
														class="btn-sm btn-app btn-danger no-radius"> <i
														class="icon-trash bigger-200"></i> 删除
													</a>
												</p>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<c:import url ="../../common/paging.jsp">
	        				<c:param name="pageModelName" value="planDocumentSet"/>
	        				<c:param name="urlAddress" value="/plan/show"/>
	       				</c:import>
						<!-- 模态框保存文件 -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							style="width: 1600px;margin-top:100px">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
									<button type="button"  id="closeFileUploadModel" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h3 class="modal-title">文件上传</h3>
									</div>
									<div  class="modal-body">
										<div class="row">
											<div class="col-md-12">
												<div id="uploader" class="wu-example">
    												<!--用来存放文件信息-->
											   		<div id="thelist" class="uploader-list"></div>
												    <div id="buttonsBar" class="btns">
<!-- 												    	<div id="picker" class="btn btn-default webuploader-container"> -->
<!-- 												    		<div class="webuploader-pick">选择文件</div> -->
<!-- 												    		<div id="rt_rt_1aqj7chrd90oj18akm1mlv188g1" style="position: absolute; top: 6px; left: 12px; width: 86px; height: 40px; overflow: hidden; bottom: auto; right: auto;"> -->
<!-- 													    		<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple"> -->
<!-- 													    		<label style="opacity: 0; width: 100%; height: 100%; display: block; cursor: pointer; background: rgb(255, 255, 255);">111</label> -->
<!-- 												    		</div> -->
<!-- 												    	</div> -->
												    
												    	<input type="file" name="file" class="webuploader-element-invisible" multiple="multiple">sdfs</input> 
												        <div id="picker" class="btn btn-default">选择文件</div>
												        <button id="ctlBtn" class="btn btn-default">开始上传</button>
												    </div>
												</div>
											</div>
										</div>

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
<script type="text/javascript">
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
	
	/* 初始化模态框，清空模态框一切信息，设置上传按钮可用，警示信息隐藏 */
	function showModal()
	{	
		alert("picker");
		$('#myModal').modal({
			backdrop : 'static',
			keyboard : false
		});
		uploader = WebUploader
				.create({
			// swf文件路径
			swf : '<%=path%>/assets/js/Uploader.swf',
		    // 文件接收服务端。
		    server: '<%=path%>/plan/uploadFiles?type=${type}&time=1&planId=${plan.id}',
		    // 内部根据当前运行是创建，可能是input元素，也可能是flash.
		    pick: '#picker'
		});
		var total = 0;
		var success = 0;
		var f = 1 ;//为了重新选择文件所用
		var hasFile = 0 ;
		var fileId = "";
	    
	         //webuploader注册监听事件 添加文件前先重置uploader
		uploader.on( 'beforeFileQueued', function( file ){
		     if(f==1)
		    	 {
		    	 total = 0;
		    	 uploader.reset();
		    	 $('#thelist').empty();
		    	 f=0;
		    	 }
			 
		}); 
	         
		$('#thelist').empty();

		//文件加入队列之后触发
		uploader.on( 'fileQueued', function( file ) {
			fileId = fileId + file.id ;
			total = total +1 ;
		    $('#thelist').append( '<div class="item">' +
		        '<h4 class="info">' + file.name + '</h4><div class="progress" style="width: 100%"><div id="'+file.id+'1"class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" style="width: 0%">'+
					'<span id="'+file.id+'"></span></div></div></div>' );
		});

		//当一批文件添加进队列以后触发
		uploader.on( 'filesQueued', function( files ) {
		    hasFile = 1;
			f=1;
		});

		uploader.on( 'uploadSuccess', function( file ) {
			 success = success + 1 ;
			 
		}); 

		uploader.on( 'uploadComplete', function( file ) {

			if(total == success)
				{
				$("#myModal").modal("hide");
				window.location.href = "<%=path%>/plan/show?type="+type+"&&id="+id+"&&flag=2";
				}
				
		});

		uploader.on( 'uploadProgress', function( file , percentage) {

			$('#'+file.id+'1').css('width',percentage*100+''+'%');  
		    $('#'+file.id)[0].innerHTML = percentage*100;  	

		});
		
		$('#ctlBtn').on("click",function(){
			if(hasFile == 0)
				alert("请选择文件再上传");
			else{
				uploader.upload();
			}		
		});	
	}
	
	/* 批量删除文档响应函数 */
	function delChosenDoc() 
	{
		var tempType = "${type}";
		var checkedObject =  $("input[name='checkbox']:checked");
		if(checkedObject.length==0)
			{
			alert("至少选择一个文档再删除！");
			return false;
			}	
		var isDelAll =  confirm('确定删除选定文档？', '确认对话框');
		var idTemp="";
		if(isDelAll)
		{
			for(var i=0;i<checkedObject.length;i++)
			{
				idTemp+=checkedObject[i].value+",";
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/plan/deleteDocBatch",
				data:{"Ids":idTemp,"type":tempType},
				type:"POST",
				async:true,
				success:function(result)
				{
					window.location.href="<%=request.getContextPath()%>/plan/show?flag=2&&id=${plan.id}&&type="+result.type;
				},
				error:function()
				{
					alert("批量删除错误");
				}			
			});
		}
	}
	
    /*删除文件交互对话框 */
	function del(url){
		var isDel =  confirm('确定删除该文档？', '确认对话框');
		if(isDel){
			window.location.href=url;
		}
	}
</script>