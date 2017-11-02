package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vo.Comment;

public class CommentDao {
	
	private static CommentDao instance;
	public static CommentDao getInstance() {
		if (instance==null) {
			instance = new CommentDao();
		}
		return instance;
	}
	private CommentDao() {
		DBUtil.loadDriver();
	}
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int insert(Comment comment) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO COMMENT(ARTICLE_NUM, WRITER, CONTENTS, WRITE_TIME, C_LEVEL, C_RIDX)"
				+ " VALUES(?,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment.getArticleNum());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContents());
			pstmt.setTimestamp(4, new Timestamp(comment.getWriteTime().getTime()));
			pstmt.setInt(5, comment.getcLevel());
			pstmt.setInt(6, comment.getcRidx());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("commentDao insert error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public List<Comment> selectCommentList(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT WRITER, WRITE_TIME, CONTENTS, C_LEVEL, C_RIDX FROM COMMENT WHERE ARTICLE_NUM=?"
				+ " ORDER BY C_RIDX ASC";
		List<Comment> commentList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Comment comment = new Comment();
				comment.setWriter(rs.getString(1));
				comment.setWriteTime(rs.getTimestamp(2));
				comment.setContents(rs.getString(3));
				comment.setcLevel(rs.getInt(4));
				comment.setcRidx(rs.getInt(5));
				
				commentList.add(comment);
			}
			
		} catch (SQLException e) {
			System.out.println("commentDao selectCommentList error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return commentList;
	}
	
	public int countComment (int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT COUNT(*) FROM COMMENT WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("commentDao countComment error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int selectMaxList(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT MAX(C_RIDX) FROM COMMENT WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("commentDao selectMaxList error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public void increaseRidx (int articleNum, int ridx) {
		con = DBUtil.makeConnection();
		String sql = "UPDATE COMMENT SET C_RIDX=C_RIDX+1 WHERE ARTICLE_NUM=? AND C_RIDX>?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			pstmt.setInt(2, ridx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("commentDao increaseRidx error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
	}
	
}
