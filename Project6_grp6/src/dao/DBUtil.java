package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private static final String DB_DRIVER = "com.mysql.jdbc.Driver";
//	private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/project6";
//	private static final String DB_URL = "jdbc:mysql://127.0.0.1:3306/sb01";
	private static final String DB_URL = "jdbc:mysql://70.12.115.79:3306/p26";
	private static final String DB_ID = "p26";
	private static final String DB_PW = "sds1501";
	
	public static void loadDriver() {
		try {
			Class.forName(DB_DRIVER);
		} catch (ClassNotFoundException e) {
			System.out.println("driver loading error");
			e.printStackTrace();
		}
	}
	
	public static Connection makeConnection() {
		Connection con = null;
		try {
			con = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
		} catch (SQLException e) {
			System.out.println("making connection error");
			e.printStackTrace();
		}
		return con;
	}
	
	public static void closeCon(Connection con) {
		if(con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				System.out.println("closing connection error");
				e.printStackTrace();
			}
		}
	}
	
	public static void closePstmt(PreparedStatement pstmt) {
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				System.out.println("closing pstmt error");
				e.printStackTrace();
			}
		}
	}
	
	public static void closeRs(ResultSet rs) {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				System.out.println("closing resultset error");
				e.printStackTrace();
			}
		}
	}
}
