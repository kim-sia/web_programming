package project;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class StuBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public StuBeansDB() {
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
	
	public boolean insertDB(StuBeans Student) {
		boolean success = false;
		connect();
		String sql = "insert into Student values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, Student.getUniversity());
			pstmt.setString(2, Student.getDepartment());
			pstmt.setString(3, Student.getStudentID());
			pstmt.setString(4, Student.getGrade());
			pstmt.setString(5, Student.getName());
			pstmt.setString(6, Student.getPassword());
			pstmt.setString(7, Student.getEmail());
			pstmt.setString(8, Student.getPhone());
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
	
	public boolean checkID(String id) {
		boolean success = false;
		connect();
		String sql = "select studentID from Student where studentID = ?";
		try {
			pstmt =con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				success = true;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		} return success;
	}
	
	public boolean Login(String id, String pw) {
		boolean success = false;
		connect();
		String sql = "select password from Student where studentID = ?";
		String dbPw = "";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPw = rs.getString("password");
				if(dbPw.equals(pw))
					success = true;
			}else {
				success = false;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		} return success;
	}
	
	public String getName(String id) {
		connect();
		String SQL = "select name from Student where studentID = ?";
		String name = "";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StuBeans slist = new StuBeans();
				name  = rs.getString("name");
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return name;
	}
	
	public int getGrade(String id) {
		connect();
		String SQL = "select grade from Student where studentID = ?";
		int grade = 0;
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StuBeans slist = new StuBeans();
				grade  = rs.getInt("grade");
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return grade;
	}
}
