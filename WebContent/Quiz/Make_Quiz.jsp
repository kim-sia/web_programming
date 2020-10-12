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
<title>Quiz</title>
<style>
        @import "all.css";
        table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 40px;
            border-spacing:5px
        }
        td:nth-child(2n){
            border-bottom: 1px solid #92A8D1;
        }
        th{
        	width:150px;
        	background-color:#92A8D1;
        	color:white;
        }
        input[type=text]{
        	border:none;
        	width:500px
        }
        input[type=submit]{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #92A8D1;
            color: white;
            width: 65px;
            height: 30px;
            font-size: 14px;
            border-radius: 3px;
            margin-bottom:50px;
        }
        #container{
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
<% request.setCharacterEncoding("euc-kr"); %>
<div id = sidebar>
    <div class="home">
        <input type="button" value="&#xf015" id="home" onclick="location.href='Main.jsp'"><br>
        <div class="side">
            <ul>
                <li><a href="Attendance.jsp">Attendance</a></li>
                <li><a href="Assignment.jsp">Assignment</a> </li>
                <li><a href="Grade.jsp" id ="grade">Grade</a></li>
                <li><a href="Notice.jsp">Notice</a></li>
                <li><a href="Board.jsp">Board</a></li>
                <li><a href="Test.jsp" style="text-shadow: 2px 2px #cccccc">Quiz</a></li>
                <li><a href="E-Learning.jsp">E-Learning</a></li>
                <li><a href="Mypage.jsp">My page</a></li>
            </ul>
        </div>
    </div>
</div>
<div id = test>
    <header>
        Make A Quiz
        <i class="far fa-copy"></i>
    </header>
<div id = container>
<% 
String cnum = request.getParameter("cnum"); 
%>
<form action = "Quiz_Check.jsp" method = "post">
<%
	for(int i = 1; i <= 5; i++)
	{%>
		<table>
		<tr>
		<th>Question <%=i %></th>
		<td><input type="text" name = "Q" required></td>
		</tr>
		<tr>
		<td><input type="radio" name = "A<%=i %>_" value = "1" required> Answer 1</td>
		<td><input type="text" name = "A1" required></td>
		</tr>
		<tr>
		<td><input type="radio" name = "A<%=i %>_" value = "2" required> Answer 2</td>
		<td><input type="text" name = "A2" required></td>
		</tr>
		<tr>
		<td><input type="radio" name = "A<%=i %>_" value = "3" required> Answer 3</td>
		<td><input type="text" name = "A3" required></td>
		</tr>
		<tr>
		<td><input type="radio" name = "A<%=i %>_" value = "4" required> Answer 4</td>
		<td><input type="text" name = "A4" required></td>
		</tr>
		<tr>
		<td><input type="radio" name = "A<%=i %>_" value = "5" required> Answer 5</td>
		<td><input type="text" name = "A5" required></td>
		</tr>
		</table>
	<%}
%>
<input type = "hidden" value = "<%=cnum %>" name = "cnum">
<input type = "submit" value = "submit">
</form>
</div>
</div>

</body>
</html>