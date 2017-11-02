package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.FileInfo;

import vo.FileInfoVO;

public class FoodDao {
	//singleton
	private static FoodDao instance;
	public static FoodDao getInstance() {
		if(instance==null)
			instance = new FoodDao();
		return instance;
	}
	public FoodDao() {
		DBUtil.loadDriver();
	}
///////////////////////////////////////////////////////////////////////////////////
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
///////////////////////////////////////////////////////////////////////////////////
	public List<FileInfoVO> selectList() {
		con =  DBUtil.makeConnection();
		String sql = "SELECT FOOD_NUM, NAME, PRICE, FILENAME FROM FOOD";
		List<FileInfoVO> fileVOList = new ArrayList<>();
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				FileInfoVO fileVO = new FileInfoVO();
				fileVO.setFood_num(rs.getInt(1));
				fileVO.setName(rs.getString(2));
				fileVO.setPrice(rs.getInt(3));
				fileVO.setFilename(rs.getString(4));
				
				fileVOList.add(fileVO);
			}
			
		} catch (SQLException e) {
			System.out.println("selectList 오류");
			e.printStackTrace();
		} finally {
			DBUtil.closeRs(rs);
			DBUtil.closePstmt(pstmt);
			DBUtil.closeCon(con);
		}
		return fileVOList;
	}
////////////////////////////////////////////////////////////////////////////
	public FileInfoVO select(int fileNum) {
		con =  DBUtil.makeConnection();
		String sql = "SELECT FOOD_NUM, NAME, PRICE, FILENAME FROM FOOD WHERE FOOD_NUM=?";
		FileInfoVO fileVO = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fileNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileVO = new FileInfoVO();
				fileVO.setFood_num(rs.getInt(1));
				fileVO.setName(rs.getString(2));
				fileVO.setPrice(rs.getInt(3));
				fileVO.setFilename(rs.getString(4));
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
