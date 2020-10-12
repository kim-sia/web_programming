<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "board" class = "project.BoardBeans" scope ="page"/>
<jsp:useBean id = "boardDB" class = "project.BoardBeansDB" scope = "page"/>

<%
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	String fileName = request.getParameter("fileName");
	String originalName = request.getParameter("originalName");
	
	//out.println(id);
	//out.println(title);
	//out.println(content);
	//out.println(fileName);
	//out.println(originalName);
%>
<jsp:setProperty property = "name" name = "board" value = "<%=name %>"/>
<jsp:setProperty property = "title" name = "board" value = "<%=title %>" />
<jsp:setProperty property = "content" name = "board" value = "<%=content %>" />
<jsp:setProperty property = "password" name = "board" value = "<%=password%>"/>
<jsp:setProperty property = "fileName" name = "board" value = "<%=fileName %>" />
<jsp:setProperty property = "originalName" name = "board" value = "<%=originalName %>"/>

<%
if(boardDB.insertDB(board)){
	out.println("<script>alert('success');</script>");
	out.println("<script>location.href = 'Board.jsp';</script>");
}
%>