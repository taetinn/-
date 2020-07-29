package exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.mysql.cj.x.protobuf.MysqlxCrud.Find.RowLock;

import exam.vo.MemberVo;


public class DeptEmpDao {
	
	private static DeptEmpDao instance = new DeptEmpDao();
	
	public static DeptEmpDao getInstance() {
		return instance;
	}

	private DeptEmpDao() {}
	
	// 구글차트 데이터 가져오기
	public List<List<Object>> getDeptNameAndCount() {
		List<List<Object>> list = new ArrayList<List<Object>>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = JdbcUtils2.getConnection();
			
			sql =  "SELECT d.dept_name, COUNT(de.emp_no) count ";
			sql += "FROM dept_emp de LEFT OUTER JOIN departments d ";
			sql += "ON de.dept_no = d.dept_no ";
			sql += "GROUP BY de.dept_no ";
			
			pstmt = con.prepareCall(sql);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				List<Object> rowList = new ArrayList<Object>();
				
				rowList.add(rs.getString("dept_name"));
				rowList.add(rs.getInt("count"));
				
				list.add(rowList);
			}
			
			// 열제목 행을 첫번째 요소로 삽입
			if (list.size() > 0) {
				list.add(0, Arrays.asList("부서명", "사원수"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils2.close(con, pstmt, rs);
		}
		return list;
	}
	
	public static void main(String[] args) {
		DeptEmpDao dao = DeptEmpDao.getInstance();
		
		List<List<Object>> list = dao.getDeptNameAndCount();
		
		System.out.println(list);
		
		System.out.println("====================");
		
		for (List<Object> rowList : list) {
			System.out.println(rowList);
		}
	}
	
	
}







