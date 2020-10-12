package project;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class AttendanceBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public AttendanceBeansDB() {
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
	public ArrayList<AttendanceBeans> getAttendanceBeansList(int class_unique_number, int division) {
		connect();
		ArrayList<AttendanceBeans> list = new ArrayList<AttendanceBeans>();
		String SQL = "select * from attendance where class_unique_number = ? && division = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			pstmt.setInt(2, division);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AttendanceBeans alist = new AttendanceBeans();
				alist.setStudentID(rs.getInt("studentID"));
				alist.setName(rs.getString("name"));
				alist.setClass_unique_number(rs.getInt("class_unique_number"));
				alist.setDivision(rs.getInt("division"));
				alist.setNumber_of_times(rs.getInt("number_of_times"));
				list.add(alist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public boolean updateAttendance(int id, int cnum, int division) {
		boolean success = false;
		connect();
		String sql = "update attendance set number_of_times = number_of_times + 1 where studentID = ? && class_unique_number = ? && division = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, id);
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
	
	public boolean updateAttendance1(AttendanceBeans attendance) {
		boolean success = false;
		connect();
		String sql = "update attendance set number_of_times = ? where studentID = ? && class_unique_number = ? && division = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, attendance.getNumber_of_times());
			pstmt.setInt(2, attendance.getStudentID());
			pstmt.setInt(3, attendance.getClass_unique_number());
			pstmt.setInt(4, attendance.getDivision());
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
	
	public boolean insertInfo(AttendanceBeans attendance) {
		boolean success = false;
		connect();
		String sql = "insert into attendance values(?, ?, ?, ?, 0)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, attendance.getStudentID());
			pstmt.setString(2, attendance.getName());
			pstmt.setInt(3, attendance.getClass_unique_number());
			pstmt.setInt(4, attendance.getDivision());
			
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
}
