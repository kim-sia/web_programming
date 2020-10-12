<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "notice" class = "project.NoticeBeans" scope ="page"/>
<jsp:useBean id = "noticeDB" class = "project.NoticeBeansDB" scope = "page"/>

<%
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String fileName = request.getParameter("fileName");
	String originalName = request.getParameter("originalName");
	
	//out.println(id);
	//out.println(title);
	//out.println(content);
	//out.println(fileName);
	//out.println(originalName);
%>
<jsp:setProperty property = "name" name = "notice" value = "<%=name %>"/>
<jsp:setProperty property = "title" name = "notice" value = "<%=title %>" />
<jsp:setProperty property = "content" name = "notice" value = "<%=content %>" />
<jsp:setProperty property = "fileName" name = "notice" value = "<%=fileName %>" />
<jsp:setProperty property = "originalName" name = "notice" value = "<%=originalName %>"/>

<%
if(noticeDB.insertDB(notice)){
	out.println("<script>alert('success');</script>");
	out.println("<script>location.href = 'Notice.jsp';</script>");
}
%>