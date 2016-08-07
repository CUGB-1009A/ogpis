<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- user  tab页第4页 -->
		<div class="tab-pane fade" id="planDocument" style="background: white">
		<c:forEach items="${planDocument}" var="item" varStatus = "status">												      
				<div class="row">
					<div class="col-xs-12">				
							<div class="box">
								<div class="col-xs-2" style="text-align: center;">
									<img src="<%=request.getContextPath()%>/assets/companyPic/documentPic.jpg" height="100px" width="100px" />
								</div>
								<div class="col-xs-10">
									<div class="box-header">
										<h4 style="text-align:left"><a href="<c:url value='/document/previewDocument?id=${item.id}&&editType=0'/>" target="_blank">${item.documentName }</a></h4>
									</div>
									<div class="box-footer">
										<a  href="<c:url value='/document/downloadDocument?id=${item.id}'/>" class="btn-sm btn-app btn-primary no-radius">
											<i class="icon-arrow-down bigger-200"></i>
											下载
										</a>
								</div>
						</div>
					</div>
					<br />
					</div><!-- /span -->
				</div><!-- /row -->
				<hr style="width:'1500px';color:'blue'">
		</c:forEach>
	 </div>
	<script>
		
	</script>