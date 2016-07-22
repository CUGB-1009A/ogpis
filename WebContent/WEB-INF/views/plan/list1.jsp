<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%@include file="/WEB-INF/views/init.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>油气资源规划管理系统</title>
     <%
    	String type = request.getAttribute("type").toString();
        String plansNumber = request.getAttribute("plansNumber").toString();
        /* System.out.println( request.getAttribute("plans").length()); */
    %>
</head>
<html>
<body>
<div id="wrapper">
<!-- 网站头及导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="z-index:1080">
		<%@ include file="../main/main_header.jsp"%>
		<%@ include file="../main/main_nav.jsp"%>
	</nav>
	<!--网页主体 -->
	<div style="height:800px;width:100%;background:white">
		<div style="height:100px;width:100%">	
				<div class="col-lg-5" style="height:100%">			
					 <span style="text-align:center;font-size:22px;vertical-align:middle;line-height:100px">
		 				 <c:if test='<%=!plansNumber.equals("0")%>'> 	
					     	 <c:forEach items="${mapList}" var="item1" begin="0" end="0">
					     	 	<c:forEach items="${item1}" var="item2" begin="0" end="0">
					     	 		<b>${item2.key.planName}</b>	
						     	 	<c:if test="${item2.value}">
						     	 		<b>取消关注</b>
						     	 		${item1.value}
						    		</c:if>
								    <c:if test="${!item2.value}">
								     	<b>关注</b>
								    </c:if>	
							     </c:forEach>
					         </c:forEach>
					     </c:if>	     	 
				     	  <c:if test='<%=plansNumber.equals("0")%>'>
				     	 	<b>没有相关规划</b>
				     	 </c:if>
				     </span>
					    
			   </div>
			   
			   	<div class="col-lg-2" style="float:left" style="height:100%">				
					<c:if test='<%=type.equals("QG")%>'>
						 <img src="<%=path%>/assets/companyPic/quanguo.jpg" alt="全国" style="border:solid 2px blue;margin:6px;">
					</c:if>
					
					<c:if test='<%=type.equals("ZSY")%>'>
						<a target="_blank"  href="<%=path%>/assets/companyIntro/zhongshiyou.html" title="中石油公司相关介绍">
						 	<img src="<%=path%>/assets/companyPic/zhongshiyou.jpg" alt="中石油"  style="border:solid 2px blue;margin:6px">
						 </a>
					</c:if>
					
					<c:if test='<%=type.equals("ZSH")%>'>
						 <img src="<%=path%>/assets/companyPic/zhongshihua.jpg" alt="中石化"  style="border:solid 2px blue;margin:6px">
					</c:if>
					
					<c:if test='<%=type.equals("ZHY")%>'>
						 <img src="<%=path%>/assets/companyPic/zhonghaiyou.jpg" alt="中海油"  style="border:solid 2px blue;margin:6px">
					</c:if>
					
					<c:if test='<%=type.equals("YC")%>'>
						 <img src="<%=path%>/assets/companyPic/yanchangshiyou.jpg" alt="延长"  style="border:solid 2px blue;margin:6px">
					</c:if>
					
					<c:if test='<%=type.equals("ZLM")%>'>
						 <img src="<%=path%>/assets/companyPic/zhonglianmei.jpg" alt="中联煤"  style="border:solid 2px blue;margin:6px">
					</c:if>
					
					<c:if test='<%=type.equals("QT")%>'>
						<img src="<%=path%>/assets/companyPic/qita.jpg" alt="其他公司"  style="border:solid 2px blue;margin:6px">				
					</c:if>	
				</div>
				
				<div class="col-lg-5" style="height:100%">
					<div class="input-group" style="margin:20px">
					<form action="<%=path%>" method="post">
					 <c:if test='<%=!plansNumber.equals("0")%>'>
						<input class="form-control" name="condition" type="text" value="${condition}">
					</c:if>
						 <span class="input-group-btn">
					<c:if test='<%=!plansNumber.equals("0")%>'>
					        <button class="btn btn-default" type="submit"><i class="icon-search "></i>搜索</button>
					 </c:if>
					        <shiro:hasPermission name="plan:add">
					         <button class="btn btn-default" type="button"><i class="icon-plus"></i> 新建</button>
					         </shiro:hasPermission>
					     </span>	
					     </form>
					</div>
			   </div> 
		</div>
		<c:if test='<%=!plansNumber.equals("0")%>'>
			<div style="height:200px;width:100%;background:pink;border:solid 2px blue" >
				<div class="col-lg-3" style="height:100%;background:white;border:solid 2px blue">
				
				</div>
				
				<div class="col-lg-9" style="height:100%">
				
				</div>
			</div>
			
			<div style="height:200px;width:100%;background:red">
				
			</div>
			
			<div style="height:200px;width:100%;background:blue">
				
			</div>
			
			<div style="height:200px;width:100%;background:yellow">
				
			</div>
			
			<div style="height:50px;width:100%;background:white">
				<div class="col-lg-7" style="height:100%">				
				</div>
				<div class="col-lg-5" style="height:100%">	
				<button>发布/取消发布</button>
				<button>关注/取消关注</button>
				<button>编辑</button>
				<button>删除</button>		
				</div>
			</div>
		</c:if>
		
		<c:forEach items="${plans}" var="item" begin='1'>
			${item.planName}
		</c:forEach>
			
	</div>
</div>


<script type="text/javascript">
var tempType = "${type}";

/* 用ajax提交关注规划响应 */
function concernPlan(url)
{
	var getTimestamp = new Date().getTime()
	$.ajax({
		url:"<%=request.getContextPath()%>/plan/concern?temp="+getTimestamp,
		dataType:"json",
		async:true,
		data:{"planId":url},
		type:"GET",
		success:function(result){
		if(result.result=='success')
			alert('关注成功');
		if(result.result=='failed')
			alert('您已经关注了该规划');		
		},
		error:function(){
			alert("出意外错误了");
		}
	});
	
}

function del(url){
	var isDel =  confirm('确定删除该规划？', '确认对话框');
	if(isDel){
		window.location.href=url;
	}
}

function fuzzyQuery()
{
	var temp = $("#inputFuzzyQuery").val();
	if(temp=="")
		{
		alert("请输入查询条件！")
		return ;
		}
	else
		$("#queryPlan").submit();
}

/* 批量删除规划响应函数 */
function delAll()
{
	var checkedObject =  $("input[name='checkbox']:checked");
	if(checkedObject.length==0)
		{
		alert("至少选择一个规划再删除！");
		return;
		}	
	var isDelAll =  confirm('确定删除选定规划？', '确认对话框');
	var idTemp="";
	if(isDelAll)
	{
		for(var i=0;i<checkedObject.length;i++)
		{
			idTemp+=checkedObject[i].value+",";
		}
		$.ajax({
			url:"<%=path%>/plan/deleteBatch",
			data:{"Ids":idTemp,"type":tempType},
			type:"POST",
			async:true,
			success:function(result)
			{
			window.location.href="<%=path%>/plan/list?condition=&&type="+result.type;
			},
			error:function()
			{
				alert("批量删除错误");
			}			
		});
	}
}

/* 全选响应函数 */
$(function(){
			$("[name='checkboxFirst']").click(function(){		
			if($("[name='checkboxFirst']")[0].checked)
				{
				 for(var i=0;i<$("[name='checkbox']").length;++i)
					$("[name='checkbox']")[i].checked=true; 
				}
			else
				{
				 for(var i=0;i<$("[name='checkbox']").length;++i)
					$("[name='checkbox']")[i].checked=false; 
				}			
	});
});

</script>
</body>
</html>
	