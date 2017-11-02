package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.SeatVO;

public class SeatDao {
	////////////////////////////////////////////////////////////
	// singleton
	private static SeatDao instance;

	public static SeatDao getInstance() {
		if (instance == null) {
			instance = new SeatDao();
		}
		return instance;
	}

	private SeatDao() {
		DBUtil.loadDriver(); // mysql 드라이버 로딩
	}

	////////////////////////////////////////////////////////////
	// DB 연결, 해제 관련 필드와 메소드들
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	////////////////////////////////////////////////////////////
	// SQL 실행 메소드
	/* 좌석 선택 메소드 */
	public int insertSeat(SeatVO seatVO) {
		con = DBUtil.makeConnection();
		String sql = "UPDATE SEAT_INFO SET SEAT1=?,SEAT2=?,SEAT3=?,SEAT4=?,"
				+ "SEAT5=?,SEAT6=?,SEAT7=?,SEAT8=?,SEAT9=?,SEAT10=?,SEAT11=?,"
				+ "SEAT12=?,SEAT13=?,SEAT14=?,SEAT15=?,SEAT16=?,SEAT17=?,SEAT18=?,"
				+ "SEAT19=?,SEAT20=? WHERE MOVIE_NUM=?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(21, seatVO.getMovieNum());
			
			for (int i = 0; i < 20; i++) {
				pstmt.setInt(i + 1, seatVO.getSeat(i));
			}

			result = pstmt.executeUpdate(); // SQL 실행
		} catch (SQLException e) {
			System.out.println("dao update 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return result;
	}

	/* 예약 좌석 확인 메소드 */
	public SeatVO reservation(int movieNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT SEAT1,SEAT2,SEAT3,SEAT4,SEAT5,SEAT6,SEAT7,SEAT8,SEAT9,SEAT10,SEAT11,SEAT12,SEAT13,SEAT14,SEAT15,SEAT16,SEAT17,SEAT18,SEAT19,SEAT20 FROM SEAT_INFO WHERE MOVIE_NUM=?";

		SeatVO seatVO = new SeatVO();
		int[] seat = new int[20];
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);

			rs = pstmt.executeQuery(); // SQL 실행
			if (rs.next()) {
				for (int i = 0; i < 20; i++) {
					seat[i] = rs.getInt(i + 1);
				}
			}
			seatVO.setMovieNum(movieNum);
			seatVO.setSeat(seat);
		} catch (SQLException e) {
			System.out.println("dao reservation 에러");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return seatVO;
	}
	///////////////////////////////////////////////////////////
	
	public void insertPay(String id, int movieNum, String seat) {
		con = DBUtil.makeConnection();
		String sql = "insert into pay(id, movie_num, seat) values(?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, movieNum);
			pstmt.setString(3, seat);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("seatdao insertPay error");
			e.printStackTrace();
		}
		
	}
	
	// 취소를 위한 db확인
	public List<Integer> reservationCheck(int movieNum) {
		con = DBUtil.makeConnection();
		String sql = "SELECT SEAT1,SEAT2,SEAT3,SEAT4,SEAT5,SEAT6,SEAT7,SEAT8,SEAT9,SEAT10,SEAT11,SEAT12,SEAT13,SEAT14,SEAT15,SEAT16,SEAT17,SEAT18,SEAT19,SEAT20 FROM SEAT_INFO WHERE MOVIE_NUM=?";
		List<Integer> seatList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movieNum);

			rs = pstmt.executeQuery(); // SQL 실행
			
			if (rs.next()) {
				for (int i = 0; i < 20; i++) {
					seatList.add(rs.getInt(i + 1));
				}
			}
			
		} catch (SQLException e) {
			System.out.println("seatDao reservationCheck error");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return seatList;
	}
	
	// 취소를 위한 업데이트
	public void reservationUpdate(int movieNum, List<Integer> seatList) {
		con = DBUtil.makeConnection();
		String sql = "update seat_info set seat1=?, seat2=?, seat3=?, seat4=?, seat5=?, "
				+ "seat6=?, seat7=?, seat8=?, seat9=?, seat10=?, "
				+ "seat11=?, seat12=?, seat13=?, seat14=?, seat15=?, "
				+ "seat16=?, seat17=?, seat18=?, seat19=?, seat20=? "
				+ "where movie_num=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			int i = 0;
			for (Integer seat: seatList) {
				i++;
				pstmt.setInt(i, seat);
			}
			pstmt.setInt(21, movieNum);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("seatDao reservationUpdate error");
			e.printStackTrace();
		} finally {
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
	}

}
