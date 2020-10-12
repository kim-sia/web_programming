<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
String uploadPath = request.getRealPath("/project_test/assignmentFile2");
out.print("realPath" + uploadPath);
int size = 5 * 1024 * 1024;
String id = "";
String name = "";
String class_num = "";
String division = "";
String number = "";
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
         id = multi.getParameter("id");
         name = multi.getParameter("name");
         class_num = multi.getParameter("class_num");
         division = multi.getParameter("division");
         number = multi.getParameter("number");
         
         Enumeration files = multi.getFileNames();
         
         String file = (String)files.nextElement();
         fileName = multi.getFilesystemName(file);
         originalName = multi.getOriginalFileName(file);
} catch(Exception e) {
   //out.print(e.getMessage());
   System.out.print("파일 업로드 문제 발생 : " + e.getMessage());
}

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset=EUC-KR">
</head>
<body>
<form name = fileCheck action = "Assignment_Submit_Check.jsp" method = "post">
<input type = "hidden" value = "<%=id %>" name = "id">
<input type = "hidden" value = "<%=name %>" name = "name">
<input type = "hidden" value = "<%=class_num %>" name = "class_num">
<input type = "hidden" value = "<%=division %>" name = "division">
<input type = "hidden" value = "<%=number %>" name = "number">
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
%>