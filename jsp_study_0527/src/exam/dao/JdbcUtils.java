package exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcUtils {
	// DB연결 메소드
		public static Connection getConnection() throws Exception {
			// DB접속정보
			String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
			String user = "jspuser";
			String passwd = "jsppass";
			
			Connection con = null;
			// 1단계 드라이버 클래스 로딩
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2단계 DB연결(DB주소,DB아이디,DB비밀번호)
			con = DriverManager.getConnection(url, user, passwd);
			return con;
		}
		
		public static void close(Connection con, Statement stmt) {
			close(con, stmt, null);
		} // close
		
		public static void close(Connection con, Statement stmt, ResultSet rs) {
			// JDBC 객체는 사용의 역순으로 자원닫기
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // close
		
}
