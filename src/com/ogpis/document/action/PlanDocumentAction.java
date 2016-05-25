package com.ogpis.document.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.base.common.paging.IPageList;
import com.ogpis.base.common.paging.PageListUtil;
import com.ogpis.document.entity.PlanDocument;
import com.ogpis.document.service.PlanDocumentService;
import com.ogpis.plan.entity.NationalPlan;
import com.ogpis.plan.service.NationalPlanService;

@Controller
public class PlanDocumentAction {
	
	@Autowired
	PlanDocumentService planDocumentService;
	
	@Autowired
	NationalPlanService nationalPlanService;
	
	@SuppressWarnings("rawtypes")
	private ArrayList idList=new ArrayList();
	
	@RequestMapping(value = "/document/list")
	public String list(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<PlanDocument> planDocuments =planDocumentService
				.getPlanDocuments(pageNo, pageSize);
		model.addAttribute("planDocuments", planDocuments);	
		return "document/list";
	}
	
	@RequestMapping(value = "/document/trash")
	public String trash(HttpServletRequest request, ModelMap model) {
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<PlanDocument> documents =planDocumentService
				.getDeletedDocuments(pageNo, pageSize);
		model.addAttribute("documents", documents);	
		return "document/trash";
	}
	
	@RequestMapping(value = "/document/downloadDocument")
	public void downloadDocument(HttpServletResponse response, HttpServletRequest request, ModelMap model,String id) throws IOException {
	         PlanDocument planDocument = planDocumentService.findById(id);
	         //设置文件MIME类型  
	         response.setContentType("application/x-msdownload");
	         //设置编码方式
	         response.setCharacterEncoding("utf-8");
	         //设置Content-Disposition  
	         response.setHeader("Content-Disposition", "attachment;filename="+ new String(planDocument.getDocumentName().getBytes("GBK"), "ISO-8859-1")); 
	         
	         //读取目标文件，通过response将目标文件写到客户端  
	         //获取目标文件的绝对路径  
	         String fullFileName = request.getServletContext().getRealPath("/")+ planDocument.getDocumentAddress(); 
	         //System.out.println(fullFileName);  
	         //读取文件  
	         InputStream in = new FileInputStream(fullFileName);  
	         OutputStream out = response.getOutputStream();  
	           
	         //写文件  
	         int b;  
	         while((b=in.read())!= -1)  
	         {  
	            out.write(b);  
	         }  		           
	         in.close();  
	         out.close();  
	}
	
	@RequestMapping(value = "/document/deleteDocument")
	public String deleteDocument(HttpServletRequest request, ModelMap model,String id) {
		  PlanDocument planDocument = planDocumentService.findById(id);
		  planDocument.setFatherNational(null);
		  planDocument.setDeleted(true);
		  planDocumentService.update(planDocument);
		  return "redirect:list";
	}
	
	/*
	 * 这个是真正意义上的删除，删除记录并删除文件
	 */
	@RequestMapping(value = "/document/removeDocument")
	public String removeDocument(HttpServletRequest request, ModelMap model,String id) {
		  PlanDocument planDocument = planDocumentService.findById(id);
          File filePath = new File(request.getServletContext().getRealPath("/")+ planDocument.getDocumentAddress()); 
		  if(filePath.exists())
			  filePath.delete();
          planDocumentService.delete(id);
		  return "redirect:trash";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/document/deleteDocuments")
	public void deleteDocuments(HttpServletResponse resp,HttpServletRequest request, ModelMap model,String id) throws IOException {
		 String Ids = request.getParameter("Ids");
		 String idTemp;
		 idList.clear();
		 while(Ids.length()>1)
		 {
			 idTemp = Ids.substring(0,Ids.indexOf(","));
			 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
			 idList.add("\'"+idTemp+"\'");
		 }
		 planDocumentService.updateAll(idList);
		 String success = "{\"flag1\":\"success\"}";     
	     resp.setCharacterEncoding("utf-8");
		 resp.getWriter().write(success);
	}
	
	/*
	 * 清空回收站响应函数
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/document/removeDocuments")
	public void removeDocuments(HttpServletResponse resp,HttpServletRequest request, ModelMap model) throws IOException {
		 String Ids = request.getParameter("Ids");
		 String idTemp;
		 idList.clear();
		 while(Ids.length()>1)
		 {
			 idTemp = Ids.substring(0,Ids.indexOf(","));
			 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
			 idList.add("\'"+idTemp+"\'");
		 }
		 PlanDocument planDocument = null;
		 File filePath = null;
		 String temp = "";
		 //第一步删除对应id的文件
		for(int i=0;i<idList.size();i++)
		{
			temp = idList.get(i).toString();
			System.out.println(temp.substring(1,temp.length()));
			planDocument = planDocumentService.findById(temp.substring(1,temp.length()-1));
			filePath = new File(request.getServletContext().getRealPath("/")+ planDocument.getDocumentAddress()); 
			if(filePath.exists())
				  filePath.delete();
		}
		 //第二步删除数据库中记录
		 planDocumentService.removeAllDocument(idList);
		 String success = "{\"flag1\":\"success\"}";     
	     resp.setCharacterEncoding("utf-8");
		 resp.getWriter().write(success);
	}
	
	/*
	 * 文件打包
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/document/zipDocuments")
	public void zipDocuments(HttpServletResponse response,HttpServletRequest request, ModelMap model) throws IOException, ServletException
		{
		String Ids = request.getParameter("Ids");
		String idTemp;
		idList.clear();
		while(Ids.length()>1)
		 {
			 idTemp = Ids.substring(0,Ids.indexOf(","));
			 Ids = Ids.substring(Ids.indexOf(",")+1,Ids.length());
			 idList.add("\'"+idTemp+"\'");
		 }
		int fileNum = idList.size();
		String tmpFileName =System.currentTimeMillis()+".zip";
		System.out.println(tmpFileName);
		String FilePath = request.getServletContext().getRealPath("/");
		byte[] buffer = new byte[1024];
		String strZipPath = FilePath + tmpFileName;
		File[] files = new File[fileNum];
		PlanDocument planDocument = null;
		String temp = "";
		for(int i=0;i<idList.size();i++)
		{
			temp = idList.get(i).toString();
			planDocument = planDocumentService.findById(temp.substring(1,temp.length()-1));
			files[i] = new File(request.getServletContext().getRealPath("/")+ planDocument.getDocumentAddress()); 		
		}
		System.out.println("本次压缩几个文件"+files.length);
		try{
			ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipPath));
			for(int i=0;i<fileNum;i++)
			{
				FileInputStream fis = new FileInputStream(files[i]);
				out.putNextEntry(new ZipEntry(files[i].getName().substring(13, files[i].getName().length())));
				int len;
				while((len = fis.read(buffer))>0){
					out.write(buffer, 0, len);
				}
				out.closeEntry();
				fis.close();
			}
			out.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 String success = "{\"tmpFileName\":\""+tmpFileName+"\"}";  
		 response.setContentType("application/json");
	     response.setCharacterEncoding("utf-8");
		 response.getWriter().write(success);
	}
	

	@RequestMapping(value = "/document/downloadZip")
	public void downloadZip(HttpServletResponse response,HttpServletRequest request, ModelMap model,String zipFileName) throws IOException, ServletException
		{
		     response.setContentType("application/x-msdownload");
	         //设置编码方式
	         response.setCharacterEncoding("utf-8");
	         //设置Content-Disposition  
	         response.setHeader("Content-Disposition", "attachment;filename="+"download.zip");      
	         //读取目标文件，通过response将目标文件写到客户端  
	         //获取目标文件的绝对路径  
	         String fullFileName = request.getServletContext().getRealPath("/")+zipFileName;  
	         //读取文件  
	         InputStream in = new FileInputStream(fullFileName);  
	         OutputStream out = response.getOutputStream();             
	         //写文件  
	         int b;  
	         while((b=in.read())!= -1)  
	         {  
	            out.write(b);  
	         }  		           
	         in.close();  
	         out.close();
	         File fileTemp = new File(request.getServletContext().getRealPath("/")+ zipFileName);   		 
	         if(fileTemp.exists())
	        	 fileTemp.delete();
		}
	
	@RequestMapping(value = "/document/deleteZip")
	public void deleteZip(HttpServletResponse response,HttpServletRequest request, ModelMap model) throws IOException, ServletException
		{
		String zipFileName = request.getParameter("zipFileName");
		 File fileTemp = new File(request.getServletContext().getRealPath("/")+ zipFileName);   		 
         if(fileTemp.exists())
        	 fileTemp.delete();
		}
	
	@RequestMapping(value = "/document/findAllPlans")
	public void findAllPlans(HttpServletRequest request , HttpServletResponse response) throws IOException {
		List<NationalPlan> nationalPlans = nationalPlanService.getAllPlans();
		String result = "[";  
		for(NationalPlan temp:nationalPlans)
		{
			result+="{\"planName\":\""+temp.getPlanName()+"\",\"planId\":\""+temp.getId()+"\"},";
		}
		result = result.substring(0, result.length()-1);
		result+="]";
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(result);
	}
	
	@RequestMapping(value = "/document/queryDocument")
	public String queryDocument(HttpServletRequest request , HttpServletResponse response,ModelMap model,String inputValue,String selectValue,String selectCondition){
		
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = 6;
		IPageList<PlanDocument> planDocuments =planDocumentService
				.getDocumentsByPlan(selectCondition,inputValue,selectValue,pageNo, pageSize);
		model.addAttribute("planDocuments", planDocuments);	
		model.addAttribute("inputValue", inputValue);	
		model.addAttribute("selectCondition", selectCondition);	
		model.addAttribute("selectValue", selectValue);	
		
		return "document/list";
	}
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

