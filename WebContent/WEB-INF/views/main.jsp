<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<html>
<body>
<!-- wrapper -->
<div id="wrapper">
	<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="main/main_header.jsp"%>
		<%@ include file="main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	<div id="page-wrapper" style="height: 100%;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<small><i class="fa fa-flag"></i> 最 新 的 规 划</small>
					</h1>
					
					<h1 class="page-header">
						<small><i class="fa fa-eye"></i> 我 关 注 的 规 划 </small>
					</h1>
					
					<c:forEach items="${planConcern}" var="item">
					<ol class="breadcrumb">
						<li class="active"><i class="icon-search"></i>&nbsp;&nbsp; <a href="<c:url value='/plan/showDetail?id=${item.id}'/>">${item.planName}</a>
						&nbsp;&nbsp;&nbsp;&nbsp;发布时间 &nbsp;&nbsp;<i class="icon-time">&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${item.releaseDate}" pattern="YYYY-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;</i>
						<a  href="javascript:disconcernPlan('<c:url value='${item.id}'/>');" class="btn-sm btn-app btn-danger no-radius">
							<i class=" icon-thumbs-down bigger-200"></i> 取消关注
							</a>&nbsp;
						</li>	
					</ol>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function disconcernPlan(url)
{
	var yes =  confirm('确定取消关注？', '确认对话框');
	if(yes)
		{
			$.ajax({
				url:"<%=request.getContextPath()%>/plan/disconcern",
				dataType:"json",
				async:true,
				data:{"planId":url},
				type:"GET",
				success:function(result){		
					window.location.href="<%=path%>/main";
				},
				error:function(){
					alert("出意外错误了");
				}
			});
		}
}
</script>
</html>
