<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "submit" class = "project.SubmitBeans" scope ="page"/>
<jsp:useBean id = "submitDB" class = "project.SubmitBeansDB" scope = "page"/>
<%
	String class_number1 = request.getParameter("class_num");
	String division1 = request.getParameter("division");
	String number1 = request.getParameter("number");
	String id1 = request.getParameter("id");
	String name = request.getParameter("name");
	String fileName = request.getParameter("fileName");
	String originalName = request.getParameter("originalName");

	int class_number = Integer.parseInt(class_number1);
	int division = Integer.parseInt(division1);
	int number = Integer.parseInt(number1);
	int id = Integer.parseInt(id1);
	
%>
<jsp:setProperty property="class_unique_number" name="submit" value = "<%=class_number %>"/>
<jsp:setProperty property="division" name="submit" value = "<%=division %>"/>
<jsp:setProperty property="number" name="submit" value = "<%=number %>"/>
<jsp:setProperty property="studentID" name="submit" value = "<%=id%>"/>
<jsp:setProperty property = "name" name = "submit" value = "<%=name %>"/>
<jsp:setProperty property = "fileName" name = "submit" value = "<%=fileName %>" />
<jsp:setProperty property = "originalName" name = "submit" value = "<%=originalName %>"/>

<%
if(submitDB.insertDB(submit)){
   out.println("<script>alert('success');</script>");
   out.println("<script>location.href = 'Assignment.jsp';</script>");
}
%>