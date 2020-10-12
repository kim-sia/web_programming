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
            background-color: #c8b2d6;
        }
        header{
            color: #c8b2d6;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 40px;
            border-spacing:5px
        }
        td:nth-child(2n){
            border-bottom: 1px solid #c8b2d6;
        }
        th{
        	width:150px;
        	background-color:#c8b2d6;
        	color:white;
        }
        input[type=text]{
        	border:none;
        	width:500px
        }
        input[type=submit]{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color: #c8b2d6;
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
int class_unique_number = Integer.parseInt(cnum);
String[] Q = request.getParameterValues("Q");
String[] A1 = request.getParameterValues("A1");
String[] A2 = request.getParameterValues("A2");
String[] A3 = request.getParameterValues("A3");
String[] A4 = request.getParameterValues("A4");
String[] A5 = request.getParameterValues("A5");

String A1__ = request.getParameter("A1_");
String A2__ = request.getParameter("A2_");
String A3__ = request.getParameter("A3_");
String A4__ = request.getParameter("A4_");
String A5__ = request.getParameter("A5_");

int A1_ = Integer.parseInt(A1__);
int A2_ = Integer.parseInt(A2__);
int A3_ = Integer.parseInt(A3__);
int A4_ = Integer.parseInt(A4__);
int A5_ = Integer.parseInt(A5__);

int[] A = new int[5];
A[0] = A1_;
A[1] = A2_;
A[2] = A3_;
A[3] = A4_;
A[4] = A5_;

%>
<jsp:useBean id = "quiz" class = "project.QuizBeans" scope = "page"/>
<jsp:useBean id = "quizDB" class = "project.QuizBeansDB" scope="page"/>
<jsp:setProperty property="class_unique_number" name="quiz" value = "<%=class_unique_number %>"/>

<jsp:setProperty property="q1" name = "quiz" value="<%=Q[0] %>"/>
<jsp:setProperty property="q2" name = "quiz" value="<%=Q[1] %>"/>
<jsp:setProperty property="q3" name = "quiz" value="<%=Q[2] %>"/>
<jsp:setProperty property="q4" name = "quiz" value="<%=Q[3] %>"/>
<jsp:setProperty property="q5" name = "quiz" value="<%=Q[4] %>"/>

<jsp:setProperty property="q1_1" name = "quiz" value="<%=A1[0] %>"/>
<jsp:setProperty property="q2_1" name = "quiz" value="<%=A1[1] %>"/>
<jsp:setProperty property="q3_1" name = "quiz" value="<%=A1[2] %>"/>
<jsp:setProperty property="q4_1" name = "quiz" value="<%=A1[3] %>"/>
<jsp:setProperty property="q5_1" name = "quiz" value="<%=A1[4] %>"/>

<jsp:setProperty property="q1_2" name = "quiz" value="<%=A2[0] %>"/>
<jsp:setProperty property="q2_2" name = "quiz" value="<%=A2[1] %>"/>
<jsp:setProperty property="q3_2" name = "quiz" value="<%=A2[2] %>"/>
<jsp:setProperty property="q4_2" name = "quiz" value="<%=A2[3] %>"/>
<jsp:setProperty property="q5_2" name = "quiz" value="<%=A2[4] %>"/>

<jsp:setProperty property="q1_3" name = "quiz" value="<%=A3[0] %>"/>
<jsp:setProperty property="q2_3" name = "quiz" value="<%=A3[1] %>"/>
<jsp:setProperty property="q3_3" name = "quiz" value="<%=A3[2] %>"/>
<jsp:setProperty property="q4_3" name = "quiz" value="<%=A3[3] %>"/>
<jsp:setProperty property="q5_3" name = "quiz" value="<%=A3[4] %>"/>

<jsp:setProperty property="q1_4" name = "quiz" value="<%=A4[0] %>"/>
<jsp:setProperty property="q2_4" name = "quiz" value="<%=A4[1] %>"/>
<jsp:setProperty property="q3_4" name = "quiz" value="<%=A4[2] %>"/>
<jsp:setProperty property="q4_4" name = "quiz" value="<%=A4[3] %>"/>
<jsp:setProperty property="q5_4" name = "quiz" value="<%=A4[4] %>"/>

<jsp:setProperty property="q1_5" name = "quiz" value="<%=A5[0] %>"/>
<jsp:setProperty property="q2_5" name = "quiz" value="<%=A5[1] %>"/>
<jsp:setProperty property="q3_5" name = "quiz" value="<%=A5[2] %>"/>
<jsp:setProperty property="q4_5" name = "quiz" value="<%=A5[3] %>"/>
<jsp:setProperty property="q5_5" name = "quiz" value="<%=A5[4] %>"/>

<jsp:setProperty property="a1" name = "quiz" value="<%=A[0] %>"/>
<jsp:setProperty property="a2" name = "quiz" value="<%=A[1] %>"/>
<jsp:setProperty property="a3" name = "quiz" value="<%=A[2] %>"/>
<jsp:setProperty property="a4" name = "quiz" value="<%=A[3] %>"/>
<jsp:setProperty property="a5" name = "quiz" value="<%=A[4] %>"/>

<%
if(!quizDB.insertDB(quiz)){
	out.println("<script>alert('fail');</script>");
}
else{
	out.println("<script>alert('success');</script>");
}

for(int i = 0; i < Q.length; i++)
{
	int j = i+1; %>

	<table>
	<tr>
	<th>Question <%=j %></th>
	<td><%=Q[i]%></td>
	</tr>
	<tr>
	<td>Answer 1</td>
	<td><%=A1[i] %></td>
	</tr>
	<tr>
	<td>Answer 2</td>
	<td><%=A2[i] %></td>
	</tr>
	<tr>
	<td>Answer 3</td>
	<td><%=A3[i] %></td>
	</tr>
	<tr>
	<td>Answer 4</td>
	<td><%=A4[i] %></td>
	</tr>
	<tr>
	<td style="border-bottom:1px solid #c8b2d6">Answer 5</td>
	<td><%=A5[i] %></td>
	</tr>
	<tr>
	<td>Correct Answer</td>
	<td style = "color:red; border-bottom:none"><%=A[i] %></td>
	</tr>
	</table>
<%}
%>
</div>
</div>
</body>
</html>