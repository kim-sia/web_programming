package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class StuClassBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public StuClassBeansDB() {
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
	public ArrayList<StuClassBeans> getClassList(String studentID) {
		connect();
		ArrayList<StuClassBeans> list = new ArrayList<StuClassBeans> ();
		String SQL = "select * from studentClass where studentID = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, studentID);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StuClassBeans slist = new StuClassBeans();
				slist.setClass_unique_number(rs.getInt("class_unique_number"));
				slist.setDivision(rs.getInt("division"));
				list.add(slist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public boolean insertDB(StuClassBeans stuClass) {
		boolean success = false;
		connect();
		String sql = "insert into studentClass values(?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, stuClass.getStudentID());
			pstmt.setInt(2, stuClass.getClass_unique_number());
			pstmt.setInt(3, stuClass.getDivision());
			
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
