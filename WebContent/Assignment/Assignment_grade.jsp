<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id = "grade" class = "project.GradeBeans" scope = "page"/>
<jsp:useBean id = "gradeDB" class = "project.GradeBeansDB" scope = "page" />
<%
String studentID = request.getParameter("sID");
String cnum = request.getParameter("cnum");
String division1 = request.getParameter("division");
String number = request.getParameter("number");
String asmt = request.getParameter("grade");

int sID = Integer.parseInt(studentID);
int class_unique_number = Integer.parseInt(cnum);
int division = Integer.parseInt(division1);
int index = Integer.parseInt(number);
int assignment = Integer.parseInt(asmt);
//out.println(studentID);
//out.println(cnum);
//out.println(division1);
//out.println(grade);
%>

<jsp:setProperty property = "studentID" name = "grade" value = "<%= sID%>"/>
<jsp:setProperty property = "class_unique_number" name = "grade" value = "<%=class_unique_number %>"/>
<jsp:setProperty property = "division" name = "grade" value = "<%=division %>"/>
<%
if(index == 1)
{%>
<jsp:setProperty property = "assignment1" name = "grade" value = "<%=assignment %>"/>
<%
if(gradeDB.updateAssignment1(grade)){
	out.println("<script>alert('success');</script>");
	out.println("<script>history.back();</script>");
	}
}
else if(index == 2){%>
<jsp:setProperty property = "assignment2" name = "grade" value = "<%=assignment%>"/>
<%
if(gradeDB.updateAssignment2(grade)){
	out.println("<script>alert('success');</script>");
	out.println("<script>history.back();</script>");
	}
}%>



