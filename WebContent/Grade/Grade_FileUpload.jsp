<%@ page contentType="text/html;charset=UTF-8" 
%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
                 com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                 java.util.*, java.io.*, jxl.*"            
%>
<jsp:useBean id = "gradeBeans" class = "project.GradeBeans" scope ="page"/>
<jsp:useBean id = "gradeBeansDB" class = "project.GradeBeansDB" scope = "page"/>

<%
int class_unique_number = Integer.parseInt(request.getParameter("class_unique_number"));
int division = Integer.parseInt(request.getParameter("division"));
boolean success = false;
String formName = "";
String fileName = "";

int fileLength = 0;
	try{
		String savePath = request.getRealPath("/project_test/excelFile"); // 저장할 디렉토리 (절대경로)

		int sizeLimit = 30 * 1024 * 1024 ; // 5메가까지 제한 넘어서면 예외발생
		
		long fileSize = 0;
		
		MultipartRequest multi = new MultipartRequest(request, 
							   						  savePath, 
							   						  sizeLimit,
							   						  "UTF-8",
							   						  new DefaultFileRenamePolicy());
		
		Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환
		
		while(formNames.hasMoreElements()) {
			formName = (String)formNames.nextElement(); // 자료가 많을 경우엔 while 문을 사용
			fileName = multi.getFilesystemName(formName); // 파일의 이름 얻기
			fileLength = fileName.length();
			if(fileName != null) {
				fileSize = multi.getFile(formName).length();
			}
		} 
		
	    Workbook workbook= Workbook.getWorkbook(new File(savePath + "/" + fileName));
	    Sheet sheet=workbook.getSheet(0);
	    int count = 1;   // 모두 잘 들어갔는지 확인
	    int rowindex = 1; // 0 행은 항목행으로 제외한다.
	      // sheet1

		for(rowindex = 1; rowindex < sheet.getRows(); rowindex++) {
			int studentID = Integer.parseInt(sheet.getCell(0, rowindex).getContents());
			String name = sheet.getCell(1, rowindex).getContents();
			int attendance = Integer.parseInt(sheet.getCell(3, rowindex).getContents());
			int assignment1 = Integer.parseInt(sheet.getCell(4, rowindex).getContents());
			int assignment2 = Integer.parseInt(sheet.getCell(5, rowindex).getContents());
			int midterm_exam = Integer.parseInt(sheet.getCell(6, rowindex).getContents());
			int final_exam = Integer.parseInt(sheet.getCell(7, rowindex).getContents());
			if(gradeBeansDB.updateExcel(studentID, class_unique_number, division, attendance, assignment1, assignment2, midterm_exam, final_exam)) count++;
			//out.println(studentID + " " + class_unique_number + " " + division + "  " + attendance + " " + assignment1 + " " + assignment2 + " " + midterm_exam + " " + final_exam + "</br>");
		}
		if(count == rowindex) { 
			success = true;
			
		 	}
		else  {
			success = false;
			
		}
		workbook.close();
		out.println("<script>location.href = 'Grade_Input.jsp';</script>");
		
	}
	
	catch(Exception e) {
		out.println("예외 상황 발생..! " + e);

	} 
	
%>

