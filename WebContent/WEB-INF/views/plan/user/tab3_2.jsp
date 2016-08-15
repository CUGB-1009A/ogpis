<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 第二层次的第一个tab页 -->
		<div class="tab-pane fade" id="storage" style="background: white;">	 
		     	<div class="col-xs-12"> 
					<div align="center" style="padding:50px">
						<h2>油气储量总体情况</h2>	
						${plan.storageDescription}
					</div> 
				</div>		
					<c:forEach items="${plan.orderedPlan_Index}" var="item" varStatus="status">
						<c:if test="${item.index.indexType=='1'}">
							<div class="row">
									<div class="col-xs-12">  
								    		<h3 style="text-align:left">${status.index}、${item.index.indexName}完成情况</h3>
								    		<div class="col-xs-6"> 
												<div class="charts3" style="height:300px;width:600px;" align="center">	
												
												</div> 
											</div>
											
											<div class="col-xs-2"> 
												<div class="container" style="height:300px;width:100%" align="center">
												    <table class='table_1'
												    	   id="table_1${status.index}"
												           data-toggle="table_1${status.index}" 
												           data-height="300">
												        <thead>
												        </thead>
												    </table>
												</div>	
											</div>
												
											<div class="col-xs-4"> 
												<div style="height:300px;padding:20px" align="center">
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