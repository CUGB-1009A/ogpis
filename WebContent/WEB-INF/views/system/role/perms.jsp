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
		  { id: 1, pId: 0, name: "首页", perm:"mainPage:link", open:true},
		  
		  { id: 2, pId: 0, name: "全国规划" , perm:"nationalPlan:list"},
		  { id: 21, pId: 2, name: "规划查询", perm:"national:fuzzyQuery"},
		  { id: 22, pId: 2, name: "添加规划" , perm:"national:add"},
		  { id: 23, pId: 2, name: "批量删除规划" , perm:"national:deleteBatch"},
		  { id: 24, pId: 2, name: "编辑规划" , perm:"national:toEditPage"},
		  { id: 25, pId: 2, name: "删除规划" , perm:"national:delete"},
		  
		  { id: 3, pId: 0, name: "公司规划", perm:"companyPlan",isParent: true },
		  { id: 31, pId: 3, name: "中石化规划", perm:"zshPlan:list"},
		  { id: 32, pId: 3, name: "中石油规划", perm:"zsyPlan:list"},
		  { id: 33, pId: 3, name: "中联煤规划", perm:"zlmPlan:list"},
		  { id: 34, pId: 3, name: "中海油规划", perm:"zhyPlan:list"},
		  { id: 35, pId: 3, name: "延长规划", perm:"ycPlan:list"},
		  
		  { id: 4, pId: 0, name: "文档管理", perm:"documentManagement",isParent: true },
		  { id: 41, pId: 4, name: "规划文档管理", perm:"document:list"},
		  { id: 411, pId: 41, name: "文档查询", perm:"document:query"},
		  { id: 412, pId: 41, name: "文档打包下载", perm:"document:zipDocuments"},
		  { id: 413, pId: 41, name: "文档批量删除", perm:"document:deleteDocuments"},
		  { id: 414, pId: 41, name: "文档在线预览", perm:"document:previewOnline"},
		  { id: 415, pId: 41, name: "单个文档下载", perm:"document:downloadDocument"},
		  { id: 416, pId: 41, name: "单个文档删除", perm:"document:deleteDocument"},
		  
		  
		  { id: 42, pId: 4, name: "文档回收站", perm:"document:trash"},
		  { id: 421, pId: 42, name: "文档查询", perm:"document:trashQuery"},
		  { id: 422, pId: 42, name: "文档打包下载", perm:"document:zipTrashDocuments"},
		  { id: 423, pId: 42, name: "清空回收站", perm:"document:removeDocuments"},
		  { id: 424, pId: 42, name: "文档在线预览", perm:"document:previewTrashOnline"},
		  { id: 425, pId: 42, name: "单个文档下载", perm:"document:downloadTrashDocument"},
		  { id: 426, pId: 42, name: "彻底删除", perm:"document:removeDocument"},
		  
		  { id: 5, pId: 0, name: "系统管理", perm:"systemManagement",isParent: true },
		  { id: 51, pId: 5, name: "用户管理", perm:"user:list"},
		  { id: 511, pId: 51, name: "添加用户", perm:"user:add"},
		  { id: 512, pId: 51, name: "编辑用户", perm:"user:edit"},
		  { id: 513, pId: 51, name: "查看用户", perm:"user:view"},
		  { id: 514, pId: 51, name: "删除用户", perm:"user:delete"},
		  { id: 52, pId: 5, name: "角色管理", perm:"role:list"},
		  { id: 521, pId: 52, name: "添加角色", perm:"role:add"},
		  { id: 522, pId: 52, name: "编辑角色", perm:"role:edit"},
		  { id: 523, pId: 52, name: "删除角色", perm:"role:delete"},
		  
		];
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