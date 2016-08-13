<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %> 
<%
	String basePath = request.getContextPath();
    String timeStamp = System.currentTimeMillis()+"";
%>
<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div id="navDiv" class="collapse navbar-collapse navbar-ex1-collapse" align="left">
    <ul class="nav navbar-nav side-nav pull-left">
         <li>
            <a href="<%=basePath%>/plan/list?type=All&&condition=" class="menu"><i class="glyphicon glyphicon-star"></i> 规划管理<i></i></a>
         </li>
         
          <li>
            <a href="#index" data-toggle="collapse" class="nav-header collapsed" ><i class="glyphicon glyphicon-list" ></i> 指标管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="index" class="nav nav-list secondmenu collapse" style="height:0px;" >
                <li>
            		<a href="<c:url value='/index/list?type=QG'/>" class="menu"><i class="glyphicon glyphicon-star"></i> 指标项管理<i></i></a>
         		</li> 
                <li>
                    <a href="<c:url value='/indexData/list?type=QG&id=0'/>" class="menu"><i class="glyphicon glyphicon-pencil"></i> 完成情况管理 </a>
                </li>
            </ul>
         </li>
         
           <li>
            <a href="#international" data-toggle="collapse" class="nav-header collapsed" ><i class="glyphicon glyphicon-plane" ></i> 国际公司<i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="international" class="nav nav-list secondmenu collapse" style="height:0px;" >
                <li>
            		<a href="<c:url value='/international/edit?companyName=bp'/>" class="menu"><i class="glyphicon glyphicon-star"></i> BP公司<i></i></a>
         		</li> 
                <li>
                    <a href="<c:url value='/international/edit?companyName=kp'/>" class="menu"><i class="glyphicon glyphicon-star"></i> 壳牌公司 </a>
                </li>
                <li>
            		<a href="<c:url value='/international/edit?companyName=xfl'/>" class="menu"><i class="glyphicon glyphicon-star"></i> 雪福龙</a>
         		</li>
         		<li>
            		<a href="<c:url value='/international/edit?companyName=dde'/>" class="menu"><i class="glyphicon glyphicon-star"></i> 道达尔<i></i></a>
         		</li>
         		<li>
            		<a href="<c:url value='/international/edit?companyName=amfks'/>" class="menu"><i class="glyphicon glyphicon-star"></i> 艾美浮克森<i></i></a>
         		</li>
            </ul>
         </li>
                 

          <li>
            <a href="#doc" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-folder-close"></i> 文档管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="doc" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<%=basePath%>/document/list?selectCondition=0" class="menu"><i class="glyphicon glyphicon-file"></i> 规划文档管理 </a>
                </li>

                <li>
                    <a href="<c:url value='/document/trash?'/>" class="menu"><i class="glyphicon glyphicon-trash"></i> 文档回收站 </a>
                </li>
            </ul>
        </li>
        
           <li>
            <a href="#sys" data-toggle="collapse" class="nav-header collapsed"><i class="glyphicon glyphicon-cog"></i> 系统管理 <i class="fa fa-fw fa-caret-down"></i></a>
            <ul id="sys" class="nav nav-list collapse secondmenu" style="height:0px;">
                <li>
                    <a href="<c:url value='/system/user/list?'/>" class="menu"><i class="glyphicon glyphicon-user"></i> 用户管理 </a>
                </li>

                 <li>
                    <a href="<c:url value='/system/role/list?'/>" class="menu"><i class="glyphicon glyphicon-lock"></i> 角色管理 </a>
                </li>            
            </ul>
        </li>
    </ul>
</div>
<script type="text/javascript">

	$(function() {
		//alert("${navUL}");
		var expandingMenus= "${menus}";
		var expandingMenusArray = expandingMenus.split(',')
		for (var i = 0; i < expandingMenusArray.length; i++) {
			expendMenu($("#"+expandingMenusArray[i]));
		}
		
		$(".menu").click(function(e){
			addParam(e.target);
		});
	});

	/**
	* 展开菜单
	*/
	function expendMenu($ul) {
		if ($ul.length) {
			$ul.addClass("in").css("height", "auto");
		}
	}

	
	/**
	 *为URL添加状态参数
	 */
	function addParam($a) {
		var url = $a.href + "";
		//alert(url);
		if (url.indexOf("#") == -1) {
			var $expandingMenus = $("ul .in");
			var appendURL = "&menus=";
			for (var i = 0; i < $expandingMenus.length; i++) {
				appendURL += $expandingMenus[i].id;
				if (i != $expandingMenus.length - 1) {
					appendURL += ",";
				}
				//alert($expendMenus[i].id);
				///$a.href+=$expendMenus[i].id;
			}
			$a.href = url + appendURL;
			//alert($a.href);
		}
	}
</script>