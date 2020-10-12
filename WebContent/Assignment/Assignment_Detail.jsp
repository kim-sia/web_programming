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
%>

<%@ page import="java.util.ArrayList, project.AssignmentBeans, project.AssignmentBeansDB, project.StuBeansDB, java.text.SimpleDateFormat" %>
<%
StuBeansDB sDB = new StuBeansDB();
String name = sDB.getName(id);
String cnum = request.getParameter("cnum");
String division1 = request.getParameter("division");
String num = request.getParameter("num");
String title = "";
String content = "";
Date deadline = null;
String fileName = "";
String originalName = "";
int class_num = Integer.parseInt(cnum);
int division = Integer.parseInt(division1);
int index = Integer.parseInt(num);
//out.println(num);
if(num != null){	
	AssignmentBeansDB aDB = new AssignmentBeansDB();
	AssignmentBeans a = aDB.assignmentDetail(class_num, division, index);
	title = a.getTitle();
	content = a.getContent();
	deadline = a.getDeadline();
	fileName = a.getFileName();
	originalName = a.getOriginalName();
};
%>
<%if("Educator".equals(job)){%>
	<p align=right><button class ="button" style = "width: 250px; margin-top:0" onclick="location.href='Assignment_Submit_List.jsp?cnum=<%=class_num%>&division=<%=division%>&index=<%=index%>'">List of Submitted Assignment</button></p>
<%}%>
<form action = "Assignment_Submit_Process.jsp" method = "post" enctype ="Multipart/form-data" name = "file">
<table>
<tr>
<th>Title</th>
<td><%=title %></td>
</tr>
<tr>
<th>Content</th>
<td style = "height:350px"><%=content %></td>
</tr>
<tr>
<th>Deadline</th>
<td><%=deadline %></td>
</tr>
<tr>
<th>File</th>
<td><a id = "down" href = "Assignment_Down.jsp?file_name=<%=fileName %>" style="color:black"><%=originalName %></a></td>
</tr>
<%if("Student".equals(job)) {%>
<tr>
<th style = "border:none"></th>
<td style = "border:none"></td>
</tr>
<tr>
<th>Submit</th>
<td><input type = file required id = "submit_file" name = "file"></td>
</tr>
<tr>
<td colspan=2 style="border:none">
<input type = "hidden" name = "id" value = "<%=id %>">
<input type = "hidden" name = "name" value = "<%=name %>">
<input type = "hidden" name = "class_num" value = "<%=class_num%>">
<input type = "hidden" name = "division" value = "<%=division %>">
<input type = "hidden" name = "number" value = "<%=index %>">
<input type = "button" class = "button" value = "submit" onclick = "deadline()"></td>
</tr><%} %>
</table>
</form>
</div>
</div>
<script>
console.log("<%=id%>");
console.log("<%=name%>");
console.log("<%=class_num%>");
console.log("<%=division%>");
console.log("<%=index%>");
console.log($("#submit_file").val());
window.onload = function() {
	if("<%=originalName%>" == "null")
	{
		var down = document.getElementById('down');
		down.innerHTML = "no file";
		jQuery('#down').click(function (e){
			e.preventDefault();
		});
	}	
	<%
	if("Educator".equals(job))
	{%>
		$('#grade').attr("href", "Grade_Input.jsp");
	<%}%>
}
function deadline() {
	<% Date today = new Date();%>
	if(<%=deadline.getTime()%> - <%=today.getTime()%> < 0)
	{
		$("[name=file1]").attr("required", false);
		alert("The submission deadline has passed");
	}
	else{
		if($("#submit_file").val() == "")
		{
			alert("no file");
		}
		else{
			javascript:file.submit();
		}
	}
}
</script>
</body>
</html>
