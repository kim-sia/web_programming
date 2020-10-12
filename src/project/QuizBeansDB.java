package project;

import java.sql.*;
import java.util.ArrayList;
import javax.sql.*;
import javax.naming.*;

public class QuizBeansDB {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private DataSource ds = null;

	public QuizBeansDB() {
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
	
	public ArrayList<QuizBeans> quizList(int class_unique_number) {
		connect();
		ArrayList<QuizBeans> list = new ArrayList<QuizBeans> ();
		String SQL = "select * from quiz where class_unique_number = ?";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, class_unique_number);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QuizBeans qlist = new QuizBeans();
				qlist.setQ1(rs.getString("q1"));
				qlist.setQ2(rs.getString("q2"));
				qlist.setQ3(rs.getString("q3"));
				qlist.setQ4(rs.getString("q4"));
				qlist.setQ5(rs.getString("q5"));
				qlist.setQ1_1(rs.getString("q1_1"));
				qlist.setQ1_2(rs.getString("q1_2"));
				qlist.setQ1_3(rs.getString("q1_3"));
				qlist.setQ1_4(rs.getString("q1_4"));
				qlist.setQ1_5(rs.getString("q1_5"));
				qlist.setQ2_1(rs.getString("q2_1"));
				qlist.setQ2_2(rs.getString("q2_2"));
				qlist.setQ2_3(rs.getString("q2_3"));
				qlist.setQ2_4(rs.getString("q2_4"));
				qlist.setQ2_5(rs.getString("q2_5"));
				qlist.setQ3_1(rs.getString("q3_1"));
				qlist.setQ3_2(rs.getString("q3_2"));
				qlist.setQ3_3(rs.getString("q3_3"));
				qlist.setQ3_4(rs.getString("q3_4"));
				qlist.setQ3_5(rs.getString("q3_5"));
				qlist.setQ4_1(rs.getString("q4_1"));
				qlist.setQ4_2(rs.getString("q4_2"));
				qlist.setQ4_3(rs.getString("q4_3"));
				qlist.setQ4_4(rs.getString("q4_4"));
				qlist.setQ4_5(rs.getString("q4_5"));
				qlist.setQ5_1(rs.getString("q5_1"));
				qlist.setQ5_2(rs.getString("q5_2"));
				qlist.setQ5_3(rs.getString("q5_3"));
				qlist.setQ5_4(rs.getString("q5_4"));
				qlist.setQ5_5(rs.getString("q5_5"));
				qlist.setA1(rs.getInt("a1"));
				qlist.setA2(rs.getInt("a2"));
				qlist.setA3(rs.getInt("a3"));
				qlist.setA4(rs.getInt("a4"));
				qlist.setA5(rs.getInt("a5"));
				list.add(qlist);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	public boolean insertDB(QuizBeans quiz) {
		boolean success = false;
		connect();
		String sql = "insert into quiz values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, quiz.getClass_unique_number());
			
			pstmt.setString(2, quiz.getQ1());
			pstmt.setString(3, quiz.getQ2());
			pstmt.setString(4, quiz.getQ3());
			pstmt.setString(5, quiz.getQ4());
			pstmt.setString(6, quiz.getQ5());
			
			pstmt.setString(7, quiz.getQ1_1());
			pstmt.setString(8, quiz.getQ1_2());
			pstmt.setString(9, quiz.getQ1_3());
			pstmt.setString(10, quiz.getQ1_4());
			pstmt.setString(11, quiz.getQ1_5());
			
			pstmt.setString(12, quiz.getQ2_1());
			pstmt.setString(13, quiz.getQ2_2());
			pstmt.setString(14, quiz.getQ2_3());
			pstmt.setString(15, quiz.getQ2_4());
			pstmt.setString(16, quiz.getQ2_5());
			
			pstmt.setString(17, quiz.getQ3_1());
			pstmt.setString(18, quiz.getQ3_2());
			pstmt.setString(19, quiz.getQ3_3());
			pstmt.setString(20, quiz.getQ3_4());
			pstmt.setString(21, quiz.getQ3_5());
			
			pstmt.setString(22, quiz.getQ4_1());
			pstmt.setString(23, quiz.getQ4_2());
			pstmt.setString(24, quiz.getQ4_3());
			pstmt.setString(25, quiz.getQ4_4());
			pstmt.setString(26, quiz.getQ4_5());
			
			pstmt.setString(27, quiz.getQ5_1());
			pstmt.setString(28, quiz.getQ5_2());
			pstmt.setString(29, quiz.getQ5_3());
			pstmt.setString(30, quiz.getQ5_4());
			pstmt.setString(31, quiz.getQ5_5());
			
			pstmt.setInt(32, quiz.getA1());
			pstmt.setInt(33, quiz.getA2());
			pstmt.setInt(34, quiz.getA3());
			pstmt.setInt(35, quiz.getA4());
			pstmt.setInt(36, quiz.getA5());
			
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
