<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="EUC-KR">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>My Page</title>
    <style>
        @import "all.css";
        #sidebar{
            background-color: #c8b2d6;
        }
        header{
            color: #c8b2d6;
        }
        li a{
            color: white;
            text-decoration: none;
        }
        input[type=submit]{
            width: 307px;
            height: 40px;
            background-color: #c8b2d6;
            color: white;
            border: 1px solid #c8b2d6;
            margin-top: 15px;
            margin-bottom: 30px;
            font-size: 17px;
            font-weight: bold;
        }
        input:focus{
            box-shadow: 0 0 5px #c8b2d6;
            border: 1px solid #c8b2d6;
        }
        a{
            color: #c8b2d6;
            text-decoration: none;
            font-weight: bold;
        }
        table{
            margin-left: auto;
            margin-right: auto;
            text-align: center;
            margin-bottom: 30px;
        }
        th,td{
            width: 200px;
            height: 30px;
            border-bottom: 1px solid #c8b2d6;
        }
        th{
            font-weight: normal;
        }
        .button{
            font-family: 'Noto Sans', sans-serif;
            border: none !important;
            background-color: #c8b2d6;
            color: #ffffff;
            width: 150px;
            height: 30px !important;
            border-radius: 5px !important;
            font-size: 14px !important;
            margin-bottom: 30px !important;
            margin-right: 10px !imporatant;
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
                <li><a href="Test.jsp">Quiz</a></li>
                <li><a href="E-Learning.jsp">E-Learning</a></li>
                <li><a href="Mypage.jsp" style="text-shadow: 2px 2px #cccccc">My page</a></li>
            </ul>
        </div>
    </div>
</div>
<div id = test>
    <header>
        My Page
        <i class="far fa-id-card"></i>
    </header>
<div id = container>
<%@ page import="java.util.ArrayList, project.ClassBeans, project.StuClassBeans, project.EduClassBeans" %>
<jsp:useBean id = "classDB" class = "project.ClassBeansDB" scope = "page" />
<jsp:useBean id = "stuClassDB" class = "project.StuClassBeansDB" scope = "page" />
<jsp:useBean id = "eduClassDB" class = "project.EduClassBeansDB" scope = "page"/>

<%
String id = (String)session.getAttribute("sessionID");
String job = (String)session.getAttribute("job");
if("Student".equals(job))
{
	ArrayList<StuClassBeans>slist = stuClassDB.getClassList(id);

	int counter1 = slist.size();
	if(counter1 > 0){

	%>
	<table>
		<tr>
			<td>class name</td>
			<td style="width:50px">division</td>
		</tr>
		<% for(StuClassBeans sclist : slist) {%>
		<tr><%
				ArrayList<ClassBeans>clist = classDB.getClassName(sclist.getClass_unique_number());
				int counter2 = clist.size();
				if(counter2 > 0) {
					for(ClassBeans cclist : clist){
						%><td><%= cclist.getClass_name() %></td><%
					}
				}%>
			<td style="width:50px"><%= sclist.getDivision() %></td>
		</tr>
		<%} %>
	</table>
	<%}%>
	<%
}
else if("Educator".equals(job)){
	ArrayList<EduClassBeans>elist = eduClassDB.getClassList(id);
	int counter1 = elist.size();
	if(counter1 > 0){
	%>
	<table>
		<tr>
			<td>class name</td>
			<td style="width:50px">division</td>
		</tr>
		<% for(EduClassBeans eclist : elist) {%>
		<tr><%
				ArrayList<ClassBeans>clist = classDB.getClassName(eclist.getClass_unique_number());
				int counter2 = clist.size();
				if(counter2 > 0) {
					for(ClassBeans cclist : clist){
						%><td><%= cclist.getClass_name() %></td><%
					}
				}%>
			<td style="width:50px"><%= eclist.getDivision() %></td>
		</tr>
		<%} %>
	</table>
	<%}}
ArrayList<ClassBeans>list = classDB.getClassList();
	int counter = list.size();

	if(counter > 0) {
		%>
		<form action="InsertClass.jsp" method = "post" name = "class_">
		<table>
	    <tr>
	        <th>department</th>
	        <th>class name</th>
	        <th>Division</th>
	        <th style="width:70px">Check</th>
	    </tr>
	    <%
	    	for(ClassBeans clist : list) {
	    %>
	    <tr>
	        <td><%= clist.getDepartment() %></td>
	        <td><%= clist.getClass_name() %></td>
	        <td>
	        <select name = "division" class = "division" disabled>
	        		<option value = "">division</option>
					<% for(int i = 1; i <= clist.getDivision(); i++){%>
						<option value = "<%= i %>"><%=i %></option>
						        <% }%>
	        </select>

	        </td>
	        <td style="width:70px"><input type = "checkbox" value = "<%= clist.getClass_unique_number()%>" class = "class_number" onclick="check()" name = unique></td>
	    </tr>
	    <%}%>  
	    </table>
	    <input type =submit value = "Adding Lessons" class = "button" style = "width:150px">
	    </form>
	<%}	%>



	
</div>
</div>
<script>
<%
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
function check(){
var chkbox = $(".class_number");
var select = $(".division");
console.log(select.length);
console.log(chkbox.length);
	for(var i = 0; i < chkbox.length; i++)
	{
		if(chkbox[i].checked == true)
		{
			$(select[i]).attr("required",true);
			$(select[i]).attr("disabled",false);
		}
		else{
			$(select[i]).attr("disabled",true);
		}
	}	
}

console.log("<%=(String)session.getAttribute("sessionID")%>");
console.log("<%=(String)session.getAttribute("job")%>");
</script>
</body>
</html>