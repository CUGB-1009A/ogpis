<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 相关历史数据 -->
		<div class="tab-pane fade" id="historyData" style="background: white;">	 
		 <textarea class="inputs5" style="display:none">${plan.allIndexHistory}</textarea>
		     	<div class="col-xs-12"> 
					<div align="center" style="padding:50px">
						<h2>规划制定参考相关历史数据</h2>	
					</div> 
				</div>
					<c:forEach items="${plan.orderedPlan_Index}" var="item" varStatus="status1">
							<div class="row">
									<div class="col-xs-12">  
								    		<h3 style="text-align:left;padding-left:30px">${status1.index+1}、${item.index.indexName}</h3>
								    		<div class="col-xs-6"> 
												<div class="charts5" style="height:300px;width:600px;" align="center">	
												
												</div> 
											</div>
												
											<div class="col-xs-6"> 
												<div style="height:300px;padding:20px" align="center">
												<p style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 275px;overflow:auto; width:100%">
													${item.historyDescription}
												</p>
												</div> 
											</div>		
											
				
									</div>
							</div><!-- /row -->
							<hr style="width:100%">
				</c:forEach>
			</div>
	<script>

	</script>