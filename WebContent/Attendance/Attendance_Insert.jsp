<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
String cnum = request.getParameter("cnum"); 
String div = request.getParameter("division");
String[] check = request.getParameterValues("check");
int class_unique_number = Integer.parseInt(cnum);
int division = Integer.parseInt(div);
int check1 = 0;

//out.println(check.length);

int booll = 1;
%>
<jsp:useBean id = "attendanceBeansDB" class = "project.AttendanceBeansDB" scope = "page" />
<jsp:useBean id = "attendanceBeans" class = "project.AttendanceBeans" scope ="page"/>
<jsp:useBean id = "gradeBeansDB" class = "project.GradeBeansDB" scope = "page" />
<jsp:useBean id = "gradeBeans" class = "project.GradeBeans" scope ="page"/>
<% 
   for(int i = 0; i < check.length; i++)
   {
	   check1 = Integer.parseInt(check[i]);

      if(!attendanceBeansDB.updateAttendance(check1, class_unique_number, division))
      {
         //out.println("<script>alert('attendance fail');</script>");
         booll = 0;
      }
      if(!gradeBeansDB.updateAttendance(check1, class_unique_number, division)){
    	  booll = 0;
      }
   }
%>
<!DOCTYPE html>
<html>
<script>
if(<%=booll%> == 1)
{
	alert('success');
	location.href='Attendance_List.jsp?cnum=<%=class_unique_number%>&division=<%=division%>';
}
else
{
	alert('fail');	
}
</script>
</html>