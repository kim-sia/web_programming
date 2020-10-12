<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        button{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #92A8D1;
            color: #ffffff;
            width: 65px;
            height: 30px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 30px;
            margin-right: 10px;
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
            <li><a href="Grade.jsp"  id ="grade">Grade</a></li>
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
	String class_number = request.getParameter("cnum");
	String division = request.getParameter("division");
	int class_unique_number = Integer.parseInt(class_number);
	int division2 = Integer.parseInt(division);
	
	if("Educator".equals(job))
	{
%>
    <p align="right"><button onclick="location.href='Assignment_Write.jsp?cnum=<%=class_number%>&division=<%=division%>'">WRITE</button></p>
<% } else{}%>

<%@ page import="java.util.ArrayList, project.AssignmentBeans, java.text.SimpleDateFormat" %>
<jsp:useBean id = "assignmentDB" class = "project.AssignmentBeansDB" scope = "page" />

<table>
    <tr>
        <th>Index</th>
        <th class="width">Title</th>
        <th>Writer</th>
        <th style="width:200px">Deadline</th>
    </tr>
<%
ArrayList<AssignmentBeans>alist = assignmentDB.assignmentGet(class_unique_number, division2);

int conter = alist.size();
if(conter > 0){
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	for(AssignmentBeans awlist : alist){
	%>
	
    <tr onmouseover = "this.style.backgroundColor = '#92A8D1'"
    	onmouseout = "this.style.backgroundColor = 'white'">
        <td><%=awlist.getNumber() %></td>
        <td class="width"><a href = "Assignment_Detail.jsp?cnum=<%=class_number %>&division=<%=division %>&num=<%=awlist.getNumber() %>" style="color:black"><%= awlist.getTitle() %></a></td>
        <td><%= awlist.getName() %></td>
        <td style="width:200px"><%= df.format(awlist.getDeadline()) %></td>
    </tr>
    <%
   } %>
</table>
<%} %>
</div>
</div>
<script>
console.log("<%=class_number%>");
console.log("<%=division%>");
<%
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
</script>
</body>
</html>