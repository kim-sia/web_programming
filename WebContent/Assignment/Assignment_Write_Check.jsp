<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "assignment" class = "project.AssignmentBeans" scope ="page"/>
<jsp:useBean id = "assignmentDB" class = "project.AssignmentBeansDB" scope = "page"/>
<%
	String class_number1 = request.getParameter("cnum");
	String division1 = request.getParameter("division");
	String number1 = request.getParameter("number");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String deadline1 = request.getParameter("deadline");
	String fileName = request.getParameter("fileName");
	String originalName = request.getParameter("originalName");
	
	int class_number = Integer.parseInt(class_number1);
	int division = Integer.parseInt(division1);
	int number = Integer.parseInt(number1);
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	Date deadline = df.parse(deadline1);
	
%>
<jsp:setProperty property="class_unique_number" name="assignment" value = "<%=class_number %>"/>
<jsp:setProperty property="division" name="assignment" value = "<%=division %>"/>
<jsp:setProperty property="number" name="assignment" value = "<%=number %>"/>
<jsp:setProperty property = "name" name = "assignment" value = "<%=name %>"/>
<jsp:setProperty property = "title" name = "assignment" value = "<%=title %>" />
<jsp:setProperty property = "content" name = "assignment" value = "<%=content %>" />
<jsp:setProperty property = "deadline" name = "assignment" value = "<%=deadline %>" />
<jsp:setProperty property = "fileName" name = "assignment" value = "<%=fileName %>" />
<jsp:setProperty property = "originalName" name = "assignment" value = "<%=originalName %>"/>

<%
if(assignmentDB.insertDB(assignment)){
   out.println("<script>alert('success');</script>");
   out.println("<script>location.href = 'Assignment.jsp';</script>");
}
%>