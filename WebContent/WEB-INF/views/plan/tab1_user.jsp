<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- usertab页第一页 -->
		<div class="tab-pane fade" id="overview">	      
		<div class="row">
			<div class="col-xs-12">				
					 <div class="form-group">
						<div class="col-sm-12">
						   <%--  <textArea style="height:100px" placeholder="规划描述..." class="col-xs-10 col-sm-5" name="planDescription" >${plan.planDescription}</textArea> --%>
						 <%--    <script type="text/javascript">CKEDITOR.replace('planDescription',
						    		{   
										filebrowserImageUploadUrl : '<%=request.getContextPath()%>/uploadImg',  
										language : 'zh-cn',
										height:430,
										toolbar:[['About','Maximize']]
									});
						    </script> --%>
						    ${plan.planDescription}
						</div>
					</div> 
			</div><!-- /span -->
		</div><!-- /row -->
	 </div>
	<script>

	 CKEDITOR.on('instanceReady', function (ev) {
         ev.editor.setReadOnly(true); 
     });
	</script>