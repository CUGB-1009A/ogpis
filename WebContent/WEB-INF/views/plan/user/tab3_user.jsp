<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- user  tab页第3页 -->

<div class="tab-pane fade" id="planComplete" style="background: white">
					<!-- 再分三个tab页，第一个规划目标与完成情况，第二个油气储量完成情况，第三个是产量完成情况 -->
					<div class="row">
						<div class="col-xs-12" style="margin:0;padding:0">
							<ul id="myTab" class="nav nav-tabs">		
								   <li class="active"><a href="#completeCondition" data-toggle="tab">规划目标和完成情况</a></li> 
								   <li><a href="#storage" data-toggle="tab">油气储量完成情况</a></li>
								   <li><a href="#output" data-toggle="tab">油气产量完成情况</a></li>  
							</ul>				
							<div id="tabContent" class="tab-content">
								<%@ include file="tab3_1.jsp"%>
								<%@ include file="tab3_2.jsp"%>
								<%@ include file="tab3_3.jsp"%>
							</div>
						</div><!-- /span -->
					</div><!-- /row -->
									
	 </div>
