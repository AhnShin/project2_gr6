package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.FileInfoVO;
import vo.MovieVO;

public class MovieDao {
	//singleton
		private static MovieDao instance;
		public static MovieDao getInstance() {
			if(instance==null)
				instance = new MovieDao();
			return instance;
		}
		public MovieDao() {
			DBUtil.loadDriver();
		}
	///////////////////////////////////////////////////////////////////////////////////
		private Connection con;
		private PreparedStatement pstmt;
		private ResultSet rs;
	///////////////////////////////////////////////////////////////////////////////////
		public List<MovieVO> selectList() {
			con =  DBUtil.makeConnection();
			String sql = "SELECT MOVIE_NUM, TITLE, DIRECTOR, YEAR, MOVIE_IMG FROM MOVIE";
			List<MovieVO> movieVOList = new ArrayList<>();
			
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MovieVO fileVO = new MovieVO();
					fileVO.setMovie_num(rs.getInt(1));
					fileVO.setTitle(rs.getString(2));
					fileVO.setDirector(rs.getString(3));
					fileVO.setYear(rs.getInt(4));
					fileVO.setMovie_img(rs.getString(5));
					
					
					movieVOList.add(fileVO);
				}
				
			} catch (SQLException e) {
				System.out.println("selectList 오류");
				e.printStackTrace();
			} finally {
				DBUtil.closeRs(rs);
				DBUtil.closePstmt(pstmt);
				DBUtil.closeCon(con);
			}
			return movieVOList;
		}
	////////////////////////////////////////////////////////////////////////////
		public MovieVO select(int fileNum) {
			con =  DBUtil.makeConnection();
			String sql = "SELECT MOVIE_NUM, TITLE, DIRECTOR, YEAR, MOVIE_IMG FROM MOVIE WHERE MOVIE_NUM=?";
			MovieVO fileVO = null;
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fileNum);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					fileVO = new MovieVO();
					fileVO.setMovie_num(rs.getInt(1));
					fileVO.setTitle(rs.getString(2));
					fileVO.setDirector(rs.getString(3));
					fileVO.setYear(rs.getInt(4));
					fileVO.setMovie_img(rs.getString(5));
				}
				
			} catch (SQLException e) {
				System.out.println("dao select 오류");
				e.printStackTrace();
			} finally {
				DBUtil.closeRs(rs);
				DBUtil.closePstmt(pstmt);
				DBUtil.closeCon(con);
			}
			return fileVO;
		}

	}
