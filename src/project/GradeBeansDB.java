package project;        

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.sql.*;

import javax.naming.*;

public class GradeBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public GradeBeansDB() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void connect() {
		try {
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<project.GradeBeans> getGradeList() {
		connect();
		ArrayList<GradeBeans> list = new ArrayList<GradeBeans>();
		String SQL = "select * from grade";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GradeBeans gradeB = new GradeBeans();
				gradeB.setStudentID(rs.getInt("studentID"));
				gradeB.setName(rs.getString("name"));
				gradeB.setGrade(rs.getInt("grade"));
				gradeB.setAssignment1(rs.getInt("assignment1"));
				gradeB.setAssignment2(rs.getInt("assignment2"));
				gradeB.setMidterm_exam(rs.getInt("midterm_exam"));
				gradeB.setFinal_exam(rs.getInt("final_exam"));
				gradeB.setAttendance(rs.getInt("attendance"));
				list.add(gradeB);
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<GradeBeans> getList_Edu(int class_unique_number, int division) {
		connect();
		ArrayList<GradeBeans> list = new ArrayList<GradeBeans> ();
		String SQL = "select * from grade where class_unique_number = ? && division = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			pstmt.setInt(2, division);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GradeBeans gradeB = new GradeBeans();
				gradeB.setStudentID(rs.getInt("studentID"));
				gradeB.setName(rs.getString("name"));
				gradeB.setGrade(rs.getInt("grade"));
				gradeB.setAssignment1(rs.getInt("assignment1"));
				gradeB.setAssignment2(rs.getInt("assignment2"));
				gradeB.setMidterm_exam(rs.getInt("midterm_exam"));
				gradeB.setFinal_exam(rs.getInt("final_exam"));
				gradeB.setAttendance(rs.getInt("attendance"));
				list.add(gradeB);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public GradeBeans getGrade(int id) {
		connect();
		String SQL = "select * from grade where studentID = ?";
		GradeBeans gradeB = new GradeBeans();
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			gradeB.setStudentID(rs.getInt("studentID"));
			gradeB.setName(rs.getString("name"));
			gradeB.setClass_unique_number(rs.getInt("class_unique_number"));
			gradeB.setDivision(rs.getInt("division"));
			gradeB.setGrade(rs.getInt("grade"));
			gradeB.setAssignment1(rs.getInt("assignment1"));
			gradeB.setAssignment2(rs.getInt("assignment2"));
			gradeB.setMidterm_exam(rs.getInt("midterm_exam"));
			gradeB.setFinal_exam(rs.getInt("final_exam"));
			gradeB.setAttendance(rs.getInt("attendance"));
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return gradeB;
	}
	public ArrayList<GradeBeans> getMyGradeList(String studentID) {
		connect();
		ArrayList<GradeBeans> list = new ArrayList<GradeBeans>();
		String SQL = "select * from grade where studentID = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GradeBeans gradeB = new GradeBeans();
				gradeB.setStudentID(rs.getInt("studentID"));
				gradeB.setName(rs.getString("name"));
				gradeB.setGrade(rs.getInt("grade"));
				gradeB.setAssignment1(rs.getInt("assignment1"));
				gradeB.setAssignment2(rs.getInt("assignment2"));
				gradeB.setMidterm_exam(rs.getInt("midterm_exam"));
				gradeB.setFinal_exam(rs.getInt("final_exam"));
				gradeB.setAttendance(rs.getInt("attendance"));
				gradeB.setClass_unique_number(rs.getInt("class_unique_number"));
				list.add(gradeB);
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
	}
	
	public boolean insertInfo(GradeBeans grade) {
		boolean success = false;
		connect();
		String sql = "insert into grade values(?, ?, ?, ?, ?, 0, 0, 0, 0, 0)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, grade.getStudentID());
			pstmt.setString(2, grade.getName());
			pstmt.setInt(3, grade.getGrade());
			pstmt.setInt(4, grade.getClass_unique_number());
			pstmt.setInt(5, grade.getDivision());
			
			pstmt.executeUpdate();
			success = true;
		} catch(SQLException e) {
			e.printStackTrace();
			return success;
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean updateAssignment1(GradeBeans grade) {
		boolean success = false;
		connect();
		String sql = "update grade set assignment1 = ? where studentID = ? && class_unique_number = ? && division = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, grade.getAssignment1());
			pstmt.setInt(2, grade.getStudentID());
			pstmt.setInt(3, grade.getClass_unique_number());
			pstmt.setInt(4, grade.getDivision());
			int rowUdt = pstmt.executeUpdate();
			if(rowUdt == 1) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
		
	}
	
	public boolean updateAssignment2(GradeBeans grade) {
		boolean success = false;
		connect();
		String sql = "update grade set assignment2 = ? where studentID = ? && class_unique_number = ? && division = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, grade.getAssignment2());
			pstmt.setInt(2, grade.getStudentID());
			pstmt.setInt(3, grade.getClass_unique_number());
			pstmt.setInt(4, grade.getDivision());
			int rowUdt = pstmt.executeUpdate();
			if(rowUdt == 1) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
		
	}
	
	public boolean updateDB(GradeBeans grade, int id, int cnum) {
		boolean success = false;
		connect();
		String sql = "update grade set assignment1 = ?, assignment2 = ?, midterm_exam = ?, final_exam = ?, attendance = ? where studentID = ? && class_unique_number = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, grade.getAssignment1());
			pstmt.setInt(2, grade.getAssignment2());
			pstmt.setInt(3, grade.getMidterm_exam());
			pstmt.setInt(4, grade.getFinal_exam());
			pstmt.setInt(5, grade.getAttendance());
			pstmt.setInt(6, id);
			pstmt.setInt(7, cnum);
			int rowUdt = pstmt.executeUpdate();
			if(rowUdt == 1) success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean updateAttendance(int studentID, int cnum, int division) {
		boolean success = false;
		connect();
		String sql = "update grade set attendance = attendance + 1 where studentID = ? && class_unique_number = ? && division = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, studentID);
			pstmt.setInt(2, cnum);
			pstmt.setInt(3, division);
			pstmt.executeUpdate();
			success = true;
		} catch(SQLException e) {
			e.printStackTrace();
			return success;
		}finally {
			disconnect();
		}
		return success;
	}
	
	public boolean updateExcel(int studentID, int class_unique_number, int division, 
							   int attendance, int assignment1, int assignment2, int midterm_exam, int final_exam) 
							   throws IOException, SQLException {
		
		boolean isSuccess = false;
		
		connect();
		String sql = "update grade set attendance = ?, assignment1 = ?, assignment2 = ?, midterm_exam = ?, final_exam = ? where studentID = ? and class_unique_number = ? and division = ?";

			try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, attendance);
			pstmt.setInt(2, assignment1);
			pstmt.setInt(3, assignment2);
			pstmt.setInt(4, midterm_exam);
			pstmt.setInt(5, final_exam);
			pstmt.setInt(6, studentID);
			pstmt.setInt(7, class_unique_number);
			pstmt.setInt(8, division);
			pstmt.executeUpdate();
			sql = "update attendance set number_of_times = ? where studentID = ? and class_unique_number = ? and division = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, attendance);
			pstmt.setInt(2, studentID);
			pstmt.setInt(3, class_unique_number);
			pstmt.setInt(4, division);
			int cnt = pstmt.executeUpdate();
			if(cnt==1) isSuccess = true;
			else isSuccess = false;
			} catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
		
		
		return isSuccess;
	}
}

