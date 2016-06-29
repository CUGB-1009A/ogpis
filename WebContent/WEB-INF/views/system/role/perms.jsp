<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	permsTree=$.fn.zTree.init($("#treeDemo"), setting, zNodes);
});


var setting = {
		  view: {
// 		    addHoverDom: addHoverDom,
// 		    removeHoverDom: removeHoverDom,
		    selectedMulti: true
		  },
		  check: {
		    enable: true
		  },
		  data: {
		    simpleData: {
		      enable: true
		    }
		  },
		  edit: {
		    enable: false
		  }
		};
		
		var zNodes = [
						{ id: 1, pId: 0, name: "文档管理", perm:"document:management"},
						{ id: 2, pId: 0, name: "系统管理", perm:"system:management"},
						{ id: 3, pId: 0, name: "添加规划", perm:"plan:add"},
						{ id: 4, pId: 0, name: "删除规划", perm:"plan:delete"},
						{ id: 5, pId: 0, name: "发布规划", perm:"plan:release"},
						{ id: 6, pId: 0, name: "编辑规划", perm:"plan:edit"},
		              ];
		 
		/* var zNodes = [
		  { id: 1, pId: 0, name: "我的首页", perm:"mainPage:link"},		  
		  { id: 2, pId: 0, name: "全国规划" , perm:"national:list"},
		  { id: 21, pId: 2, name: "规划查询", perm:"national:fuzzyQuery"},
		  { id: 22, pId: 2, name: "添加规划" , perm:"national:add"},
		  { id: 23, pId: 2, name: "批量删除规划" , perm:"national:deleteBatch"},
		  { id: 24, pId: 2, name: "编辑规划" , perm:"national:toEditPage"},
		  { id: 25, pId: 2, name: "删除规划" , perm:"national:delete"},
		  
		  { id: 3, pId: 0, name: "中石化规划", perm:"zshPlan:list"},
		  { id: 4, pId: 0, name: "中石油规划", perm:"zsyPlan:list"},
		  { id: 5, pId: 0, name: "中联煤规划", perm:"zlmPlan:list"},
		  { id: 6, pId: 0, name: "中海油规划", perm:"zhyPlan:list"},
		  { id: 7, pId: 0, name: "延长规划", perm:"ycPlan:list"},
		  { id: 8, pId: 0, name: "其它规划", perm:"qtPlan:list"},
		  
		  
		  { id: 9, pId: 0, name: "文档管理", perm:"documentManagement",isParent: true },
		  
		  { id: 91, pId: 9, name: "规划文档管理", perm:"document:list"},
		  { id: 911, pId: 91, name: "文档查询", perm:"document:query"},
		  { id: 912, pId: 91, name: "文档打包下载", perm:"document:zipDocuments"},
		  { id: 913, pId: 91, name: "文档批量删除", perm:"document:deleteDocuments"},
		  { id: 914, pId: 91, name: "文档在线预览", perm:"document:previewOnline"},
		  { id: 915, pId: 91, name: "单个文档下载", perm:"document:downloadDocument"},
		  { id: 916, pId: 91, name: "单个文档删除", perm:"document:deleteDocument"},
 
		  { id: 92, pId: 9, name: "文档回收站", perm:"document:trash"},
		  { id: 921, pId: 92, name: "文档查询", perm:"document:trashQuery"},
		  { id: 922, pId: 92, name: "文档打包下载", perm:"document:zipTrashDocuments"},
		  { id: 923, pId: 92, name: "清空回收站", perm:"document:removeDocuments"},
		  { id: 924, pId: 92, name: "文档在线预览", perm:"document:previewTrashOnline"},
		  { id: 925, pId: 92, name: "单个文档下载", perm:"document:downloadTrashDocument"},
		  { id: 926, pId: 92, name: "彻底删除", perm:"document:removeDocument"},
		  
		  { id: 10, pId: 0, name: "系统管理", perm:"systemManagement",isParent: true },
		  
		  { id: 101, pId: 10, name: "用户管理", perm:"user:list"},
		  { id: 1011, pId: 101, name: "添加用户", perm:"user:add"},
		  { id: 1012, pId: 101, name: "编辑用户", perm:"user:edit"},
		  { id: 1013, pId: 101, name: "查看用户", perm:"user:view"},
		  { id: 1014, pId: 101, name: "删除用户", perm:"user:delete"},
		  
		  { id: 102, pId: 10, name: "角色管理", perm:"role:list"},
		  { id: 1021, pId: 102, name: "添加角色", perm:"role:add"},
		  { id: 1022, pId: 102, name: "编辑角色", perm:"role:edit"},
		  { id: 1023, pId: 102, name: "删除角色", perm:"role:delete"},
		  
		]; */
	function addHoverDom(treeId, treeNode) {
		  var sObj = $("#" + treeNode.tId + "_span");
		  if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
		  var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
		    + "' title='add node' onfocus='this.blur();'></span>";
		  sObj.after(addStr);
		  var btn = $("#addBtn_" + treeNode.tId);
		  if (btn) btn.bind("click", function () {
		    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		    alert(treeId);
		    alert(treeNode);
		    zTree.addNodes(treeNode, { id: (100 + newCount), pId: treeNode.id, name: "new node" + (newCount++) });
		    return false;
		  });
	};
	function removeHoverDom(treeId, treeNode) {
		  $("#addBtn_" + treeNode.tId).unbind().remove();
	};

	
	function submitNodes(){
		var nodes = permsTree.getCheckedNodes(true);
		var str = "";
		var perms = "";
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].name!=null){
			    str += nodes[i].id+ ",";
			    perms += nodes[i].name+ ",";
			}
		}
		if(perms.length>0) {
			perms = perms.substring(0,perms.length-1);
		}
		alert("d"+perms);
		$("#perms").val(perms);
	}

</script>
<div id="menuContent" class="col-sm-5 menuContent" style="border:1px solid rgb(170,170,170);z-index:10;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:100%; height:auto;"></ul>
</div>