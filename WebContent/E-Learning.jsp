<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>E-Learning</title>
    <style>
        @import "all.css";
        #sidebar{
            background-color: #F7CAC9;
        }
        header{
            color: #F7CAC9;
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
                <li><a href="Grade.jsp"  id ="grade">Grade</a></li>
                <li><a href="Notice.jsp">Notice</a></li>
                <li><a href="Board.jsp">Board</a></li>
                <li><a href="Test.jsp">Quiz</a></li>
                <li><a href="E-Learning.jsp" style="text-shadow: 2px 2px #cccccc">E-Learning</a></li>
                <li><a href="Mypage.jsp">My page</a></li>
            </ul>
        </div>
    </div>
</div>
<div id = test>
    <header>
        E-Learning
        <i class="fas fa-laptop"></i>
    </header>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/tZooW6PritE?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/Z7uBInm1PJY?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/QwCdCcsPVTQ?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> <br>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/MLXlXCwA0T4?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/iRZJHhjh8DU?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/9GkFI1ovBbU?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> <br>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/QoQsaUWx3EU?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/IJR-pSLGuZM?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    <iframe width="300" height="200" src="https://www.youtube.com/embed/SXtp7w7kdDc?list=PLuHgQVnccGMDZP7FJ_ZsUrdCGH68ppvPb" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> <br>
<div style="margin-bottom: 100px; "></div>
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