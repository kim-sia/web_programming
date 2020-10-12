<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "java.io.FileInputStream" %>
<%@ page import = "java.io.File" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String fileName = request.getParameter("file_name");
	String savePath = "project_test/noticeFile";
	ServletContext context = getServletContext();
	
	String sDownPath = context.getRealPath(savePath);
	System.out.print("다운로드 위치" + sDownPath);
	String sFilePath = sDownPath + "/" + fileName;
	out.println(sFilePath);

	File oFile = new File(sFilePath);
	
	byte[] b = new byte[10*1024*1024];
	
	FileInputStream in = new FileInputStream(oFile);
	
	String sMimeType = getServletContext().getMimeType(sFilePath);
	
	System.out.print("유형" + sMimeType);
	
	if(sMimeType==null){
		sMimeType = "application.octec-stream";
	}
	
	response.setContentType(sMimeType);
	
	String A = new String(fileName.getBytes("euc-kr"), "8859_1");
	String B = "utf-8";
	String sEncoding = URLEncoder.encode(A, B);
	
	String AA = "Content-Disposition";
	String BB = "attachment; filename ="+sEncoding;
	response.setHeader(AA, BB);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead = 0;
	
	while((numRead = in.read(b,0,b.length))!= -1){
		out2.write(b,0,numRead);
	}
	out2.flush();
	out2.close();
	in.close();
%>