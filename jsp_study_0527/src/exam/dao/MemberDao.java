package exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import exam.vo.MemberVo;

// Data Access Object(�����ͺ��̽� ���� ��ü)
// member ���̺��� ������ �� �ִ�(sql�� �����ϴ�) Ŭ����
public class MemberDao {
	
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}

	private MemberDao() {}
	
	
	
	
	
	public void insert(MemberVo vo) {
		// JDBC �������� ����
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			// sql  insert
			sql  = "INSERT INTO member (id,passwd,name,age,gender,email,reg_date) ";
			sql += "VALUES (?,?,?,?,?,?,?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getEmail());
			
			//LocalDateTime dateTime = vo.getRegDate();
			//Timestamp timestamp = Timestamp.valueOf(dateTime);
			//pstmt.setTimestamp(7, timestamp);
			
			pstmt.setTimestamp(7, Timestamp.valueOf(vo.getRegDate()));
			
			// ����
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // insert
	
	
	public int userCheck(String id, String passwd) {
		int check = -1; // -1: ���̵� ����, 0: ��й�ȣ Ʋ��, 1: ���̵� ��й�ȣ ��ġ
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "select passwd from member where id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) { // ���̵� ����
				if (passwd.equals(rs.getString("passwd"))) {
					check = 1;
				} else { // ��й�ȣ Ʋ��
					check = 0;
				}
			} else { // ���̵� ����
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return check;
	} // userCheck
	
	
	public List<MemberVo> getMembers() {
		List<MemberVo> list = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM member";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberVo vo = new MemberVo();
				
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				
				//Timestamp timestamp = rs.getTimestamp("reg_date");
				//LocalDateTime regDate = timestamp.toLocalDateTime();
				//vo.setRegDate(regDate);
				
				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
				
				list.add(vo); // �� �Ѱ��� ����Ʈ�� �߰�
			} // while
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	} // getMembers()
	
	
	// id�� member ���ڵ�(��) �Ѱ� ��������
	public MemberVo getMemberById(String id) {
		MemberVo vo = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM member WHERE id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			// rs -> vo��ü�� �ʵ忡 ����
			if (rs.next()) {
				vo = new MemberVo();
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return vo;
	} // getMemberById()
	
	
	public int update(MemberVo vo) {
		int rowCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql += "UPDATE member ";
			sql += "SET name=?, passwd=?, age=?, gender=?, email=? ";
			sql += "WHERE id = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getId());
			// ����
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
		return rowCount;
	} // update()
	
	
	public int deleteById(String id) {
		int rowCount = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "DELETE FROM member WHERE id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// ����
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
		return rowCount;
	} // deleteById()
	
	
}







