package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBConnection {
	
	Connection conn;
	
	 public Connection getConn() {
	        conn = null;

	        // Mac 경로
	        String macUrl = "jdbc:sqlite:/Users/mars112/sqlite/chefhouse.db";
	        // Windows 경로
	        String windowUrl = "jdbc:sqlite:C:\\Users\\tj\\db\\chefhouse";

	        try {
	            Class.forName("org.sqlite.JDBC");

	            // Mac 경로 시도
	            conn = DriverManager.getConnection(macUrl);
	            if (conn != null) {
	                System.out.println("데이터베이스 연결 성공 (Mac)");
	                return conn;
	            }
	        } catch (Exception e) {
	            System.err.println("MAC 데이터베이스 연결 실패: " + e.getMessage());
	        }
	        
	        // Windows 경로 시도
	        try {
	            conn = DriverManager.getConnection(windowUrl);
	            if (conn != null) {
	                System.out.println("데이터베이스 연결 성공 (Windows)");
	                return conn;
	            }
	        } catch (Exception e) {
	            System.err.println("WINDOW 데이터베이스 연결 실패: " + e.getMessage());
	        }

	        // 둘 다 실패한 경우
	        System.err.println("데이터베이스 연결 실패: Mac과 Windows 경로 모두 실패했습니다.");
	        return null;
	    }
	

	public void close(Connection conn, Statement st) {
		try {
			if (st != null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void close(Connection conn, Statement st, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (st != null) {
				st.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	public static void main(String[] args) {
//		String url = "jdbc:sqlite:/Users/mars112/sqlite/chefhouse.db"; // 데이터베이스 파일 경로
//
//		try {
//			// 드라이버 로딩
//			Class.forName("org.sqlite.JDBC");
//
//			// 데이터베이스 연결
//			Connection conn = DriverManager.getConnection(url);
//			System.out.println("데이터베이스 연결 성공");
//
//			// SQL 실행 (예: 테이블 생성)
//			Statement stmt = conn.createStatement();
//			stmt.executeUpdate("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name TEXT)");
//
//			// 연결 종료
//			conn.close();
//		} catch (ClassNotFoundException | SQLException e) {
//			System.err.println("데이터베이스 연결 실패: " + e.getMessage());
//		}
//	}

}
