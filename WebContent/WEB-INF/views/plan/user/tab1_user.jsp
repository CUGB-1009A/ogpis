<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- usertab页第一页 -->
		<div class="tab-pane fade" id="overview" style="background: white;">	      
		<div class="row">
			<div  class="col-xs-12 contentDiv">				
					 <div class="form-group">
						<div class="col-sm-12" >
						   <script id="container" name="planDescription" type="text/plain" style="height:300px">${plan.planDescription}</script>
												 <!-- 配置文件 -->
						    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/UEditor/ueditor.config.js"></script>
						    <!-- 编辑器源码文件 -->
						    <script type="text/javascript" src="<%=request.getContextPath()%>/assets/UEditor/ueditor.all.js"></script>
						    <!-- 实例化编辑器 -->
						    <script type="text/javascript">
						    var ue = UE.getEditor('container',{
						        	toolbars:[],
						        	wordCount:false,  
					                //关闭elementPath  
					                elementPathEnabled:false,
					                readonly:true
				        			 });
			    			</script>
						</div>
					</div> 
			</div><!-- /span -->
		</div><!-- /row -->
	 </div>
	<script>

	</script>