package exam.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import exam.domain.Criteria;
import exam.domain.ReplyVo;
import exam.mapper.BoardMapper;
import exam.mapper.ReplyMapper;

public class ReplyDao {
		
		private static ReplyDao instance = new ReplyDao();
		
		public static ReplyDao getInstance() {
			return instance;
		}

		private ReplyDao() {}
		
		
		public int add(ReplyVo replyVo) {
			int cnt =0;
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				cnt = mapper.insert(replyVo);
			}
			return cnt;
		}//add()
		
		public ReplyVo selectOne(int rno) {
			ReplyVo replyVo = new ReplyVo();
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				replyVo = mapper.read(rno);
			}
			
			return replyVo;
		} //selectOne()
		
		public int remove(int rno) {
			int cnt=0;
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				cnt = mapper.delete(rno);
			}
			
			return cnt;
		}//remove()

		public void modify(ReplyVo replyVo) {
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				mapper.update(replyVo);
			}
		}//modify()
		
		public	int getCountByBno(int bno) {
			int cnt=0;
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				cnt = mapper.getCountByBno(bno);
			}
			return cnt;
		} //getCountByBno()
		
		public List<ReplyVo> getList(int bno){
			List<ReplyVo> list = null;
			
			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				list = mapper.getList(bno);
			}
			
			return list;
		}//getList()
		
		public List<ReplyVo> getListWithPaging(int bno, Criteria cri){
			List<ReplyVo> list = null;

			try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
				ReplyMapper mapper = sqlSession.getMapper(ReplyMapper.class);
				list = mapper.getListWithPaging(bno,cri);
			}
			return list;

		}//getListWithPaging()
}
