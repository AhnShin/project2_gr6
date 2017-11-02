package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import vo.Article;

public class BoardDao {
	private static BoardDao instance;
	public static BoardDao getInstance() {
		if(instance==null) {
			instance = new BoardDao();
		}
		return instance;
	}
	private BoardDao() {
		DBUtil.loadDriver();
	}
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int selectArticleCount() {
		con = DBUtil.makeConnection();
		String sql = "SELECT COUNT(*) FROM BOARD";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("boardDao selectArticleCount error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int selectMaxList() {
		con = DBUtil.makeConnection();
		String sql = "SELECT MAX(B_LIST) FROM BOARD";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("boardDao selectMaxList error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public int getListNumber(int replyNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT B_LIST FROM BOARD WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, replyNum);
			
			rs = pstmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
		} catch (SQLException e) {
			System.out.println("boardDao getListNumber error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}
	
	public List<Article> selectArticleList(int startRow, int count) {
		con = DBUtil.makeConnection();
		String sql = "SELECT ARTICLE_NUM, TITLE, WRITER, CONTENTS, READ_COUNT, WRITE_TIME, "
				+ "B_LIST, B_LEVEL, B_RIDX "
				+ "FROM BOARD ORDER BY B_LIST DESC, B_RIDX ASC LIMIT ?,?";
		List<Article> articleList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Article article = new Article();
				article.setArticleNum(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setWriter(rs.getString(3));
				article.setContents(rs.getString(4));
				article.setReadCount(rs.getInt(5));
				article.setWriteTime(rs.getTimestamp(6));
				article.setbList(rs.getInt(7));
				article.setbLevel(rs.getInt(8));
				article.setbRidx(rs.getInt(9));
				
				articleList.add(article);
			}
			
		} catch (SQLException e) {
			System.out.println("boardDao selectArticleList error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return articleList;
	}
	
	public int insert(Article article) {
		con = DBUtil.makeConnection();
		String sql = "INSERT INTO BOARD(TITLE, WRITER, CONTENTS, WRITE_TIME, B_LIST, B_LEVEL, B_RIDX) "
				+ "VALUES(?,?,?,?,?,?,?)";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getContents());
			pstmt.setTimestamp(4, new Timestamp(article.getWriteTime().getTime()));
			pstmt.setInt(5, article.getbList());
			pstmt.setInt(6, article.getbLevel());
			pstmt.setInt(7, article.getbRidx());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardDao insert error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public List<Integer> checkLevelRidx(int replyNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT B_LEVEL, B_RIDX FROM BOARD WHERE ARTICLE_NUM=?";
		List<Integer> checkList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, replyNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				checkList.add(rs.getInt(1));
				checkList.add(rs.getInt(2));
			}
			
		} catch (SQLException e) {
			System.out.println("boardDao checkBLevel error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return checkList;
	}
	
	public void increaseRidx(int list, int ridx) {
		con = DBUtil.makeConnection();
		String sql = "UPDATE BOARD SET B_RIDX=B_RIDX+1 WHERE B_LIST=? AND B_RIDX>?";
				
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, list);
			pstmt.setInt(2, ridx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("boardDao increasRidx error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
	}
	
	public Article select(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT ARTICLE_NUM, TITLE, WRITER, CONTENTS, WRITE_TIME, READ_COUNT"
				+ " FROM BOARD WHERE ARTICLE_NUM=?";
		Article article = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				article = new Article();
				article.setArticleNum(rs.getInt(1));
				article.setTitle(rs.getString(2));
				article.setWriter(rs.getString(3));
				article.setContents(rs.getString(4));
				article.setWriteTime(rs.getTimestamp(5));
				article.setReadCount(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			System.out.println("boardDao select error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return article;
	}
	
	public int updateReadCount(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "UPDATE BOARD SET READ_COUNT=READ_COUNT+1 WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardDao updateReadCount error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public int update (Article article) {
		con = DBUtil.makeConnection();
		String sql = "UPDATE BOARD SET TITLE=?, CONTENTS=?, WRITE_TIME=? WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContents());
			pstmt.setTimestamp(3, new Timestamp(article.getWriteTime().getTime()));
			pstmt.setInt(4, article.getArticleNum());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("boardDao update error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public int delete (int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "DELETE FROM BOARD WHERE ARTICLE_NUM=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("boardDao delete error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public String checkWriter(int articleNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT WRITER FROM BOARD WHERE ARTICLE_NUM=?";
		String writer = "";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNum);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				writer = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.out.println("boardDao checkWriter error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return writer;
	}
	
}
