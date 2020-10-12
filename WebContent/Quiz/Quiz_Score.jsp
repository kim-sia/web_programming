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
           	width:400px;
           	text-align:left
        }
        td:nth-child(2n){
        	width : 100px;
        	text-align:center;
        }
        th{
        	width:400px;
        	background-color:#F7CAC9;
        	color:white;
        }
        input[type=text]{
        	border:none;
        	width:500px
        }
        button{
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
        .a{
        	color:red;
        	position : absolute;
        	font-size:35px;
        	margin-top:-7px;
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
String q1 = request.getParameter("q1");
String q2 = request.getParameter("q2");
String q3 = request.getParameter("q3");
String q4 = request.getParameter("q4");
String q5 = request.getParameter("q5");

int a1 = Integer.parseInt(q1);
int a2 = Integer.parseInt(q2);
int a3 = Integer.parseInt(q3);
int a4 = Integer.parseInt(q4);
int a5 = Integer.parseInt(q5);
int A1 = 0;
int A2 = 0;
int A3 = 0;
int A4 = 0;
int A5 = 0;
%>
<%@ page import = "java.util.ArrayList, project.QuizBeans" %>
<jsp:useBean id = "quiz" class = "project.QuizBeans" scope = "page"/>
<jsp:useBean id = "quizDB" class = "project.QuizBeansDB" scope="page"/>

<table>
<tr>
<th>Question</th>
<td>My Answer</td>
</tr>
<%
ArrayList<QuizBeans>qlist = quizDB.quizList(class_unique_number);
int counter = qlist.size();
if(counter > 0) {
	for(QuizBeans qwlist:qlist) { 
		A1 = qwlist.getA1();
		A2 = qwlist.getA2();
		A3 = qwlist.getA3();
		A4 = qwlist.getA4();
		A5 = qwlist.getA5(); %>
	<tr>
		<td><i class="far fa-circle a" id ="o1"></i><i class="fas fa-check a" id = "x1"></i><%=qwlist.getQ1() %></td>
		<td><%=a1 %></td>
	</tr>
	<tr>
		<td><i class="far fa-circle a" id = "o2"></i><i class="fas fa-check a" id = "x2"></i><%=qwlist.getQ2() %></td>
		<td><%=a2 %></td>
	</tr>
	<tr>
		<td><i class="far fa-circle a" id = "o3"></i><i class="fas fa-check a" id = "x3"></i><%=qwlist.getQ3() %></td>
		<td><%=a3 %></td>
	</tr>
	<tr>
		<td><i class="far fa-circle a" id = "o4"></i><i class="fas fa-check a" id = "x4"></i><%=qwlist.getQ4() %></td>
		<td><%=a4 %></td>
	</tr>
	<tr>
		<td><i class="far fa-circle a" id = "o5"></i><i class="fas fa-check a" id = "x5"></i><%=qwlist.getQ5() %></td>
		<td><%=a5 %></td>
	</tr>
<%}}%>
</table>
<button onclick="location.href='Quiz_Solve.jsp?cnum=<%=class_unique_number%>'">Again</button>
</div>
</div>
</body>
<script>
if("<%=a1%>" == "<%=A1%>")
{
	jQuery('#o1').show();
	jQuery('#x1').hide();
}
else{
	jQuery('#o1').hide();
	jQuery('#x1').show();
}
if("<%=a2%>" == "<%=A2%>")
{
	jQuery('#o2').show();
	jQuery('#x2').hide();
}
else{
	jQuery('#o2').hide();
	jQuery('#x2').show();
}
if("<%=a3%>" == "<%=A3%>")
{
	jQuery('#o3').show();
	jQuery('#x3').hide();
}
else{
	jQuery('#o3').hide();
	jQuery('#x3').show();
}
if("<%=a4%>" == "<%=A4%>")
{
	jQuery('#o4').show();
	jQuery('#x4').hide();
}
else{
	jQuery('#o4').hide();
	jQuery('#x4').show();
}
if("<%=a5%>" == "<%=A5%>")
{
	jQuery('#o5').show();
	jQuery('#x5').hide();
}
else{
	jQuery('#o5').hide();
	jQuery('#x5').show();
}
</script>
</html>