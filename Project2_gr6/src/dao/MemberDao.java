package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.Member;

public class MemberDao {
	private static MemberDao instance;
	public static MemberDao getInstance() {
		if (instance==null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	private MemberDao() {
		DBUtil.loadDriver();
	}
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int selectIdCount(String id) {
		con = DBUtil.makeConnection();
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
		} catch (SQLException e) {
			System.out.println("boardDao selectIdCount error");
			e.printStackTrace();
		}
		return result;
	}
	
	public int insert(Member member) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO MEMBER(ID,PW,NAME,PHONE) VALUES(?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("memberdao insert error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public String selectIdUsingIdPw (String id, String pw) {
		con = DBUtil.makeConnection();
		String sql = "SELECT ID FROM MEMBER WHERE ID=? AND PW=?";
		String result = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.out.println("memberdao idcheck error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
}
