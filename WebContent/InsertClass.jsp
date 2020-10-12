<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "stuClass" class = "project.StuClassBeans" scope ="page"/>
<jsp:useBean id = "stuClassDB" class = "project.StuClassBeansDB" scope = "page"/>

<jsp:useBean id = "eduClass" class = "project.EduClassBeans" scope ="page"/>
<jsp:useBean id = "eduClassDB" class = "project.EduClassBeansDB" scope = "page"/>

<jsp:useBean id = "studentDB" class = "project.StuBeansDB" scope = "page"/>

<jsp:useBean id = "attendance" class = "project.AttendanceBeans" scope = "page" />
<jsp:useBean id = "attendanceDB" class = "project.AttendanceBeansDB" scope = "page" />

<jsp:useBean id = "grade" class = "project.GradeBeans" scope = "page"/>
<jsp:useBean id = "gradeDB" class = "project.GradeBeansDB" scope = "page"/>

<%
String[] unique = request.getParameterValues("unique");
String[] division = request.getParameterValues("division");
String id = (String)session.getAttribute("sessionID");
String job = (String)session.getAttribute("job");
String name = "";
int grade1 = 0;

int unique2 = 0;
int division2 = 0;
//out.println(job);
if("Student".equals(job))
{
	name = studentDB.getName(id);
	grade1 = studentDB.getGrade(id);
	int idid = Integer.parseInt(id);
	for(int i = 0; i < unique.length; i++)
	{
		unique2 = Integer.parseInt(unique[i]);
		division2 = Integer.parseInt(division[i]);
	%>
		<jsp:setProperty property="studentID" name = "stuClass" value="<%= id %>"/>
		<jsp:setProperty property="class_unique_number" name = "stuClass" value = "<%= unique2 %>" />
	    <jsp:setProperty property="division" name = "stuClass" value = "<%= division2 %>"/>
	    <jsp:setProperty property="studentID" name = "attendance" value="<%= idid %>"/>
	    <jsp:setProperty property="name" name = "attendance" value = "<%= name %>" />
	    <jsp:setProperty property="class_unique_number" name = "attendance" value = "<%= unique2 %>"/>
	    <jsp:setProperty property="division" name = "attendance" value = "<%= division2 %>"/>
	    <jsp:setProperty property="studentID" name="grade" value = "<%= idid %>"/>
	    <jsp:setProperty property="name" name = "grade" value = "<%= name %>" />
	    <jsp:setProperty property="grade" name = "grade" value = "<%= grade1 %>"/>
	    <jsp:setProperty property="class_unique_number" name = "grade" value = "<%= unique2 %>"/>
	    <jsp:setProperty property="division" name = "grade" value = "<%= division2 %>"/>
	<%
		if(!attendanceDB.insertInfo(attendance)){
			//out.println("<script>alert('attendance fail');</script>");
		}
		if(!gradeDB.insertInfo(grade)){
			//out.println("<script>alert('grade fail');</script>");
		}
		
		if(!stuClassDB.insertDB(stuClass)){
			out.println("<script>alert('duplicate access');</script>");
			out.println("<script>location.href = 'Mypage.jsp';</script>");
		}
	}
	out.println("<script>alert('success');</script>");
	out.println("<script>location.href = 'Mypage.jsp';</script>");
}
else if("Educator".equals(job)){
	//out.println(unique.length);
	for(int i = 0; i < unique.length; i++)
	{
		unique2 = Integer.parseInt(unique[i]);
		division2 = Integer.parseInt(division[i]);
		
		//out.println(unique2);
		//out.println(division2);
	%>
		<jsp:setProperty property="id" name = "eduClass" value="<%= id %>"/>
		<jsp:setProperty property="class_unique_number" name = "eduClass" value = "<%= unique2 %>" />
	    <jsp:setProperty property="division" name = "eduClass" value = "<%= division2 %>"/>
	<%
		if(!eduClassDB.insertDB(eduClass)){
			out.println("<script>alert('duplicate access');</script>");
			out.println("<script>location.href = 'Mypage.jsp';</script>");
		}
	}
	out.println("<script>alert('success');</script>");
	out.println("<script>location.href = 'Mypage.jsp';</script>");
}
%>
<script>
console.log("<%=(String)session.getAttribute("sessionID")%>");
console.log("<%=job%>");
console.log("<%=name%>");
console.log(<%=grade1%>);
</script>