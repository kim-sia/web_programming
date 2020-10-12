<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="project.EduBeans" %>
<jsp:useBean id ="stuDB" class = "project.StuBeansDB" scope = "page"/>
<%
String uploadPath = request.getRealPath("/project_test/boardFile");
out.print("realPath" + uploadPath);
int size = 5 * 1024 * 1024;
String id = "";
String title = "";
String content = "";
String password = "";
String fileName = ""; 
String originalName = "";

MultipartRequest multi = null;

try{
	multi = new MultipartRequest(
			request,
			uploadPath,
			size,
			"euc-kr",
			new DefaultFileRenamePolicy()
			);
			
			id = multi.getParameter("sessionID");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			password = multi.getParameter("board_password");
			
			Enumeration files = multi.getFileNames();
			
			String file = (String)files.nextElement();
			fileName = multi.getFilesystemName(file);
			originalName = multi.getOriginalFileName(file);
} catch(Exception e) {
	//out.print(e.getMessage());
	System.out.print("파일 업로드 문제 발생 : " + e.getMessage());
}

//out.println(id);
//out.println(title);
//out.println(content);
//out.println(password);
//out.println(fileName);
//out.println(originalName);
String name = stuDB.getName(id);
//out.println(name);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charsert=EUC-KR">
</head>
<body>
<form name = fileCheck action = "Board_Write_Check.jsp" method = "post">
<input type = "hidden" value = "<%=name %>" name = "name">
<input type = "hidden" value = "<%=title %>" name = "title">
<input type = "hidden" value = "<%=content %>" name = "content">
<input type = "hidden" value = "<%=password %>" name = "password">
<input type = "hidden" value = "<%=fileName %>" name = "fileName">
<input type = "hidden" value = "<%=originalName %>" name = "originalName">
</form>
<script>
window.onload = function(){
	javascript:fileCheck.submit();
}
</script>
</body>
</html>
