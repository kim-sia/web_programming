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
    <title>Input Student's Score</title>
<style>
        @import "all.css";
        table{
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            margin: 15px;
            border: 2px solid #92A8D1;
            border-radius:20px;
            float:left;
        }
        td{
             width: 200px;
            height: 30px;
        }
        #container{
            width: 60%;
            margin-left: auto;
            margin-right: auto;
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
                <li><a href="Grade_Input.jsp" style="text-shadow: 2px 2px #cccccc" id = grade>Grade</a></li>
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
        Grade
        <i class="fas fa-pencil-alt"></i>
    </header>
    <div id = container>
<%@ page import="java.util.ArrayList, project.ClassBeans, project.StuClassBeans, project.EduClassBeans" %>
<jsp:useBean id = "classDB" class = "project.ClassBeansDB" scope = "page" />
<jsp:useBean id = "stuClassDB" class = "project.StuClassBeansDB" scope = "page" />
<jsp:useBean id = "eduClassDB" class = "project.EduClassBeansDB" scope = "page"/>

<%
String id = (String)session.getAttribute("sessionID");
String job = (String)session.getAttribute("job");

	ArrayList<EduClassBeans>elist = eduClassDB.getClassList(id);
	int counter1 = elist.size();
	if(counter1 > 0){
		for(EduClassBeans eclist : elist) {
			ArrayList<ClassBeans>clist = classDB.getClassName(eclist.getClass_unique_number());
			int counter2 = clist.size();
				if(counter2 > 0) {
					for(ClassBeans cclist : clist){%>
	<a href="Grade_Edu.jsp?cnum=<%=eclist.getClass_unique_number()%>&division=<%=eclist.getDivision()%>" style="color:black; font-weight:300">
	<table>
		<tr>
			<td><%= cclist.getClass_name() %></td> <%}}%>
		</tr>
		<tr>
			<td style="width:50px"><%= eclist.getDivision() %>�й�</td>
		</tr>
	</table></a>
	<%}}%>
  
    </div>
    
</div>
<script>
<%
if("Educator".equals(job))
{%>
	$('#grade').attr("	href", "Grade_Input.jsp");
<%}%>

</script>
</body>
</html>