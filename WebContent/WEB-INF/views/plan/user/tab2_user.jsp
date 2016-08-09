<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- user  tab页第2页 -->
		<div class="tab-pane fade" id="planDistination" style="background:white;">	      
		 <textarea class="inputs2" style="display:none">${plan.tenHistoryIndexData}</textarea>	      
				<c:forEach items="${plan.indexs}" varStatus = "status" step='2'>
					<div class="row">
							<div class="col-xs-12">  
						    		<!-- 主图 -->	
						    		
						    		<div class="col-xs-6"> 
										<div class="charts2" style="height:300px;width:450px;" align="center">	
	
										</div> 
									</div>	
									
									<div class="col-xs-6"> 
										<div class="charts2" style="height:300px;width:450px;" align="center">	
	
										</div>
									</div>				
							</div>
					</div><!-- /row -->
				</c:forEach>
	 </div>