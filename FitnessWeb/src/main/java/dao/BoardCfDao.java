package dao;

import java.time.LocalDateTime;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.DBManager;
import mapper.BoardMapper;
import mapper.MemberMapper;
import vo.BoardVo;

public class BoardCfDao {
	private static BoardCfDao instance = new BoardCfDao();
	
	public static BoardCfDao getInstance() {
		return instance;
	}
	
	public void update(BoardVo vo) {
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(true)){
			BoardMapper mapper= ss.getMapper(BoardMapper.class);
			mapper.updateCf(vo);
		}
	}
	
	public void insert(BoardVo vo) {
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			// 새글번호 구하기
			int num = mapper.getBoardNum();
			// 새글번호를 vo에 설정
			vo.setNum(num);
			// 주글관련 re 필드값 설정
			vo.setReRef(num);
			vo.setReLev(0);
			vo.setReSeq(0);
			// 조회수 0
			vo.setReadcount(0); 
			
			mapper.insertCf(vo);
		}
	} // insert()
	
	public int getBoardNum() {
		int boardNum = 0;
		
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			System.out.println(("getBoardNum"));
			boardNum = mapper.getBoardNum();
		}
		
		return boardNum;
	} // getBoardNum()
	
	public void deleteByNum(int num) {
		try(SqlSession ss= DBManager.getSqlSessionFactory().openSession(true)){
			BoardMapper mapper = ss.getMapper(BoardMapper.class);
			mapper.deleteByNum(num);
		}
	}
	
	public void deleteAll() {
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(true)){
			BoardMapper mapper = ss.getMapper(BoardMapper.class);
			mapper.deleteAll();
		}
	}
	
	public void insertDummyRows(int count) {
		for (int i=1; i<=count; i++) {
			BoardVo vo = new BoardVo();
			
			int num = getBoardNum();
			
			vo.setNum(num);
			vo.setName("Kim"+num);
			vo.setPasswd("1234");
			
			
			vo.setTitle("Cross Fit" + num);
			vo.setContent("글내용\n입니다. " + num);
			vo.setReadcount(0);
			vo.setRegDate(LocalDateTime.now());
			vo.setReRef(num);
			vo.setReLev(0);
			vo.setReSeq(0);
			
			System.out.println(vo.toString());
			insert(vo);
		} 	
	} // insertDummyRow
	
	public int getTotalCountfmCf(String category, String search) {
		int cnt =0;
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)) {
				BoardMapper mapper = ss.getMapper(BoardMapper.class);
				cnt = mapper.getTotalCountfmCf(category, search);
		}
		
		return cnt;
	}
	
	public int getTotal() {
		int cnt=0;
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)) {
			BoardMapper mapper = ss.getMapper(BoardMapper.class);
			cnt = mapper.getTotal();
		}
		
		return cnt;
	}
	
	public List<BoardVo> getBoards(int startRow, int pageSize, String category, String search) {
		List<BoardVo> list = null;
		
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			list = mapper.getCfBoards(startRow, pageSize, category, search);
		}
		
		return list;
	} // getBoards()
	
	public List<BoardVo> getBoardsById(String id){
		List<BoardVo> list = null;
		return list;
	}
	
	
	public void updateReadCnt(int num) {
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			mapper.updateReadCntCf(num);
		}
	}
	
	public BoardVo getBoardByNum(int num) {
		BoardVo vo = null;
		
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false)) {
			BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
			vo = mapper.getBoardCfByNum(num);
		}
		
		return vo;
	}
	
	public BoardVo getAllInfosByNum(int num) {
		BoardVo vo = null;
		try(SqlSession ss=DBManager.getSqlSessionFactory().openSession(false)){
			BoardMapper mapper = ss.getMapper(BoardMapper.class);
			vo = mapper.getAllInfosByNum(num);
			
		}
		return vo; 	
	}
	
	public void replyInsert(BoardVo vo) {
		
		SqlSession ss = DBManager.getSqlSessionFactory().openSession(false);
		try{
			BoardMapper mapper = ss.getMapper(BoardMapper.class);
			mapper.updateReSeqByReRef(vo.getReRef(), vo.getReSeq());
			
			int num = mapper.getBoardNum();
			
			vo.setNum(num);
			vo.setReLev(vo.getReLev()+1);
			vo.setReSeq(vo.getReSeq()+1);
			vo.setReadcount(0);
			
			mapper.insertCf(vo);
			
			ss.commit();
		} catch (Exception e) {
			e.printStackTrace();
			ss.rollback();
		} finally {
			ss.close();
		}
	}

	public static void main(String[] args) {
		BoardCfDao dao = BoardCfDao.getInstance();
		System.out.println("새글 번호 : "+dao.getBoardNum());
//		dao.insertDummyRows(100);
		//BoardVo vo = new BoardVo();
	}
	
}
