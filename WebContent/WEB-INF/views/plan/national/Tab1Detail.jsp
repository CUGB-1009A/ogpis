<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tab页第一页 -->
		<div class="tab-pane fade" id="overview">	      
		<div class="row">
			<div class="col-xs-12">
			&nbsp;
				<form class="form-horizontal" role="form">
				<input type="hidden" value="${nationalPlan.id}" name="id"/>				
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-1">规划名称</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-1" placeholder="规划名称..." class="col-xs-10 col-sm-5" name="planName" value="${nationalPlan.planName }" readonly>
						</div>
					</div>

					<div class="space-4"></div>
					
						<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-2">规划代号</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-2" placeholder="规划代号..." class="col-xs-10 col-sm-5" name="planCode" value="${nationalPlan.planCode }" readonly>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-3">发布单位</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-3" placeholder="发布单位..." class="col-xs-10 col-sm-5" name="releaseUnit" value="${nationalPlan.releaseUnit }"readonly>
						</div>
					</div>
					<div class="space-4"></div>
			 		
					  <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-4">发布时间</label>					   	
						   	<div class="col-sm-9">
								<input type="text" id="form-field-4" placeholder="发布时间..." class="col-xs-10 col-sm-5" name="releaseDate" value="" readonly>		   
							</div>
					</div> 
					
					<div class="space-4"></div>
					
					  <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-5">规划起始时间</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-5" placeholder="规划起始时间..." class="col-xs-10 col-sm-5" name="startTime" value="" readonly>
						</div>
					</div>  
					
					<div class="space-4"></div>
					
					
				 	 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-6">规划截止时间</label>

						<div class="col-sm-9">
							<input type="text" id="form-field-6" placeholder="规划截止时间..." class="col-xs-10 col-sm-5" name="endTime" value="" readonly>	
						</div>
					</div>
					
					 <div class="form-group">
						<label class="col-sm-3 control-label no-padding-right" for="form-field-7">规划描述</label>

						<div class="col-sm-9">
						    <textArea id="form-field-7"  style="height:100px" placeholder="规划描述..." class="col-xs-10 col-sm-5" name="planDescription" readonly></textArea>
						</div>
					</div>  
				</form>
			</div><!-- /span -->
		</div><!-- /row -->
	 </div>