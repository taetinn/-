package exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcUtils {
	// DB���� �޼ҵ�
		public static Connection getConnection() throws Exception {
			// DB��������
			String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
			String user = "jspuser";
			String passwd = "jsppass";
			
			Connection con = null;
			// 1�ܰ� ����̹� Ŭ���� �ε�
			Class.forName("com.mysql.cj.jdbc.Driver");
			// 2�ܰ� DB����(DB�ּ�,DB���̵�,DB��й�ȣ)
			con = DriverManager.getConnection(url, user, passwd);
			return con;
		}
		
		public static void close(Connection con, Statement stmt) {
			close(con, stmt, null);
		} // close
		
		public static void close(Connection con, Statement stmt, ResultSet rs) {
			// JDBC ��ü�� ����� �������� �ڿ��ݱ�
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
