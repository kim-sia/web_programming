package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class SubmitBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public SubmitBeansDB() {
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
	public ArrayList<SubmitBeans> submitList(int class_unique_number, int division, int number) {
		connect();
		ArrayList<SubmitBeans> list = new ArrayList<SubmitBeans> ();
		String SQL = "select * from submit where class_unique_number = ? && division = ? && number = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			pstmt.setInt(2, division);
			pstmt.setInt(3, number);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SubmitBeans slist = new SubmitBeans();
				slist.setStudentID(rs.getInt("studentID"));
				slist.setName(rs.getString("name"));
				slist.setOriginalName(rs.getString("originalName"));
				slist.setFileName(rs.getString("fileName"));
				slist.setTime(rs.getDate("time"));
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
	
	public boolean insertDB(SubmitBeans submit) {
		boolean success = false;
		connect();
		String sql = "insert into submit values(?, ?, ?, ?, ?, sysdate(), ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, submit.getClass_unique_number());
			pstmt.setInt(2, submit.getDivision());
			pstmt.setInt(3, submit.getNumber());
			pstmt.setInt(4, submit.getStudentID());
			pstmt.setString(5, submit.getName());
			pstmt.setString(6, submit.getFileName());
			pstmt.setString(7, submit.getOriginalName());
			
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
