package project;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import javax.naming.*;

public class ClassBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;
	
	public ClassBeansDB() {
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
	
	public ArrayList<ClassBeans> getClassList() {
		connect();
		ArrayList<ClassBeans> list = new ArrayList<ClassBeans> ();
		String SQL = "select * from Class";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClassBeans clist = new ClassBeans();
				clist.setClass_unique_number(rs.getInt("class_unique_number"));
				clist.setUniversity(rs.getString("university"));
				clist.setDepartment(rs.getString("department"));
				clist.setYear(rs.getInt("year"));
				clist.setSemester(rs.getInt("semester"));
				clist.setClass_name(rs.getString("class_name"));
				clist.setDivision(rs.getInt("division"));
				list.add(clist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public ArrayList<ClassBeans> getClassName(int unique_num) {
		connect();
		ArrayList<ClassBeans> list = new ArrayList<ClassBeans> ();
		String SQL = "select class_name from Class where class_unique_number = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, unique_num);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				ClassBeans clist = new ClassBeans();
				clist.setClass_name(rs.getString("class_name"));
				list.add(clist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public String getClassName1(int class_unique_number) {
		connect();
		String name = "wrong";
		String SQL = "select class_name from Class where class_unique_number = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClassBeans clist = new ClassBeans();
				name = rs.getString("class_name");
				
			}
			rs.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return name;
	}
	
	public String[] check(String id, String job) {
		connect();
		String list[] = {};
		String sql = "";
		if(job == "Educator") {
			sql = "select university, department from Educator where id = ?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					EduBeans elist = new EduBeans();
					elist.setUniversity(rs.getString("university"));
					elist.setDepartment(rs.getString("department"));
					list[0] = elist.getUniversity();
					list[1] = elist.getDepartment();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
		}
		else if(job == "Student") {
			sql = "select university, department from Student where studentID = ?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					StuBeans slist = new StuBeans();
					slist.setUniversity(rs.getString("university"));
					slist.setDepartment(rs.getString("department"));
					list[0] = slist.getUniversity();
					list[1] = slist.getDepartment();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
		}
		return list;
		
	}
	
}