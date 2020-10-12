package project;
import java.util.Date;
public class SubmitBeans {
	private int class_unique_number;
	private int division;
	private int number;
	private int studentID;
	private String name;
	private Date time;
	private String fileName;
	private String originalName;
	
	public int getClass_unique_number() {
		return class_unique_number;
	}
	public void setClass_unique_number(int class_unique_number) {
		this.class_unique_number = class_unique_number;
	}
	public int getDivision() {
		return division;
	}
	public void setDivision(int division) {
		this.division = division;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getStudentID() {
		return studentID;
	}
	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginalName() {
		return originalName;
	}
	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}
	
}
