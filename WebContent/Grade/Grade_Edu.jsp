<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>

<%@ page import="java.util.ArrayList, project.GradeBeans, project.GradeBeansDB, project.StuBeans, project.StuBeansDB" %>
<jsp:useBean id = "gradeBeans" class = "project.GradeBeans" scope ="page"/>
<jsp:useBean id = "gradeBeansDB" class = "project.GradeBeansDB" scope = "page"/>
<jsp:useBean id = "stuBeansDB" class = "project.StuBeansDB" scope = "page"/>
<jsp:useBean id = "stuBeans" class = "project.StuBeans" scope = "page"/>
<jsp:useBean id = "attendanceBeansDB" class = "project.AttendanceBeansDB" scope = "page" />
<jsp:useBean id = "attendanceBeans" class = "project.AttendanceBeans" scope ="page"/>

<% 
if(request.getParameter("assignment2")!=null ) {
String[] studentID = request.getParameterValues("studentID");
String[] assignment1 = request.getParameterValues("assignment1"); 
String[] assignment2 = request.getParameterValues("assignment2");
String[] midExam = request.getParameterValues("midterm_exam");
String[] finalExam = request.getParameterValues("final_exam");
String[] attendance = request.getParameterValues("attendance");
String cnum = request.getParameter("cnum");
int class_unique_number2 = Integer.parseInt(cnum);
String div = request.getParameter("division");
int division = Integer.parseInt(div);

int count = assignment2.length;
int _studentID = 0;
int _assignment1 = 0;
int _assignment2 = 0;
int _midExam = 0;
int _finalExam = 0;
int _attendance = 0;

if(count>0) {
	for(int i=0; i<count; i++) {
		_assignment1 = Integer.parseInt(assignment1[i]);
		_assignment2 = Integer.parseInt(assignment2[i]);
		_midExam = Integer.parseInt(midExam[i]);
		_finalExam = Integer.parseInt(finalExam[i]);
		_attendance = Integer.parseInt(attendance[i]);
		_studentID = Integer.parseInt(studentID[i]);
		%>
		
		<jsp:setProperty property="assignment1" name="gradeBeans" value = "<%= _assignment1 %>"/>
		<jsp:setProperty property="assignment2" name="gradeBeans" value = "<%= _assignment2 %>" />
		<jsp:setProperty property="midterm_exam" name="gradeBeans" value = "<%= _midExam %>"/>
		<jsp:setProperty property="final_exam" name="gradeBeans" value = "<%= _finalExam %>"/>
		<jsp:setProperty property="attendance" name="gradeBeans" value = "<%= _attendance %>"/>
		
		<jsp:setProperty property = "class_unique_number" name = "attendanceBeans" value = "<%=class_unique_number2 %>"/>
      <jsp:setProperty property = "division" name = "attendanceBeans" value = "<%=division %>"/>
      <jsp:setProperty property = "studentID" name = "attendanceBeans" value = "<%=_studentID%>"/>
      <jsp:setProperty property = "number_of_times" name = "attendanceBeans" value = "<%=_attendance %>"/>
		<%
			
			if(!gradeBeansDB.updateDB(gradeBeans, _studentID, class_unique_number2)){
			out.println("<script>alert('fail');</script>");
			}
			if(!attendanceBeansDB.updateAttendance1(attendanceBeans))
	      {
	         out.println("<script>alert('attendance fail');</script>");
	      }
		}
	out.println("<script>alert('success');</script>");

	}
}

%>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <title>Input Student's Score</title>

<style>
        @import "all.css";
        .button{
            font-family: 'Noto Sans', sans-serif;
            border: none;
            background-color:#92A8D1;
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
            width: 100px;
            height: 30px;
            border-bottom: 1px solid #92A8D1;
        }
        input[type=number],[type=text]
        {
            width: 100px;
            border: none;
            text-align:center;
        }
        .ratio{padding-top:20px; margin-left:17.8%}
        .ratio li{float:left;position:relative;width:100px;height:100px;margin-right:10px;list-style:none;margin-bottom:100px}
        .ratio div{position:absolute;left:0;bottom:0;width:100%;background-color: #92A8D1; font-size:12px; color:white}
        .ratio em{position:absolute;top:-20px;width:100%;font-size:12px;font-weight:bold;text-align:center;color:black}
    </style>
</head>
<body>
<%
int avg_att = 0;
int avg_ass1 = 0;
int avg_ass2 = 0;
int avg_mid = 0;
int avg_fin = 0;
%>
<div id = sidebar>
    <div class="home">
        <input type="button" value="&#xf015" id="home" onclick="location.href='Main.jsp'"><br>
        <div class="side">
            <ul>
                <li><a href="Attendance.jsp">Attendance</a></li>
                <li><a href="Assignment.jsp">Assignment</a> </li>
                <li><a href="Grade.jsp" style="text-shadow: 2px 2px #cccccc" id = grade>Grade</a></li>
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
        Input Student's Score
        <i class="fas fa-pencil-alt"></i>
    </header>
    <div id = container>
        <form name="grade" action="Grade_Edu.jsp" method="post">
            <table name = "grade" id = "grade">
                <tr>
                    <td>Student ID</td>
                    <td>Name</td>
                    <td>Grade</td>
                    <td>Attendance</td>
                    <td>Assignment1</td>
                    <td>Assignment2</td>
                    <td>Midterm</td>
                    <td>Final</td>  
                </tr>
                	<% 
                	String cnum = request.getParameter("cnum");
                	String div = request.getParameter("division");
                	int class_unique_number = Integer.parseInt(cnum);
                	int division = Integer.parseInt(div);
                	
                	ArrayList<GradeBeans>gradeList = gradeBeansDB.getList_Edu(class_unique_number, division);
                	//ArrayList<StuBeans>stuList = stuBeansDB.getStuList();      	
                	//int stuCounter = stuList.size();
                	int gradeCounter = gradeList.size();
                	
           			if(gradeCounter > 0) {
           			
           			//f3or(StuBeans slist : stuList)
           			for(GradeBeans glist : gradeList) {
           				avg_att += glist.getAttendance();
           				avg_ass1 += glist.getAssignment1();
           				avg_ass2 += glist.getAssignment2();
           				avg_mid += glist.getMidterm_exam();
           				avg_fin += glist.getFinal_exam();
           			%>
       			<tr>
                    <td><input type="text" name="studentID" value=<%=glist.getStudentID()%> readonly></td>
                    <td><input type="text" name="name" value=<%= glist.getName()%> readonly></td>
                    <td><input type="text" name="grade" value=<%= glist.getGrade()%> readonly></td>
                    <td><input type="number" name="attendance" value=<%= glist.getAttendance()%> autocomplete="0ff"></td>
                    <td><input type="number" name="assignment1" value=<%= glist.getAssignment1()%> autocomplete="0ff"></td>
                    <td><input type="number" name="assignment2" value=<%= glist.getAssignment2()%> autocomplete="0ff"></td>
                    <td><input type="number" name="midterm_exam" value=<%= glist.getMidterm_exam()%> autocomplete="0ff"></td>
                    <td><input type="number" name="final_exam" value=<%= glist.getFinal_exam()%> autocomplete="0ff"></td>
                </tr>
                <%}	
           			avg_att = avg_att/gradeCounter;
           			avg_ass1 = avg_ass1/gradeCounter;
           			avg_ass2 = avg_ass2/gradeCounter;
           			avg_mid = avg_mid/gradeCounter;
           			avg_fin = avg_fin/gradeCounter;
           		}%>
            </table>
            <input type="hidden" value = "<%=class_unique_number%>" name = cnum>
            <input type="hidden" value = "<%=division%>" name = division>
            <input type="submit" class="button" value="Input"  style="margin-top: 30px">
        </form>
         <form name="excel_form" id="excel_form" action="Grade_ExcelFormDownload.jsp" method="post" target="_blank">
      	<input type="hidden" name="excel_table" id="excel_table" />
      	<input type="hidden" name="file_name" id="file_name" />
      <%String fileName = "GradeInputForm.xls";%>
       <input type = button onclick="location.href = 'Grade_Down.jsp?file_name=<%=fileName %>'" value = "Form DownLoad" style="width:200px; margin-bottom:0" class= "button">
      <input type="button" value="Grade Download" class = "button" onclick="downloadExcelForm()" style="margin-bottom:0; width:200px;">
   </form>
        <form name="excel" action="Grade_FileUpload.jsp?class_unique_number=<%=class_unique_number%>&division=<%=division%>" method="post" enctype="multipart/form-data">
       <input type="file" name="file"  style="margin-top: 30px">
         <input type="button" value="submit" class="button" onclick="isExcelFile()" style="margin-top: 30px">
       <table name ="gradeForExcel" id = "gradeForExcel">
             <tr>
                    <td>Student ID</td>
                    <td>Name</td>
                    <td>Grade</td>
                    <td>Attendance</td>
                    <td>Assignment1</td>
                    <td>Assignment2</td>
                    <td>Midterm</td>
                    <td>Final</td>  
                </tr>
                <% 
                   //ArrayList<StuBeans>stuList = stuBeansDB.getStuList();         
                   //int stuCounter = stuList.size();
                    if(gradeCounter > 0) {
                    //f3or(StuBeans slist : stuList)
                    for(GradeBeans glist : gradeList) {
                    %>
                <tr>
                    <td><%=glist.getStudentID()%></td>
                    <td>&nbsp;<%=glist.getName()%></td>
                    <td><%=glist.getGrade()%></td>
                    <td><%=glist.getAttendance()%></td>
                    <td><%=glist.getAssignment1()%></td>
                    <td><%=glist.getAssignment2()%></td>
                    <td><%=glist.getMidterm_exam()%></td>
                    <td><%=glist.getFinal_exam()%></td>
                </tr>
                <%}}%>
         </table>
    </form>
     <ul class="ratio">
        <li><div style="height:<%=avg_att%>px"><em><%=avg_att %></em><br>Attendance</div></li>
        <li><div style="height:<%=avg_ass1%>px"><em><%=avg_ass1 %></em><br>Assignment1</div></li>
        <li><div style="height:<%=avg_ass2%>px"><em><%=avg_ass2 %></em><br>Assignment2</div></li>
        <li><div style="height:<%=avg_mid%>px"><em><%=avg_mid %></em><br>Midterm Exam</div></li>
        <li><div style="height:<%=avg_fin%>px"><em><%=avg_fin %></em><br>Final Exam</div></li>
    </ul>
    </div>
</div>
<script>
<%
String job = (String)session.getAttribute("job");
if("Educator".equals(job))
{%>
	$('#grade').attr("href", "Grade_Input.jsp");
<%}%>
$('#gradeForExcel').hide();
function downloadExcelForm() {
	$("#excel_table").val($("#gradeForExcel").html());
	$("#excel_form").submit();
}
function isExcelFile() {
	var form = document.excel;
	var fileNameLength = form.file.value.length;
	
	if(form.file.value == "") {
		alert("Please Select a File!");
		return;
	}
	else if(form.file.value.substring(fileNameLength-3, fileNameLength) != "xls"/* &&
			form.file.value.substring(fileNameLength-4, fileNameLength) != "xlsx"*/) {
		alert("Please Upload a Excel File!\n * File Extension : .xls");
		return;
	}
	else {
		excel.submit();
	}
			
}
</script>
</body>
</html>