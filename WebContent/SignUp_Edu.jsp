<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "signEdu" class = "project.EduBeans" scope ="page"/>
<jsp:useBean id = "signEduDB" class = "project.EduBeansDB" scope = "page"/>

<%
String university = request.getParameter("university");
String department = request.getParameter("department");
String name = request.getParameter("edu_name");
String id = request.getParameter("edu_id");
String password = request.getParameter("edu_pwd");
String email = request.getParameter("edu_email");
String phone = request.getParameter("edu_phone");

%>

<jsp:setProperty property="university" name="signEdu"/>
<jsp:setProperty property="department" name="signEdu"/>
<jsp:setProperty property="name" name="signEdu" value = "<%= name %>"/>
<jsp:setProperty property="id" name="signEdu" value = "<%= id %>"/>
<jsp:setProperty property="password" name="signEdu" value = "<%= password %>"/>
<jsp:setProperty property="email" name="signEdu" value = "<%= email %>"/>
<jsp:setProperty property="phone" name="signEdu" value = "<%= phone %>"/>

<% 
String idCheck = request.getParameter("id");
if(signEduDB.checkID(idCheck)){
	out.println("0");
}else{
	out.println("1");
}

if(signEduDB.insertDB(signEdu))
{
	out.println("<script>alert('sign up success');</script>");
	out.println("<script>location.href = 'Main.jsp';</script>");
	//response.sendRedirect("Main.html");
}
%>
