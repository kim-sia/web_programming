<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Farsan&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rubik:400,500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Main</title>
    <style>
        body{
            font-family: 'Noto Sans', sans-serif;
            text-align: center;
            margin: 0;
            background-color:#c8b2d6;
        }
        .nav-container{
            display: flex;
            flex-direction: row;
            width: 100%;
            margin: 0;
            padding: 0;
            background-color: #c8b2d6;
            list-style-type: none;
            margin-left:43%
        }
        .nav-item{
            padding: 16px;
            cursor: pointer;
            font-size: 17px;
        }
        .nav-item a{
            text-align: center;
            text-decoration: none;
            color: white;
            font-weight: bold;
        }
        .login{
            font-family: 'Rubik', sans-serif;
            width:250px;
            height:40px;
            border: 3px solid white;
            background-color:transparent;
            color: white;
            margin-top: 10%;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 2px;
            border-radius:12px;
            box-shadow: 2px 2px;
        }
		#wise_saying{
			font-family: 'Farsan', cursive;
			font-size:65px;
			font-weight:bold;
			color:white;
			margin-top:12%
		}
    </style>
</head>
<body>
<header>
    <nav>
        <ul class = "nav-container">
            <li class = "nav-item"><a href="Attendance.jsp">Attendance</a></li>
            <li class = "nav-item"><a href="Assignment.jsp">Assignment</a></li>
            <li class = "nav-item"><a href="Grade.jsp" id = "grade">Grade</a></li>
            <li class = "nav-item"><a href="Notice.jsp">Notice</a></li>
            <li class = "nav-item"><a href="Board.jsp">Board</a></li>
            <li class = "nav-item"><a href="Test.jsp">Quiz</a></li>
            <li class = "nav-item"><a href="E-Learning.jsp">E-Learning</a></li>
            <li class = "nav-item"><a href="Mypage.jsp">My Page</a> </li>
        </ul>
    </nav>
</header>
</body>
<div id = "wise_saying">
All our dreams can come true,<br>
if we have the courage to pursue them.
</div>
<input type="button" class = "login" value="LOGIN" id = "LOGIN" onclick="login()">
<% String job = (String)session.getAttribute("job"); %>

<script>
console.log("<%= session.getAttribute("sessionID")%>");

window.onload = function(){
	if("<%= session.getAttribute("sessionID")%>" == "null")
	{
		document.getElementById("LOGIN").value = "LOGIN";
		jQuery('.nav-item').click(function (e) {
			e.preventDefault();
			alert("This page requires login");
		});
	}
	else
	{
		document.getElementById("LOGIN").value = "LOGOUT";
	}
	<%
	if("Educator".equals(job))
	{%>
		$('#grade').attr("href", "Grade_Input.jsp");
	<%}%>
}
function login() {
	if("<%= session.getAttribute("sessionID")%>" == "null")
	{
		location.href = "Login.html";
	}
	else
	{
		location.href = "Login.jsp";
	}
}

</script>
</html>
