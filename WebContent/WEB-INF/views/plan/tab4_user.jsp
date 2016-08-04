<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- user  tab页第4页 -->
		<div class="tab-pane fade" id="planDocument">
		<c:forEach items="${planDocument}" varStatus = "status">												      
				<div class="row">
					<div class="col-xs-12">				
							<div class="box">
								<div class="col-xs-2" style="text-align: center;">
									<img src="<%=request.getContextPath()%>/assets/companyPic/documentPic.jpg" height="100px" width="100px" />
								</div>
								<div class="col-xs-10">
									<div class="box-header">
										<h4 style="text-align:left"><a href="" target="_blank">相关文档的名称</a></h4>
									</div>
									<div class="box-footer">
										<button class="btn btn-xs btn-default" style="float: right;">下载</button>
								</div>
						</div>
					</div>
					<br />
					</div><!-- /span -->
				</div><!-- /row -->
		</c:forEach>
	 </div>
	<script>
		
	</script>