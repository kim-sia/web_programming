<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>  
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "signEduDB" class = "project.EduBeansDB" scope = "page"/>
<jsp:useBean id = "signStuDB" class = "project.StuBeansDB" scope = "page"/>

<%
String id = request.getParameter("ID");
String pw = request.getParameter("PW");

if(session.getAttribute("sessionID") != null){
	session.invalidate();
	out.println("<script>location.href = 'Main.jsp';</script>");
}
else{

if(signEduDB.Login(id, pw))
{
	session.setAttribute("sessionID", id);
	session.setAttribute("job", "Educator");
	session.setMaxInactiveInterval(60*60);
	//out.println(request.getSession().getAttribute("sessionID"));
	out.println("<script>alert('login success');</script>");
	out.println("<script>location.href = 'Main.jsp';</script>");
}
else if(signStuDB.Login(id, pw))
{
	session.setAttribute("sessionID", id);
	session.setAttribute("job", "Student");
	out.println("<script>alert('login success');</script>");
	out.println("<script>location.href = 'Main.jsp';</script>");
}
else{
	out.println("<script>alert('login fail');</script>");
	out.println("<script>location.href = 'Login.html';</script>");
}
}

%>
