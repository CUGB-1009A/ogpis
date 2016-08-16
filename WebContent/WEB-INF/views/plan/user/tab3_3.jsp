<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 第二层次的第一个tab页 -->
		<div class="tab-pane fade" id="output" style="background: white;">	
		<div class="col-xs-12"> 
			<div align="center" style="padding:50px">	
				<h2>油气产量总体情况</h2>
				${plan.outputDescription}
			</div> 
		</div>  
			<c:set var="temp2" value="0"/>    
			<c:forEach items="${plan.orderedPlan_Index}" var="item" varStatus="status">
							<c:if test="${item.index.indexType=='2'}">
							<c:set var="temp2" value="${temp2+1}"/>
								<div class="row">
										<div class="col-xs-12">  
										<h3 style="text-align:left;padding-left:30px">${temp2}、${item.index.indexName}</h3>	
								    		<div class="col-xs-6"> 
												<div class="charts4" style="height:300px;width:600px;" align="center">	
												
												</div> 
											</div>
											
											<div class="col-xs-3"> 											
											   <div class="container" style="width:100%" align="center">
												    <table class="table_2 table table-striped table-bordered table-hover"
												    	   id="table_2${status.index}"
												           data-toggle="table_2${status.index}" 
												           data-height="300">
												      <!--   <thead>
												        <tr>
												           
												        </tr>
												        </thead> -->
												    </table>
												</div>
												</div>
												
											<div class="col-xs-3"> 
												<div style="height:300px;padding:20px" align="center">
												<p style="font-family:楷体;text-indent: 30px;font-size: 15px;height: 275px;overflow:auto; width:100%">
													${item.indexPerformance}
												</p>
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