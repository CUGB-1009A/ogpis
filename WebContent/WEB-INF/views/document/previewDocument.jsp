

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文档预览</title>
<script type="text/javascript" src="<%=path%>/assets/js/jquery-1.11.1.min.js"></script>  
<script type="text/javascript" src="<%=path%>/assets/js/jquery.media.js"></script>


</head>
<body> 
	<div style="height:99%;width:99%;display:none" align="center"id="img">
		<img src="<%=basePath%>${filePath}" alt="不是图片或图片已丢失" >
		<br>
		<h3>${documentName}</h3>
	</div>
	
	<div id="sound" align="center" style="height:80%;width:100%;display:none">	
		<video height="70%" width="100%" src="<%=basePath%>${filePath}" controls="controls" autoplay></video>
		<br>
		<h3>${documentName}</h3>
	</div>

	<div style="display:none" id="unknown" align="center">
		<h3>该文件不能在线预览，请下载后借助本机软件浏览</h3>		
	</div>
	<div style="display:none" id="office" align="center">
		<iframe id="pdf"  width="400" height="500"></iframe> 
	</div> 
</body>
<script>
var fileType = '${flag}';
if(fileType=='1')//支持的图片文件
	{
	document.getElementById("img").style.display = "";
	document.getElementById("sound").style.display ="none";
	document.getElementById("unknown").style.display ="none";
	document.getElementById("office").style.display ="none";
	}
if(fileType=='2')//支持的声音文件
	{
	document.getElementById("img").style.display = "none";
	document.getElementById("sound").style.display ="";
	document.getElementById("unknown").style.display ="none";
	document.getElementById("office").style.display ="none";
	}
if(fileType=='3')//不能在线预览的文件
	{
	document.getElementById("img").style.display = "none";
	document.getElementById("sound").style.display ="none";
	document.getElementById("unknown").style.display ="";
	document.getElementById("office").style.display ="none";
	}

</script>
</html>