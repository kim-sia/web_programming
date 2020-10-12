package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class BoardBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public BoardBeansDB() {
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
	
	public ArrayList<BoardBeans> boardList() {
		connect();
		ArrayList<BoardBeans> list = new ArrayList<BoardBeans> ();
		String SQL = "select * from pro_board";
		try {
			pstmt = con.prepareStatement(SQL);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBeans blist = new BoardBeans();
				blist.setBoard(rs.getInt("board"));
				blist.setName(rs.getString("name"));
				blist.setTitle(rs.getString("title"));
				blist.setContent(rs.getString("content"));
				blist.setPassword(rs.getString("password"));
				blist.setFileName(rs.getString("fileName"));
				blist.setOriginalName(rs.getString("originalName"));
				blist.setDate(rs.getTimestamp("date"));
				list.add(blist);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public BoardBeans boardGet(int board) {
		connect();
		String SQL = "select * from pro_board where board = ?";
		BoardBeans blist = new BoardBeans();
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, board);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); 
			blist.setBoard(rs.getInt("board"));
			blist.setName(rs.getString("name"));
			blist.setTitle(rs.getString("title"));
			blist.setContent(rs.getString("content"));
			blist.setPassword(rs.getString("password"));
			blist.setFileName(rs.getString("fileName"));
			blist.setOriginalName(rs.getString("originalName"));
			blist.setDate(rs.getTimestamp("date"));
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return blist;
	}
	
	public boolean insertDB(BoardBeans board) {
		boolean success = false;
		connect();
		String sql = "insert into pro_board values(0, ?, ?, ?, ?, ?, ?, curdate())";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPassword());
			pstmt.setString(5, board.getFileName());
			pstmt.setString(6, board.getOriginalName());
			
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
