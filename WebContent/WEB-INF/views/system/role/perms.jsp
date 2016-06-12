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
		  { id: 1, pId: 0, name: "father1", perm:"father1",open: true },
		  { id: 11, pId: 1, name: "father11" , perm:"father11"},
		  { id: 111, pId: 11, name: "child111", perm:"child111" },
		  { id: 112, pId: 11, name: "child112" , perm:"child112"},
		  { id: 113, pId: 11, name: "child113", perm:"child113" },
		  { id: 114, pId: 11, name: "child114" , perm:"child114"},
		  { id: 12, pId: 1, name: "father12", perm:"father12" },
		  { id: 121, pId: 12, name: "child121" , perm:"child121"},
		  { id: 122, pId: 12, name: "child122" , perm:"child122"},
		  { id: 123, pId: 12, name: "child123" , perm:"child123"},
		  { id: 124, pId: 12, name: "child124" , perm:"child124"},
		  { id: 13, pId: 1, name: "father13", perm: "father13",isParent: true },
		  { id: 2, pId: 0, name: "father2" , perm:"father2"},
		  { id: 21, pId: 2, name: "father21", perm:"father21"},
		  { id: 211, pId: 21, name: "child211" , perm:"child211"},
		  { id: 212, pId: 21, name: "child212" , perm:"child212"},
		  { id: 213, pId: 21, name: "child213" , perm:"child213"},
		  { id: 214, pId: 21, name: "child214" , perm:"child214"},
		  { id: 22, pId: 2, name: "father22" , perm:"father22"},
		  { id: 221, pId: 22, name: "child221" , perm:"child221"},
		  { id: 222, pId: 22, name: "child222" , perm:"child222"},
		  { id: 223, pId: 22, name: "child223" , perm:"child223"},
		  { id: 224, pId: 22, name: "child224" , perm:"child224"},
		  { id: 23, pId: 2, name: "father23" , perm:"father23"},
		  { id: 231, pId: 23, name: "child231" , perm:"child231"},
		  { id: 232, pId: 23, name: "child232" , perm:"child232"},
		  { id: 233, pId: 23, name: "child233" , perm:"child233"},
		  { id: 234, pId: 23, name: "child234" , perm:"child234"},
		  { id: 3, pId: 0, name: "father3", perm:"father3",isParent: true },
		  { id: 4, pId: 0, name: "添加用户", perm:"user:add",isParent: true }
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