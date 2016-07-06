<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.text.*,java.util.*,javax.servlet.*,javax.servlet.http.*,DBstep.iMsgServer2000.*" %>

<head>
<title>文档预览</title>
<%
  String mStatus=null;
  String mFileName=null;
  String mHTMLPath="";

  String mDisabled="";
  String mWord="";
  String mExcel="";

  String mHttpUrlName=request.getRequestURI();
  String mScriptName=request.getServletPath();
  String mServerName="OfficeServer.jsp";
  String mClientName="iWebOffice2003.ocx#version=8,8,6,2";

  String mServerUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/"+mServerName;
  String mClientUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/"+"assets/ocx/"+mClientName;
  String mHttpUrl="http://"+request.getServerName()+":"+request.getServerPort()+mHttpUrlName.substring(0,mHttpUrlName.lastIndexOf(mScriptName))+"/";
  System.out.println(mServerUrl);
  System.out.println(mClientUrl);
  System.out.println(mHttpUrl);
  String mRecordID= request.getAttribute("filePath").toString(); 

  String mTemplate="";
  String mFileType=mRecordID.substring(mRecordID.indexOf("."),mRecordID.length());
  
  String mEditType=request.getAttribute("editType").toString(); 
  
  String mUserName="油气战略中心";
  System.out.println(mEditType);
  System.out.println(mFileType);
  if (mEditType.compareTo("0")==0)
  {
     mDisabled="disabled";
  }
  else
  {
     mDisabled="";
  }

  //取得类型
  if (mFileType==null)
  {
    mFileType=".doc";	// 默认为.doc文档
  }

  if (mFileType.compareTo(".doc")==0){
     mWord="";
     mExcel="disabled";
  }
  else 
  {
     mWord="disabled";
     mExcel="";
  }
  mFileName=mRecordID;
  System.out.println(mFileName);
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/wordPreview.css">
<script type="text/javascript">

//作用：显示操作状态
function StatusMsg(mString){
  StatusBar.innerText=mString;
}

//作用：载入iWebOffice
function Load(){
  try{	
	webform.WebOffice.WebUrl="<%=mServerUrl%>";
    webform.WebOffice.RecordID="<%=mRecordID%>";
    webform.WebOffice.Template="<%=mTemplate%>";
    webform.WebOffice.FileName="<%=mFileName%>";
    webform.WebOffice.FileType="<%=mFileType%>";
    webform.WebOffice.EditType="<%=mEditType%>";
    webform.WebOffice.UserName="<%=mUserName%>";
    webform.WebOffice.MaxFileSize = 4 * 1024;           
    webform.WebOffice.Language="CH"; 
    webform.WebOffice.WebRepairMode = true;
    webform.WebOffice.WebOpen(false)                       //打开该文档
    StatusMsg(webform.WebOffice.Status);
  }catch(e){
    alert(e.description);
  } 
}
</script>
</head>
<html>
<body bgcolor="#ffffff" onload="Load()">
	<form name="webform" method="post">
	<table style="width:100%;height:100%" >
        <tr>
          <td>     
            <object id="WebOffice" width="100%" height="100%" classid="clsid:23739A7E-5741-4D1C-88D5-D50B18F7C347" 
            	codebase="<%=request.getContextPath()%>/assets/ocx/iWebOffice2003.ocx#version=8,8,6,2">
                  
            </object>
          </td>
        </tr>
        <tr>
          <td height='20'>
                <div id=StatusBar>状态栏</div>
          </td>
        </tr>
</table>
</form>
</body>
</html>
