package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class EduClassBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public EduClassBeansDB() {
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
	public ArrayList<EduClassBeans> getClassList(String id) {
		connect();
		ArrayList<EduClassBeans> list = new ArrayList<EduClassBeans> ();
		String SQL = "select * from educatorClass where id = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EduClassBeans slist = new EduClassBeans();
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
	
	public boolean insertDB(EduClassBeans eduClass) {
		boolean success = false;
		connect();
		String sql = "insert into educatorClass values(?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, eduClass.getId());
			pstmt.setInt(2, eduClass.getClass_unique_number());
			pstmt.setInt(3, eduClass.getDivision());
			
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
