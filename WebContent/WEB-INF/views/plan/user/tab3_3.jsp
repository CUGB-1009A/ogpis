<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 第二层次的第一个tab页 -->
		<div class="tab-pane fade" id="output" style="background: white;">	      
			<c:forEach items="${plan.orderedPlan_Index}" var="item">
							<c:if test="${item.index.indexType=='2'}">
								<div class="row">
										<div class="col-xs-12">  	
								    		<div class="col-xs-6"> 
												<div class="charts4" style="height:300px;width:600px;" align="center">	
												
												</div> 
											</div>
											
											<div class="col-xs-2"> 
												<div style="height:300px;" align="center">	
												</div> 
											</div>
												
											<div class="col-xs-4"> 
												<div style="height:300px;" align="center">
												${item.indexPerformance}
												</div> 
											</div>									
									</div>
							</div><!-- /row -->
							<hr style="width:100%">
					</c:if>
			</c:forEach>
	 </div>
	<script>

	</script>