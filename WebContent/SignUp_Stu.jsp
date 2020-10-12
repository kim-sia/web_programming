<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "signStu" class = "project.StuBeans" scope ="page"/>
<jsp:useBean id = "signStuDB" class = "project.StuBeansDB" scope = "page"/>

<%
String university = request.getParameter("university");
String department = request.getParameter("department");
String studentId = request.getParameter("stu_id");
String grade = request.getParameter("grade");
String name = request.getParameter("stu_name");
String password = request.getParameter("stu_pwd");
String email = request.getParameter("stu_email");
String phone = request.getParameter("stu_phone");


%>

<jsp:setProperty property="university" name="signStu"/>
<jsp:setProperty property="department" name="signStu"/>
<jsp:setProperty property="studentID" name="signStu" value = "<%= studentId %>"/>
<jsp:setProperty property="grade" name="signStu" />
<jsp:setProperty property="name" name="signStu" value = "<%= name %>"/>
<jsp:setProperty property="password" name="signStu" value = "<%= password %>"/>
<jsp:setProperty property="email" name="signStu" value = "<%= email %>"/>
<jsp:setProperty property="phone" name="signStu" value = "<%= phone %>"/>

<% 
	String idCheck = request.getParameter("id");
	if(signStuDB.checkID(idCheck)){
		out.println("0");
	}else{
		out.println("1");
	}
	
	if(signStuDB.insertDB(signStu))
	{
		out.println("<script>alert('sign up success');</script>");
		out.println("<script>location.href = 'Main.jsp';</script>");
		//response.sendRedirect("Main.html");
	}
%>
