<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="project.EduBeans" %>
<jsp:useBean id ="eduDB" class = "project.EduBeansDB" scope = "page"/>
<%
String uploadPath = request.getRealPath("/project_test/assignmentFile1");
out.print("realPath" + uploadPath);
int size = 5 * 1024 * 1024;
String id = "";
String number = "";
String class_num = "";
String division = "";
String title = "";
String content = "";
String deadline = "";
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
			class_num = multi.getParameter("class_num");
			division = multi.getParameter("division");
			number = multi.getParameter("assignment_number");
			id = multi.getParameter("id");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			deadline = multi.getParameter("deadline");
			
			Enumeration files = multi.getFileNames();
			
			String file = (String)files.nextElement();
			fileName = multi.getFilesystemName(file);
			originalName = multi.getOriginalFileName(file);
} catch(Exception e) {
	//out.print(e.getMessage());
	System.out.print("파일 업로드 문제 발생 : " + e.getMessage());
}


String name = eduDB.getName(id);

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charser=EUC-KR">
</head>
<body>
<form name = fileCheck action = "Assignment_Write_Check.jsp" method = "post">
<input type = "hidden" value = "<%=class_num %>" name = "cnum">
<input type = "hidden" value = "<%=division %>" name = "division">
<input type = "hidden" value = "<%=number %>" name = "number">
<input type = "hidden" value = "<%=name %>" name = "name">
<input type = "hidden" value = "<%=title %>" name = "title">
<input type = "hidden" value = "<%=content %>" name = "content">
<input type = "hidden" value = "<%=deadline %>" name = "deadline">
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
