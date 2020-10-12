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
<title>Notice Write</title>
<style>
        @import "all.css";
        table{
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 40px;
        }
        td:nth-child(2){
            border-bottom: 1px solid #ccc;
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
        }
        input[type=reset]{
            font-family: 'Noto Sans', sans-serif;
            border: 1px solid gray;
            background-color: transparent;
            color: gray;
            width: 65px;
            height: 30px;
            font-size: 14px;
            border-radius: 3px;
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
                <li><a href="Assignment.jsp">Assignment</a> </li>
                <li><a href="Grade.jsp" id ="grade">Grade</a></li>
                <li><a href="Notice.jsp" style="text-shadow: 2px 2px #cccccc">Notice</a></li>
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
    WRITE
    <i class="fas fa-highlighter"></i>
</header>
<% String id = (String)session.getAttribute("sessionID"); %>
<form action="Notice_Write_Process.jsp" method="post" enctype ="Multipart/form-data">
    <table cellspacing="10px">
        <tr>
            <td>Title</td>
            <td><input type="text" name = title style="width: 100%; border: none; padding-left: 3px" required></td>
        </tr>
        <tr>
            <td>Content</td>
            <td><textarea cols = "70" rows="20" name="content" style="border: none;"></textarea> </td>
        </tr>
        <tr>
            <td>File</td>
            <td style="text-align: left"><input type="file" name="file" style="margin-top: 15px; margin-bottom: 7px;"></td>
        </tr>
    </table>
    <input type ="hidden" name = "id" value = <%= id %>>
    <input type="submit" value="submit">
    <input type="reset" value="reset">
</form>
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