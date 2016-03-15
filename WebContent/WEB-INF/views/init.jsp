<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!-- CSS -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="<%=path %>/assets/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=path %>/assets/bootstrap/css/bootstrap-theme.css" type="text/css">
<link rel="stylesheet" href="<%=path %>/assets/font-awesome/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<%=path %>/assets/css/form-elements.css" type="text/css">
<link rel="stylesheet" href="<%=path %>/assets/css/style.css" type="text/css">
<!-- Morris Charts CSS -->
<link rel="stylesheet" href="<%=path %>/assets/bootstrap/css/plugins/morris.css" >
 <!-- Custom CSS -->
<link rel="stylesheet" href="<%=path %>/assets/css/sb-admin.css" >
<%-- <link rel="stylesheet" href="<%=path %>/assets/css/ace.min.css" /> --%>
<%-- <link rel="stylesheet" href="<%=path %>/assets/css/ace-rtl.min.css" /> --%>
<%-- <link rel="stylesheet" href="<%=path %>/assets/css/ace-skins.min.css" /> --%>

<!-- Javascript -->
<script src="<%=path %>/assets/js/jquery-1.11.1.min.js"></script>
<script src="<%=path %>/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=path %>/assets/js/jquery.backstretch.min.js"></script>
<script src="<%=path %>/assets/js/scripts.js"></script>
<script src="<%=path %>/js/main.js"></script>

<%-- <script src="<%=path %>/assets/js/ace-extra.min.js"></script> --%>
<!-- Morris Charts JavaScript -->
<%-- <script src="<%=path %>/assets/js/plugins/morris/raphael.min.js"></script> --%>
<%-- <script src="<%=path %>/assets/js/plugins/morris/morris.min.js"></script> --%>
<%-- <script src="<%=path %>/assets/js/plugins/morris/morris-data.js"></script> --%>



<!--[if lte IE 8]>
  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->



<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="assets/js/html5shiv.js"></script>
<script src="assets/js/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
function main_center_load(url){
	$("#main_center").load("<%=path%>"+url);
}
</script>

 