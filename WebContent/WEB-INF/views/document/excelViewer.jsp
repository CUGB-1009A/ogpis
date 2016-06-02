<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
%>
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=GB2312">
<title>excel预览</title>

<!--引用dynaload.js。后面的"?20"是让浏览器及时刷新的时间戳，请参见“常见问题解答”-->

<script type='text/javascript' src='<%=path%>/assets/supcan1.0.95.0/binary/dynaload.js?201'></script>


</head>

<body>
			 <form id="form12" style="height:500px ;width=70%">
				<script>
					insertReport('AF2', '');
				</script>
			</form>
		<div align="center">	
			<br>
			<h3>${documentName}</h3>
	    </div>

</body>
<script>
function OnReady(id)
{
   form12.AF2.func("Build","<%=path%>/${filePath}"); 
}
</script>

</html>