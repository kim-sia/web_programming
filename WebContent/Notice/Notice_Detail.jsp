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
        td{
        	width:500px;
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
String sessionId = (String)session.getAttribute("sessionID");
String sessionJob = (String)session.getAttribute("job");
%>
<%@ page import="java.util.ArrayList, project.NoticeBeans, project.NoticeBeansDB" %>
<%
String num = request.getParameter("num");
String title = "";
String content = "";
String fileName = "";
String originalName = "";
//out.println(num);
if(num != null){
	int index = Integer.parseInt(num);
	//out.println(index);
	NoticeBeansDB nDB = new NoticeBeansDB();
	NoticeBeans n = nDB.noticeGet(index);
	title = n.getTitle();
	content = n.getContent();
	fileName = n.getFileName();
	originalName = n.getOriginalName();
};
%>
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
<th>File</th>
<td><a id = "down" href = "Notice_Down.jsp?file_name=<%=fileName %>" style="color:black"><%=originalName %></a></td>
</tr>
</table>
</div>
</div>
<script>
window.onload = function() {
	if("<%=originalName%>" == null)
	{
		var down = document.getElementById('down');
		down.innerHTML = "no file";
		jQuery('#down').click(function (e){
			e.preventDefault();
		});
	}	
	<%
	if("Educator".equals(sessionJob))
	{%>
		$('#grade').attr("href", "Grade_Input.jsp");
	<%}%>
}

</script>
</body>
</html>