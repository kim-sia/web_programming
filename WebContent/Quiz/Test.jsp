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
            text-align: center;
            margin: 15px;
            border: 2px solid #c8b2d6;
            border-radius:20px;
            float:left;
        }
        th,td{
            width: 200px;
            height: 30px;
        }
        th{
            font-weight: normal;
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
        Quiz
        <i class="far fa-copy"></i>
    </header>
<div id = container>
<%@ page import="java.util.ArrayList, project.ClassBeans, project.StuClassBeans, project.EduClassBeans" %>
<jsp:useBean id = "classDB" class = "project.ClassBeansDB" scope = "page" />
<jsp:useBean id = "stuClassDB" class = "project.StuClassBeansDB" scope = "page" />
<jsp:useBean id = "eduClassDB" class = "project.EduClassBeansDB" scope = "page"/>

<%
String id = (String)session.getAttribute("sessionID");
String job = (String)session.getAttribute("job");
if("Educator".equals(job))
{
	ArrayList<EduClassBeans>elist = eduClassDB.getClassList(id);
	int counter1 = elist.size();
	if(counter1 > 0){
		for(EduClassBeans eclist : elist) {
			ArrayList<ClassBeans>clist = classDB.getClassName(eclist.getClass_unique_number());
			int counter2 = clist.size();
				if(counter2 > 0) {
					for(ClassBeans cclist : clist){%>
	<a href="Make_Quiz.jsp?cnum=<%=eclist.getClass_unique_number() %>" style="color:black; font-weight:300">
	<table>
		<tr>
			<td><%= cclist.getClass_name() %></td> <%}}%>
		</tr>
		<tr>
			<td style="width:50px"><%= eclist.getDivision() %>분반</td>
		</tr>
	</table>
	<%}}
}
else if("Student".equals(job)){
	ArrayList<StuClassBeans>slist = stuClassDB.getClassList(id);
	int counter1 = slist.size();
	if(counter1 > 0){
		for(StuClassBeans sclist : slist) {
			ArrayList<ClassBeans>clist = classDB.getClassName(sclist.getClass_unique_number());
			int counter2 = clist.size();
				if(counter2 > 0) {
					for(ClassBeans cclist : clist){%>
	<a href="Quiz_Solve.jsp?cnum=<%=sclist.getClass_unique_number() %>" style="color:black; font-weight:300">
	<table>
		<tr>
			<td><%= cclist.getClass_name() %></td> <%}}%>
		</tr>
		<tr>
			<td style="width:50px"><%= sclist.getDivision() %>분반</td>
		</tr>
	</table>
	<%}}
}%>

	
	</div>
</div>
<script>

</script>
</body>
</html>