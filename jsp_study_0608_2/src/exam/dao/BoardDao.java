package exam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import exam.vo.AttachfileVo;
import exam.vo.BoardVo;

public class BoardDao {
	
	private static BoardDao instance = new BoardDao();
	
	public static BoardDao getInstance() {
		return instance;
	}

	private BoardDao() {
	}
	
	
	// 게시판 새글번호 생성해서 가져오기
	public int getBoardNum() {
		int boardNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "select ifnull(max(num), 0) + 1 as max_num ";
			sql += "from board ";
			
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				//boardNum = rs.getInt(1);
				boardNum = rs.getInt("max_num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return boardNum;
	} // getBoardNum()
	
	
	// 주글 insert 메소드
	public void insert(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		
		try {
			con = JdbcUtils.getConnection();
			
			sb.append("INSERT INTO board (num,name,passwd,subject,content,uuid,filename,readcount,ip,reg_date,re_ref,re_lev,re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			
			String sql = sb.toString();
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getSubject());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getUuid());
			pstmt.setString(7, vo.getFilename());
			pstmt.setInt(8, vo.getReadcount());
			pstmt.setString(9, vo.getIp());
			pstmt.setTimestamp(10, Timestamp.valueOf(vo.getRegDate()));
			pstmt.setInt(11, vo.getReRef());
			pstmt.setInt(12, vo.getReLev());
			pstmt.setInt(13, vo.getReSeq());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // insert()
	
	
	// board 테이블의 전체 행 갯수 가져오기
	public int getTotalCount() {
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = JdbcUtils.getConnection();
			// 전체글갯수 가져오기 sql문
			String sql = "select count(*) from board";
			
			pstmt = con.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return count;
	} // getTotalCount()
	
	
	// 게시판 글목록 가져오기
	public List<BoardVo> getBoards(int startRow, int pageSize) {
		List<BoardVo> list = new ArrayList<BoardVo>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM board "; 
			sql += "ORDER BY re_ref DESC, re_seq ASC ";
			sql += "LIMIT ?, ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo vo = new BoardVo();
				
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));
				
				list.add(vo);
			} // while
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	} // getBoards()
	
	
	public BoardVo getBoardByNum(int num) {
		BoardVo vo = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM board WHERE num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 실행
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				vo = new BoardVo();
				
				vo.setNum(rs.getInt("num"));
				vo.setName(rs.getString("name"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setSubject(rs.getString("subject"));
				vo.setUuid(rs.getString("uuid"));
				vo.setFilename(rs.getString("filename"));
				vo.setContent(rs.getString("content"));
				vo.setReadcount(rs.getInt("readcount"));
				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
				vo.setReRef(rs.getInt("re_ref"));
				vo.setReLev(rs.getInt("re_lev"));
				vo.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return vo;
	} // getBoardByNum()
	
	
	// board테이블과 attachfile 테이블 조인해서 결과 리턴
	public BoardVo getBoardAndAttachfilesByNum(int num) {
		BoardVo boardVo = new BoardVo();
		List<AttachfileVo> attachList = new ArrayList<AttachfileVo>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT b.num, b.name, b.passwd, b.subject, b.content, b.readcount, b.ip, b.reg_date, b.re_ref, b.re_lev, b.re_seq, a.* ";
			sql += "FROM board b LEFT OUTER JOIN attachfile a ";
			sql += "ON b.num = a.bno ";
			sql += "WHERE b.num = ? ";
			
			//pstmt = con.prepareStatement(sql, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
			pstmt = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setInt(1, num);
			// 실행
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AttachfileVo attachVo = new AttachfileVo();
				attachVo.setUuid(rs.getString("uuid"));
				attachVo.setFilename(rs.getString("filename"));
				attachVo.setUploadpath(rs.getString("uploadpath"));
				attachVo.setImage(rs.getString("image"));
				attachVo.setBno(rs.getInt("bno"));
				
				attachList.add(attachVo);
			}
			// 첨부파일 리스트 객체 설정
			boardVo.setAttachList(attachList);
			
			if (rs.last()) { // 커서를 마지막행으로 이동
				// 게시판글 boardVo 채우기
				boardVo.setNum(rs.getInt("num"));
				boardVo.setName(rs.getString("name"));
				boardVo.setPasswd(rs.getString("passwd"));
				boardVo.setSubject(rs.getString("subject"));
				//boardVo.setUuid(rs.getString("uuid"));
				//boardVo.setFilename(rs.getString("filename"));
				boardVo.setContent(rs.getString("content"));
				boardVo.setReadcount(rs.getInt("readcount"));
				boardVo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
				boardVo.setReRef(rs.getInt("re_ref"));
				boardVo.setReLev(rs.getInt("re_lev"));
				boardVo.setReSeq(rs.getInt("re_seq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return boardVo;
	} // getBoardAndAttachfilesByNum
	
	
	
	
	// 특정글 조회수 1증가시키는 메소드
	public void updateReadcount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			// sql문. num에 해당하는 글의 readcount 1증가하게 수정
			sql  = "UPDATE board ";
			sql += "SET readcount = readcount + 1 ";
			sql += "WHERE num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // updateReadcount()
	
	
	public void update(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "UPDATE board ";
			sql += "SET name=?, passwd=?, subject=?, content=? ";
			sql += "WHERE num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPasswd());
			pstmt.setString(3, vo.getSubject());
			pstmt.setString(4, vo.getContent());
			pstmt.setInt(5, vo.getNum());
			// 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // update()
	
	
	
	public void deleteByNum(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "DELETE FROM board WHERE num = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 실행
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // deleteByNum()
	
	
	// 답글쓰기
	public void replyInsert(BoardVo vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		StringBuilder sb = new StringBuilder();
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			// 트랜잭션 처리를 위해 수동 commit으로 변환
			con.setAutoCommit(false);
			
			// 새글번호 구하기
			int num = getBoardNum();
			
			// update문. 답변글 들어오는 그룹내의 순서 재배치
			sql  = "UPDATE board ";
			sql += "SET re_seq = re_seq + 1 ";
			sql += "WHERE re_ref = ? ";
			sql += "AND re_seq > ? ";
			// update문을 가지는 문장객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vo.getReRef());
			pstmt.setInt(2, vo.getReSeq());
			// update문 실행
			pstmt.executeUpdate();
			// pstmt 자원닫기
			pstmt.close();
			
			// pstmt는 재활용 안됨.
			// insert문.
			sb.append("INSERT INTO board (num,name,passwd,subject,content,filename,readcount,ip,reg_date,re_ref,re_lev,re_seq) ");
			sb.append("VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ");
			sql = sb.toString();
			
			// insert문을 가지는 새로운 pstmt 객체 생성
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getPasswd());
			pstmt.setString(4, vo.getSubject());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getFilename());
			pstmt.setInt(7, 0); // readcount 조회수는 0
			pstmt.setString(8, vo.getIp());
			pstmt.setTimestamp(9, Timestamp.valueOf(vo.getRegDate()));
			pstmt.setInt(10, vo.getReRef()); // 답글의 그룹번호는 답글다는 대상글과 동일하게
			pstmt.setInt(11, vo.getReLev() + 1); // 들여쓰기 레벨은 답글다는 대상글에 1증가
			pstmt.setInt(12, vo.getReSeq() + 1); // 그룹 내 순번은 답글다는 대상글에 1증가
			// insert문 실행
			pstmt.executeUpdate();
			// sql의 commit문 수행
			con.commit();
			
			// con 상태를 원래대로 자동커밋으로 되돌리기
			con.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback(); // sql의 rollback문 수행
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // replyInsert()
	
	
	// 샘플 주글들을 insert하기
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
			vo.setReadcount(0);
			vo.setRegDate(LocalDateTime.now());
			vo.setReRef(num);
			vo.setReLev(0);
			vo.setReSeq(0);
			
			insert(vo); // dao객체의 insert() 활용해서 행 추가
		} // for
	} // insertDummyRow
	
	

	
	
	
	
	public static void main(String[] args) {
		// 새글번호 생성 테스트
		BoardDao dao = BoardDao.getInstance();
		//System.out.println("새글번호: " + dao.getBoardNum());
		
		// 더미 레코드 100개 추가
		//dao.insertDummyRows(500);
		//System.out.println("새글번호: " + dao.getBoardNum());
		
		BoardVo vo = dao.getBoardByNum(1);
		System.out.println(vo);
	}
	
	

	
	
}
