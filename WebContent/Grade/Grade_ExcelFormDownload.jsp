<%@ page language="java" contentType="application/vnd.ms-excel; name='excel', text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>

<%
String file_name = "excel_download";
String ExcelName = new String(file_name.getBytes(),"utf-8")+".xls";
response.setContentType("application/vnd.ms-excel");
response.setHeader("Content-Disposition", "attachment; filename="+ExcelName);
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Pragma", "no-cache");

String table = request.getParameter("excel_table");
%>
<html>
<head>
<meta http-equiv='Content-Type' content='application/vnd.ms-excel; charset=utf-8'>
</head>
<body>
<Table>
<%=table%>
</Table>
</body>
</html>