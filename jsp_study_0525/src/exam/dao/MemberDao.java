package exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.mysql.cj.protocol.Resultset;

import exam.vo.MemberVo;

// Data Access Object(데이터베이스 접근 객체)
// member 테이블을 제어할 수 있는(sql문 실행하는) 클래스
public class MemberDao {
	
	//singleton pattern
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {}
	

	// DB연결 메소드
	private Connection getConnection() throws Exception {
		// DB접속정보
		String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
		String user = "jspuser";
		String passwd = "jsppass";
		
		Connection con = null;
		// 1단계 드라이버 클래스 로딩
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계 DB연결(DB주소,DB아이디,DB비밀번호)
		con = DriverManager.getConnection(url, user, passwd);
		return con;
	}
	
	private void close(Connection con, Statement stmt ) {
		close(con,stmt,null);
		}
	 

	 private void close(Connection con, Statement stmt, ResultSet rs ) {
 
	 //JDBC객체는 사용의 역순으로 객체를 닫아준다.
	try {
		if(rs!=null) {
		rs.close();
		}
	} catch (Exception e) {
		e.printStackTrace();}
	try {
		if(stmt!=null) {
		stmt.close();
		}
	} catch (Exception e) {
		e.printStackTrace();}
	try {
		if(rs!=null) {
		con.close();
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	
	public void insert(MemberVo vo) {
		//JDBC 참조변수 선언
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="";
		
		try {
			con = getConnection();
			sql = "insert into member (id,passwd,name,age,gender,email,reg_date)";
			sql+="values (?,?,?,?,?,?,?)";
			
			
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPasswd());
			ps.setString(3, vo.getName());
			ps.setInt(4, vo.getAge());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getEmail());
			//LocalDateTime dateTime = vo.getRegDate();
			//Timestamp timestamp = Timestamp.valueOf(dateTime);
			//ps.setTimestamp(7, timestamp);
			ps.setTimestamp(7, Timestamp.valueOf(vo.getRegDate()));
			
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				close(con,ps);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	} //insert

	public int userCheck(String id, String passwd) {
		int check = -1; // -1: id없음 0: 비밀번호 틀림 1: id, passwd 일치
		
		 Connection con = null;
		 PreparedStatement ps = null;
		 ResultSet rs = null;
		 String sql = "";
		 
		 try {
			con = getConnection();
			sql = "select passwd from member where id = ?";
			 ps = con.prepareStatement(sql);
			 ps.setString(1, id);
			  
			  rs = ps.executeQuery();
			  
			  if(rs.next()) { //아이디 있음
				  if(passwd.equals(rs.getString("passwd"))) {
					  check = 1;
				  } else {//wrong password
					  check = 0;
				  }
				  
			  } else {// 아이디없음
				check =-1;  
			  }
		 
		 } catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con,ps,rs);
		}
		 
		return check;
		
	}//userCheck
		 
		 
	
}
