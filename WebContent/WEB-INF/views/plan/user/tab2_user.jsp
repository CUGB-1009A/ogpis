<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- user  tab页第2页 -->
		<div class="tab-pane fade" id="planDistination" style="background:white;">	      
		 <textarea class="inputs2" style="display:none">${plan.tenHistoryIndexData}</textarea>
		 	    <c:set var="temp3" value="0"/>	
				<c:forEach items="${plan.indexs}" var="item">
					<c:if test="${item.track}">
					  <c:if test="${temp3%2==0}">
						<div class="row">
								<div class="col-xs-12">  
							    		<div class="col-xs-6"> 
											<div class="charts2" style="height:300px;width:450px;" align="center">	
		
											</div> 
										</div>
					</c:if>	
					<c:if test="${temp3%2==1}">
									<div class="col-xs-6"> 
										<div class="charts2" style="height:300px;width:450px;" align="center">	
	
										</div>
									</div>				
							</div>
						</div><!-- /row -->
					</c:if>
					<c:set var="temp3" value="${temp3+1}"/>
					</c:if>
				</c:forEach>
	 </div>