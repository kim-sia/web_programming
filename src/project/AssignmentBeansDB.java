package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;


public class AssignmentBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public AssignmentBeansDB() {
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
	
	public ArrayList<AssignmentBeans> assignmentList() {
		connect();
		ArrayList<AssignmentBeans> list = new ArrayList<AssignmentBeans> ();
		String SQL = "select * from assignment";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AssignmentBeans alist = new AssignmentBeans();
				alist.setClass_unique_number(rs.getInt("class_unique_number"));
				alist.setDivision(rs.getInt("division"));
				alist.setNumber(rs.getInt("number"));
				alist.setName(rs.getString("name"));
				alist.setTitle(rs.getString("title"));
				alist.setContent(rs.getString("content"));
				alist.setDeadline(rs.getDate("deadline"));
				alist.setFileName(rs.getString("fileName"));
				alist.setOriginalName(rs.getString("originalName"));
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
	
	public ArrayList<AssignmentBeans> assignmentGet(int class_unique_number, int division) {
		connect();
		ArrayList<AssignmentBeans> list = new ArrayList<AssignmentBeans> ();
		String SQL = "select * from assignment where class_unique_number = ? && division = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			pstmt.setInt(2, division);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AssignmentBeans alist = new AssignmentBeans();
				alist.setClass_unique_number(rs.getInt("class_unique_number"));
				alist.setDivision(rs.getInt("division"));
				alist.setNumber(rs.getInt("number"));
				alist.setName(rs.getString("name"));
				alist.setTitle(rs.getString("title"));
				alist.setContent(rs.getString("content"));
				alist.setDeadline(rs.getDate("deadline"));
				alist.setFileName(rs.getString("fileName"));
				alist.setOriginalName(rs.getString("originalName"));
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
	public AssignmentBeans assignmentDetail(int class_unique_number, int division, int number) {
		connect();
		String SQL = "select * from assignment where class_unique_number = ? and division = ? and number = ?";
		AssignmentBeans alist = new AssignmentBeans();
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			pstmt.setInt(2, division);
			pstmt.setInt(3, number);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); 
			alist.setTitle(rs.getString("title"));
			alist.setContent(rs.getString("content"));
			alist.setDeadline(rs.getDate("deadline"));
			alist.setFileName(rs.getString("fileName"));
			alist.setOriginalName(rs.getString("originalName"));
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return alist;
	}
	
	public boolean insertDB(AssignmentBeans assignment) {
		boolean success = false;
		connect();
		String sql = "insert into assignment values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, assignment.getClass_unique_number());
			pstmt.setInt(2, assignment.getDivision());
			pstmt.setInt(3, assignment.getNumber());
			pstmt.setString(4, assignment.getName());
			pstmt.setString(5, assignment.getTitle());
			pstmt.setString(6, assignment.getContent());
			pstmt.setDate(7, new java.sql.Date(assignment.getDeadline().getTime()));
			pstmt.setString(8, assignment.getFileName());
			pstmt.setString(9, assignment.getOriginalName());
			
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
