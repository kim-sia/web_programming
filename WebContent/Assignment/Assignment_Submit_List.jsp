<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<title>Assignment</title>
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
        td{
        	width:500px;
        }
        th{
            font-weight: normal;
        }
        .width{
            width: 700px;
        }
        #container{
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        .button{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #92A8D1;
            color: #ffffff;
            width: 65px;
            height: 30px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 30px;
            margin-top:30px
        }
    </style>
</head>
<body>

<div id = sidebar>
    <div class="home">
        <input type="button" value="&#xf015" id="home" onclick="location.href='Main.jsp'"><br>
        <div class="side">
        <ul>
            <li><a href="Attendance.jsp">Attendance</a></li>
            <li><a href="Assignment.jsp" style="text-shadow: 2px 2px #cccccc">Assignment</a> </li>
            <li><a href="Grade.jsp" id ="grade">Grade</a></li>
            <li><a href="Notice.jsp">Notice</a></li>
            <li><a href="Board.jsp">Board</a></li>
            <li><a href="Test.jsp">Quiz</a></li>
            <li><a href="E-Learning.jsp">E-Learning</a></li>
            <li><a href="Mypage.jsp">My page</a></li>
        </ul>
        </div>
    </div>
</div>
<div id = test>
<header>
    Assignment
    <i class="fas fa-list"></i>
</header>
<div id = container>
<%
	String id = (String)session.getAttribute("sessionID");
	String job = (String)session.getAttribute("job");
	String cnum = request.getParameter("cnum");
	String division1 = request.getParameter("division");
	String num = request.getParameter("index");
	
	int class_unique_number = Integer.parseInt(cnum);
	int division = Integer.parseInt(division1);
	int index = Integer.parseInt(num);
%>
<%@ page import = "java.util.ArrayList, project.SubmitBeans, java.text.SimpleDateFormat" %>
<jsp:useBean id = "submitDB" class = "project.SubmitBeansDB" scope = "page" />

<table>
<tr>
	<th>studentID</th>
	<th>name</th>
	<th>file</th>
	<th>submission time</th>
	<th>score</th>
	<th>input</th>
</tr>
<%
ArrayList<SubmitBeans>slist = submitDB.submitList(class_unique_number, division, index);
int counter = slist.size();
if(counter > 0){
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	for(SubmitBeans swlist : slist){
%>
<form action = "Assignment_grade.jsp" method = "post">
<tr>
	<td><%=swlist.getStudentID() %></td>
	<td><%=swlist.getName() %></td>
	<td><a href = "Assignment_Submit_Down.jsp?file_name=<%=swlist.getFileName()%>" style = "color:black"><%=swlist.getOriginalName() %></a></td>
	<td><%= df.format(swlist.getTime()) %></td>
	<td><input type = "number" style = "width:70px" name = grade required></td>
	<td><input type = "submit" value = "input" class = "button" style="width:50px; margin:0; height:25px"></td>
</tr>
<input type = "hidden" value = "<%=swlist.getStudentID() %>" name = sID>
<input type = "hidden" value = "<%=class_unique_number%>" name = cnum>
<input type = "hidden" value = "<%=division %>" name = division>
<input type = "hidden" value = "<%=index %>" name = number>
</form>
<%} %>
</table>
<%} %>
</div>
</div>
<script>
console.log("<%=class_unique_number%>");
console.log("<%=division%>");
console.log("<%=index%>");
<%
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
</script>
</body>
</html>