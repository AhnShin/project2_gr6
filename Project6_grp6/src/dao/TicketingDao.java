package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Movie;

public class TicketingDao {
	private static TicketingDao instance;
	public static TicketingDao getInstance() {
		if (instance==null) {
			instance = new TicketingDao();
		}
		return instance;
	}
	private TicketingDao() {
		DBUtil.loadDriver();
	}
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public List<Movie> selectAllMovie() {
		con = DBUtil.makeConnection();
		String sql = "select movie_num, movie_date, movie_time, title, director, actor"
				+ " from movie_info";
		List<Movie> movieList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Movie movie = new Movie();
				movie.setMovieNum(rs.getInt(1));
				movie.setMovieDate(rs.getDate(2));
				movie.setMovieTime(rs.getTime(3));
				movie.setTitle(rs.getString(4));
				movie.setDirector(rs.getString(5));
				movie.setActor(rs.getString(6));
				
				movieList.add(movie);
			}
			
		} catch (SQLException e) {
			System.out.println("ticketingDao selectAllMovie error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return movieList;
	}
	
	public Movie selectMovie(int movieNum) {
		con = DBUtil.makeConnection();
		String sql = "select movie_num, movie_date, movie_time, title, director, actor"
				+ " from movie_info where movie_num=?";
		Movie movie = new Movie();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				movie.setMovieNum(rs.getInt(1));
				movie.setMovieDate(rs.getDate(2));
				movie.setMovieTime(rs.getTime(3));
				movie.setTitle(rs.getString(4));
				movie.setDirector(rs.getString(5));
				movie.setActor(rs.getString(6));
			}
			
		} catch (SQLException e) {
			System.out.println("ticketingDao selectMovie error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return movie;
	}
	
	public int selectMovieNum(String id) {
		con = DBUtil.makeConnection();
		String sql = "select movie_num from pay where id=?";
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("ticketingDao selectMovieNum error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
		
	}
	
	public String selectSeat(String id) {
		con = DBUtil.makeConnection();
		String sql = "select seat from pay where id=?";
		String result = "";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.out.println("ticketingDao selectMovieNum error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		
		return result;
	}
	
	public void cancelTicketing(String id) {
		con = DBUtil.makeConnection();
		String sql = "delete from pay where id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("ticketingDao selectMovieNum error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
	}
	
}
