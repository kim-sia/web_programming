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
        #sidebar{
            background-color: #F7CAC9;
        }
        header{
            color: #F7CAC9;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 40px;
            border-spacing:5px
        }
        td{
            border-bottom: 1px solid #F7CAC9;
            width:500px;
        }
        select{
        	width:500px;
        	border:none;   	
        }
        th{
        	width:500px;
        	background-color:#F7CAC9;
        	color:white;
        }
        input[type=text]{
        	border:none;
        	width:500px
        }
        input[type=submit]{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #F7CAC9;
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
        Unravel The Quiz
        <i class="far fa-copy"></i>
    </header>
<div id = container>
<%
String cnum = request.getParameter("cnum");
int class_unique_number = Integer.parseInt(cnum);
%>
<%@ page import = "java.util.ArrayList, project.QuizBeans" %>
<jsp:useBean id = "quiz" class = "project.QuizBeans" scope = "page"/>
<jsp:useBean id = "quizDB" class = "project.QuizBeansDB" scope="page"/>

<form action = "Quiz_Score.jsp" method = "post">
<table>
<%
ArrayList<QuizBeans>qlist = quizDB.quizList(class_unique_number);
int counter = qlist.size();
if(counter > 0) {
	for(QuizBeans qwlist:qlist) { %>
	<tr>
		<th><%=qwlist.getQ1() %></th>
	</tr>
	<tr>
		<td>
			<select name = "q1">
				<option></option>
				<option value = "1"><%=qwlist.getQ1_1() %></option>
				<option value = "2"><%=qwlist.getQ1_2() %></option>
				<option value = "3"><%=qwlist.getQ1_3() %></option>
				<option value = "4"><%=qwlist.getQ1_4() %></option>
				<option value = "5"><%=qwlist.getQ1_5() %></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><%=qwlist.getQ2() %></th>
	</tr>
	<tr>
		<td>
			<select name = "q2">
				<option></option>
				<option value = "1"><%=qwlist.getQ2_1() %></option>
				<option value = "2"><%=qwlist.getQ2_2() %></option>
				<option value = "3"><%=qwlist.getQ2_3() %></option>
				<option value = "4"><%=qwlist.getQ2_4() %></option>
				<option value = "5"><%=qwlist.getQ2_5() %></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><%=qwlist.getQ3() %></th>
	</tr>
	<tr>
		<td>
			<select name = "q3">
				<option></option>
				<option value = "1"><%=qwlist.getQ3_1() %></option>
				<option value = "2"><%=qwlist.getQ3_2() %></option>
				<option value = "3"><%=qwlist.getQ3_3() %></option>
				<option value = "4"><%=qwlist.getQ3_4() %></option>
				<option value = "5"><%=qwlist.getQ3_5() %></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><%=qwlist.getQ4() %></th>
	</tr>
	<tr>
		<td>
			<select name = "q4">
				<option></option>
				<option value = "1"><%=qwlist.getQ4_1() %></option>
				<option value = "2"><%=qwlist.getQ4_2() %></option>
				<option value = "3"><%=qwlist.getQ4_3() %></option>
				<option value = "4"><%=qwlist.getQ4_4() %></option>
				<option value = "5"><%=qwlist.getQ4_5() %></option>
			</select>
		</td>
	</tr>
	<tr>
		<th><%=qwlist.getQ5() %></th>
	</tr>
	<tr>
		<td>
			<select name = "q5">
				<option></option>
				<option value = "1"><%=qwlist.getQ5_1() %></option>
				<option value = "2"><%=qwlist.getQ5_2() %></option>
				<option value = "3"><%=qwlist.getQ5_3() %></option>
				<option value = "4"><%=qwlist.getQ5_4() %></option>
				<option value = "5"><%=qwlist.getQ5_5() %></option>
			</select>
		</td>
	</tr>
<%}}%>
</table>
<input type = "hidden" name = "cnum" value = "<%=class_unique_number %>">
<input type = "submit" value = "submit">
</form>
</div>
</div>
</body>
</html>