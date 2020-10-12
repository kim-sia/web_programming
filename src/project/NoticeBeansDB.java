package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class NoticeBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public NoticeBeansDB() {
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
	
	public ArrayList<NoticeBeans> noticeList() {
		connect();
		ArrayList<NoticeBeans> list = new ArrayList<NoticeBeans> ();
		String SQL = "select * from notice";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeBeans nlist = new NoticeBeans();
				nlist.setNotice(rs.getInt("notice"));
				nlist.setName(rs.getString("name"));
				nlist.setTitle(rs.getString("title"));
				nlist.setContent(rs.getString("content"));
				nlist.setFileName(rs.getString("fileName"));
				nlist.setOriginalName(rs.getString("originalName"));
				nlist.setDate(rs.getTimestamp("date"));
				list.add(nlist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public NoticeBeans noticeGet(int notice) {
		connect();
		String SQL = "select * from notice where notice = ?";
		NoticeBeans nlist = new NoticeBeans();
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, notice);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); 
			nlist.setNotice(rs.getInt("notice"));
			nlist.setName(rs.getString("name"));
			nlist.setTitle(rs.getString("title"));
			nlist.setContent(rs.getString("content"));
			nlist.setFileName(rs.getString("fileName"));
			nlist.setOriginalName(rs.getString("originalName"));
			nlist.setDate(rs.getTimestamp("date"));
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return nlist;
	}
	
	public boolean insertDB(NoticeBeans notice) {
		boolean success = false;
		connect();
		String sql = "insert into notice values(0, ?, ?, ?, ?, ?, curdate())";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, notice.getName());
			pstmt.setString(2, notice.getTitle());
			pstmt.setString(3, notice.getContent());
			pstmt.setString(4, notice.getFileName());
			pstmt.setString(5, notice.getOriginalName());
			
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
	
	public boolean deleteDB(int index) {
		boolean success = false;
		connect();
		String sql = "delete from notice where notice = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, index);
			pstmt.executeUpdate();
			success = true;
		} catch(SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disconnect();
		}
		return success;
	}
}