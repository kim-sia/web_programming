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
<title>Notice</title>
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
    NOTICE
    <i class="fas fa-bullhorn"></i>
</header>
<div id = container>
<%
	String id = (String)session.getAttribute("sessionID");
	String job = (String)session.getAttribute("job");
	
	if("Educator".equals(job))
	{
%>
    <p align="right"><button onclick="location.href='Notice_Write.jsp'">WRITE</button></p>
<% } %>

<%@ page import="java.util.ArrayList, project.NoticeBeans, java.text.SimpleDateFormat" %>
<jsp:useBean id = "noticeDB" class = "project.NoticeBeansDB" scope = "page" />

<table>
    <tr>
    	<th>index</th>
        <th class="width">Title</th>
        <th>Writer</th>
        <th style="width:150px">Date</th>
    </tr>
<%
ArrayList<NoticeBeans>nlist = noticeDB.noticeList();
int conter = nlist.size();
if(conter > 0){
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	for(NoticeBeans nwlist : nlist){
	%>
    <tr onmouseover = "this.style.backgroundColor = '#92A8D1'"
    	onmouseout = "this.style.backgroundColor = 'white'">
    	<td><%=nwlist.getNotice() %></td>
        <td class="width"><a href = "Notice_Detail.jsp?num=<%= nwlist.getNotice() %>" style = "color:black;"> <%= nwlist.getTitle() %></a></td>
        <td><%= nwlist.getName() %></td>
        <td style="width:150px"><%= df.format(nwlist.getDate()) %></td>
    </tr>
    <%
   } %>
</table>
<%} %>
</div>
</div>
<script>
<%
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
</script>
</body>
</html>