package exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import exam.vo.BoardVo;

public class BoardDao {
	
	//singleton pattern
	private static BoardDao instance = new BoardDao();
	
	
	public static BoardDao getInstance() {
		return instance;
	}


	private BoardDao() {	
	}
	
	
	
	
	//게시판 새 글 번호 생성 후 가져오기
	public int getBoardNum() {
		int boardNum =0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			con = JdbcUtils.getConnection();
			
			sql+="select ifnull(max(num),0)+1 as max_num from board ";
			
			ps = con.prepareStatement(sql);
			
			//execute
			rs = ps.executeQuery();
			
			if(rs.next()) {
				//boardNum=rs.getInt(1);
				boardNum = rs.getInt("max_num");
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps, rs);
		}
		
		
		
		return boardNum;
	}//getBoardNum
	
	//sample main text insert
		private void insertDummyRows(int count) {
			// BoardVo 객체를 100개 준비하기
					for (int i=1; i<=count; i++) {
						BoardVo vo = new BoardVo();
						
						int num = getBoardNum(); // 새글번호 가져오기
						
						vo.setNum(num); // 기본키 항목
						vo.setName("홍길동"+num);
						vo.setPasswd("1234");
						vo.setSubject("글제목" + num);
						vo.setContent("글내용\n입니다. " + num);
						vo.setReadCount(0);
						vo.setReg_date(LocalDateTime.now());
						vo.setReRef(num);
						vo.setReLev(0);
						vo.setReSeq(0);
						
						insert(vo); // dao객체의 insert() 활용해서 행 추가
					} // for
		}
	
	public void insert(BoardVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = JdbcUtils.getConnection();
			
			sb.append("INSERT INTO board (num,name,passwd,subject,content,filename,readcount,ip,reg_date,re_ref,re_lev,re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ");
			
			String sql = sb.toString();
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getNum());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getPasswd());
			ps.setString(4, vo.getSubject());
			ps.setString(5, vo.getContent());
			ps.setString(6, vo.getFilename());
			ps.setInt(7, vo.getReadCount());
			ps.setString(8, vo.getIp());
			ps.setTimestamp(9, Timestamp.valueOf(vo.getReg_date()));
			ps.setInt(10, vo.getReRef());
			ps.setInt(11, vo.getReLev());
			ps.setInt(12, vo.getReSeq());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps);
		}
	} // insert()
	
	
	//get total number of rows from board table
	public int getTotalCount() {
		int count=0;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs=null;
		String sql="";
		
		try {
			con=JdbcUtils.getConnection();
			sql="select count(*) from board";
			
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if (rs.next()) { //the case row>1
				count = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps, rs);
		}
		
		
		return count;
	}//getTotalCount
	
	public BoardVo getBoardByNum(int num) {
		BoardVo vo = null;
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM board WHERE num = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			// 실행
			rs = ps.executeQuery();
			
			if (rs.next()) {
				vo = new BoardVo();
				
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadCount(rs.getInt("readcount"));
				vo.setReg_date(rs.getTimestamp("reg_date").toLocalDateTime());
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps, rs);
		}
		return vo;
	} // getBoardByNum()
	
	
	// 특정글 조회수 1증가시키는 메소드
	public void updateReadcount(int num) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			// sql문. num에 해당하는 글의 readcount 1증가하게 수정
			sql  = "UPDATE board ";
			sql += "SET readcount = readcount +1 "; // '=' 대입연산자
			sql += "WHERE num = ?"; // '=' 비교연산자
			
			ps = con.prepareStatement(sql);
			ps.setInt(1,num);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps);
		}
		
		
	} // updateReadcount()
	
	public void update(BoardVo vo) {
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="";
		
		try {
			con=JdbcUtils.getConnection();
			
			sql	="UPDATE board ";
			sql	+= "SET name=?, passwd=?, subject=?, content=? ";
			sql	+="where num = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPasswd());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getNum());
			
			//execute
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps);
		}
	}
	
	public List<BoardVo> getBoards(int startRow, int pageSize) {
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM board "; 
			sql += "ORDER BY re_ref DESC, re_seq ASC ";
			sql += "LIMIT ?, ? ";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, pageSize);
			
			//execution
			rs =ps.executeQuery();
			
			while(rs.next()) {
				BoardVo vo= new BoardVo();
				
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadCount(rs.getInt("readcount"));
				vo.setReg_date(rs.getTimestamp("reg_date").toLocalDateTime());
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, ps, rs);
		}
		return list;
	} // getBoards()
	
	public static void main(String[] args) {
		//새글번호 생성 테스트
		BoardDao dao = BoardDao.getInstance();
		System.out.println("새글번호 : "+dao.getBoardNum());
		
		// 더미 레코드 100개 추가
//				dao.insertDummyRows(100);
				
//				System.out.println("새글번호: " + dao.getBoardNum());
		
	}
}
