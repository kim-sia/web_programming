<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Attendance</title>
    <style>
        @import "all.css";
        table{
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            margin-bottom: 30px;
        }
        th,td{
            width: 100px;
            height: 30px;
            border-bottom: 1px solid #92A8D1;
        }
        input[type=submit]{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #92A8D1;
            color: #ffffff;
            width: 60px;
            height: 30px;
            border-radius: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <%@ page import="java.util.ArrayList, project.AttendanceBeans" %>
	<jsp:useBean id = "attendanceBeansDB" class = "project.AttendanceBeansDB" scope = "page" />
	<jsp:useBean id = "attendanceBeans" class = "project.AttendanceBeans" scope ="page"/>
	<jsp:useBean id = "classBeansDB" class = "project.ClassBeansDB" scope = "page" />
	<jsp:useBean id = "classBeans" class = "project.ClassBeans" scope = "page" />	
<div id = sidebar>
    <div class="home">
        <input type="button" value="&#xf015" id="home" onclick="location.href='Main.jsp'"><br>
        <div class="side">
            <ul>
                <li><a href="Attendance.jsp" style="text-shadow: 2px 2px #cccccc">Attendance</a></li>
                <li><a href="Assignment.jsp">Assignment</a> </li>
                <li><a href="Grade.jsp" id = grade>Grade</a></li>
                <li><a href="Notice.jsp">Notice</a></li>
                <li><a href="Board.jsp">Board</a></li>
                <li><a href="Test.jsp">Test</a></li>
                <li><a href="E-Learning.jsp">E-Learning</a></li>
                <li><a href="Mypage.jsp">My page</a></li>
            </ul>
        </div>
    </div>
</div>
<div id = test>
    <header>
        Attendance
        <i class="far fa-check-square"></i>
    </header>
<div id = container>
<form action = "Attendance_Insert.jsp" method = "post">
<table>
<tr>
<td>StudentID</td>
<td>Name</td>
<td>Times</td>
<td>check</td>
</tr>

<% 
String cnum = request.getParameter("cnum"); 
String div = request.getParameter("division");

int class_unique_number = Integer.parseInt(cnum);
int division = Integer.parseInt(div);

ArrayList<AttendanceBeans>alist = attendanceBeansDB.getAttendanceBeansList(class_unique_number, division);
int counter = alist.size();
if(counter > 0){
	for(AttendanceBeans awlist:alist){
		%>
		<tr>
		<td><%= awlist.getStudentID() %></td>
		<td><%= awlist.getName() %></td>
		<td><%= awlist.getNumber_of_times() %></td>
		<td><input type = "checkbox" value = "<%=awlist.getStudentID()%>" name = check></td>
		</tr>
	<% }
}%>
</table>
<input type = "hidden" value = "<%=class_unique_number %>" name = cnum>
<input type = "hidden" value = "<%= division %>" name = division>
<input type = "submit">
</form>
</div>
</div>
<script>
<%
String job = (String)session.getAttribute("job");
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
</script>
</body>
</html>