package project;

import java.sql.*;
import java.util.ArrayList;

import javax.sql.*;
import javax.naming.*;

public class EduBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public EduBeansDB() {
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
	
	public boolean insertDB(EduBeans Educator) {
		boolean success = false;
		connect();
		String sql = "insert into Educator values(?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, Educator.getUniversity());
			pstmt.setString(2, Educator.getDepartment());
			pstmt.setString(3, Educator.getName());
			pstmt.setString(4, Educator.getId());
			pstmt.setString(5, Educator.getPassword());
			pstmt.setString(6, Educator.getEmail());
			pstmt.setString(7, Educator.getPhone());
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
		String sql = "select id from Educator where id = ?";
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
		String sql = "select password from Educator where id = ?";
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
		String SQL = "select name from Educator where id = ?";
		String name = "";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EduBeans elist = new EduBeans();
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
	
}

