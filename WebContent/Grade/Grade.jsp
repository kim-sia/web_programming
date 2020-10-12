<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%@ page import="java.util.ArrayList, project.GradeBeans, project.GradeBeansDB" %>
 	<jsp:useBean id = "gradeBeans" class = "project.GradeBeans" scope ="page"/>
	<jsp:useBean id = "gradeBeansDB" class = "project.GradeBeansDB" scope = "page"/>
	<jsp:useBean id = "classBeans" class = "project.ClassBeans" scope ="page"/>
	<jsp:useBean id = "classBeansDB" class = "project.ClassBeansDB" scope = "page"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    
<style>
        @import "all.css";
        #sidebar{
            background-color: #F7CAC9;
        }
        header{
            color: #F7CAC9;
        }
        .button{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color:#F7CAC9;
            color: white;
            width: 65px;
            height: 30px;
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 30px;
            margin-right: 10px;
        }
        #container{
            width: 70%;
            margin-left: auto;
            margin-right: auto;
        }
        table{
        
            border-spacing: 5px;
        }
        td{
            width: 90px;
            height: 30px;
            border-bottom: 1px solid #F7CAC9;
        }
        
    </style>
</head>
<body>
<% String sessionID = (String)session.getAttribute("sessionID");
%>
<div id = sidebar>
    <div class="home">
        <input type="button" value="&#xf015" id="home" onclick="location.href='Main.jsp'"><br>
        <div class="side">
            <ul>
                <li><a href="Attendance.jsp">Attendance</a></li>
                <li><a href="Assignment.jsp">Assignment</a> </li>
                <li><a href="Grade.jsp"  id ="grade" style="text-shadow: 2px 2px #cccccc">Grade</a></li>
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
        Check My Score
        <i class="fas fa-clipboard-list"></i>
    </header>
            <table style="margin-left:auto; margin-right:auto;">
                <tr>
                	<td style="width:200px">Class Name</td>
                    <td>Assignment1</td>
                    <td>Assignment2</td>
                    <td>Midterm</td>
                    <td>Final</td>
                    <td>Attendance</td>
                </tr>
                	<% 
                	ArrayList<GradeBeans>gradeList = gradeBeansDB.getMyGradeList(sessionID);
                	
                	int gradeCounter = gradeList.size();
                	
           			if(gradeCounter > 0) {
           			
           			//for(StuBeans slist : stuList)
           			for(GradeBeans glist : gradeList) {
           				int class_unique_number = glist.getClass_unique_number();
           				String className = classBeansDB.getClassName1(class_unique_number);
           			%>	
       			<tr>
       				<td style="width:200px"><%= className%></td>
                    <td><%= glist.getAssignment1()%></td>
                    <td><%= glist.getAssignment2()%></td>
                    <td><%= glist.getMidterm_exam()%></td>
                    <td><%= glist.getFinal_exam()%></td>
                    <td><%= glist.getAttendance()%></td>
                    
                </tr>
                <%}	
           		}%>
            </table>
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