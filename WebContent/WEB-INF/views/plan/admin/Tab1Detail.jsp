<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tab页第一页 -->
		<div class="tab-pane fade" id="overview" style="background: white;">	      
		<div class="row">
			<div class="col-xs-12">
			&nbsp;
				<form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/plan/save" method="post">
				<input type="hidden" value="${type}" name="type"/>
				<input type="hidden" value="${plan.id}" name="id"/>
				<input type="hidden" value="false" name="isAdd"/>			
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-1">规划名称</label>

						<div class="col-sm-4">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-sm-12" name="planName" value="${plan.planName }" >
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-4">发布时间</label>					   	
						<div class="col-sm-4">
						   	<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-4" data-link-format="yyyy-mm-dd">
						   		<input type="text" id="form-field-4" placeholder="发布时间..." class="col-sm-10" name="releaseDate" value="" readonly>
						   		<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
						   	</div>		   
						</div>
						
						
					</div>

					<div class="space-4"></div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-2">规划代号</label>

						<div class="col-sm-4">
							<input type="text" id="form-field-2" placeholder="规划代号..." class="col-sm-12" name="planCode" value="${plan.planCode }" >
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-5">规划起始时间</label>

						<div class="col-sm-4">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-5" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-5" placeholder="规划起始时间..." class="col-sm-10" name="startTime" value="" readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-3">发布单位</label>
						<div class="col-sm-4">
							<input type="text" id="form-field-3" placeholder="发布单位..." class="col-sm-12" name="releaseUnit" value="${plan.releaseUnit }">
						</div>
						
						<label class="col-sm-2 control-label no-padding-right" for="form-field-6">规划截止时间</label>
						<div class="col-sm-4">
							<div class="input-append date date_picker" data-date-format="dd MM yyyy" data-link-field="form-field-6" data-link-format="yyyy-mm-dd">
								<input type="text" id="form-field-6" placeholder="规划截止时间..." class="col-sm-10" name="endTime" value="" readonly>
								<span class="add-on"><i class="col-sm-2 icon-th"></i></span>	
							</div>
						</div>
				   </div> 
				   
				   <div class="space-4"></div>
				   <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-11">储量完成情况</label>
						<div class="col-sm-4">
							<textarea  id="form-field-11" placeholder="发布单位..." style="height:150px;" class="col-sm-12" name="storageDescription">${plan.storageDescription}</textarea>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="form-field-12">产量完成情况</label>
						<div class="col-sm-4">
							<textarea  id="form-field-12" placeholder="发布单位..." style="height:150px;" class="col-sm-10" name="outputDescription"> ${plan.outputDescription}</textarea>
						</div>
				   </div>
				   <div class="space-4"></div>
				     <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-10">规划概述</label>
						<div class="col-sm-4">
							<textarea  id="form-field-10" style="height:150px;" class="col-sm-12" name="planShortDescription">${plan.planShortDescription}</textarea>
						</div>
						<label class="col-sm-2 control-label no-padding-right" for="form-field-10">规划目标和总体情况</label>
						<div class="col-sm-4">
							<textarea  id="form-field-10" style="height:150px;" class="col-sm-10" name="targetAndFinished">${plan.targetAndFinished}</textarea>
						</div>
				   </div>
				
					
				   <div class="space-4"></div>
				   <div class="form-group">
						<label class="col-sm-2 control-label no-padding-right" for="form-field-7">规划背景和依据</label>
						<div class="col-sm-9">
						    <%-- <textArea id="form-field-7"  style="height:100px" placeholder="规划描述..." class="col-sm-12" name="planDescription" >${plan.planDescription}</textArea>
						    <script type="text/javascript">CKEDITOR.replace('planDescription',
						    		{   
										filebrowserImageUploadUrl : '<%=request.getContextPath()%>/uploadImg',  
										language : 'zh-cn',  
									});
						    </script> --%>
						    <script id="container" name="planDescription" type="text/plain" style="height:300px">${plan.planDescription}</script>
												 <!-- 配置文件 -->
						    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/UEditor/ueditor.config.js"></script>
						    <!-- 编辑器源码文件 -->
						    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/UEditor/ueditor.all.js"></script>
						    <!-- 实例化编辑器 -->
						    <script type="text/javascript">
						        var ue = UE.getEditor('container');
			    			</script>
						</div>
					</div> 
					
					<div class="clearfix form-actions">
						<div class="col-md-12">
							<button class="btn-sm btn-success no-radius" type="submit" >
								<i class="icon-ok bigger-200"></i>
								确认
							</button>
						</div>
					</div>
				</form>
			</div><!-- /span -->
		</div><!-- /row -->
	 </div>
	 <script>
	 
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