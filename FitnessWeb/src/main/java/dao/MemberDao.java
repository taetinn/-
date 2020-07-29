package dao;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mapper.MemberMapper;
import vo.MemberVo;

public class MemberDao {
	private static MemberDao instance = new MemberDao(); // singleton pattern

	public static MemberDao getInstance() { // 얘로 MemberDao에 접근가능
		return instance;
	}

	private MemberDao() {
		// 생성자
	}


	public void insertGx(MemberVo vo) {
		SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(false);
		System.out.println("before ss");
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println("after mapper ");
		int num = mapper.getMemberNum(vo.getId());
		
		int rowCheck =0;
		for (String c : vo.getGxType()) {
			//System.out.println(c);
			Map<String, Object> map = new HashMap<>();
			map.put("no", num);
			map.put("gxType", c);
			rowCheck = mapper.insertGx(map);
	}
		

		if (rowCheck > 0) {
			sqlSession.commit();
		} else {
			sqlSession.rollback();
		}

		sqlSession.close();

	} // insertGx

	public void insertMem(MemberVo vo) {
		
		SqlSession ss= DBManager.getSqlSessionFactory().openSession(false);
		MemberMapper mapper = ss.getMapper(MemberMapper.class);
		
		int rowCnt = mapper.insertMem(vo);
		
		if(rowCnt>0) {
			ss.commit();
		}
		else {
			ss.rollback();
		}
		
		ss.close();
		

	}// insertMem

	public int userCheck(String id, String passwd) {
		int check = -1;
		SqlSession sqlSession = null;

		try {
			sqlSession = DBManager.getSqlSessionFactory().openSession(false);
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

			String pw = mapper.getPasswdById(id);

			if (pw != null) {
				if (pw.equals(passwd)) {
					check = 1;
				} else {
					check = 0;
				}
			} else {
				check = -1;
			}
		} finally {
			sqlSession.close();
		}
		return check;
	}
	
	public boolean IdDupCheck(String id) {
		boolean check = false; //true: 중복o, false:중복x
		SqlSession sqlSession = null;
		
		try {
			sqlSession = DBManager.getSqlSessionFactory().openSession(false);
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

			int dbCheck = mapper.getCheckIdDup(id);
			System.out.println("dao_dbCheck:"+ dbCheck);
			if(dbCheck == 1) {
				check = true; //dup
			} else {
				check = false;
			}
		} finally {
			sqlSession.close();
		}
		//System.out.println(check);
		return check;
	}
	
	public int getMemNumById(String id) {
		int num;
		SqlSession ss = null;
		try {
			ss = DBManager.getSqlSessionFactory().openSession(false);
			MemberMapper mapper = ss.getMapper(MemberMapper.class);
			
			num = mapper.getMemberNum(id);

		} finally {
			ss.close();
		}
		return num;
	}
	
	public int checkGxAuth(String id, String gx) {
		int check = -1; //0이면 권한x, 1이면 권한o
		int memNumber = getMemNumById(id);
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)){
			MemberMapper mapper = ss.getMapper(MemberMapper.class);
			
			if(gx =="cf") {
				System.out.println("cf1");
			check = mapper.getCheckCfAuth(memNumber);
			System.out.println("cf2");

			}
			else if(gx =="ay") {
				check = mapper.getCheckAyAuth(memNumber);
			}
			else if(gx =="pil") {
				check = mapper.getCheckPilAuth(memNumber);
			}
		
		return check;
		}	
	}
	
	public MemberVo getMemById(String id){
		MemberVo vo = null;
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)){
			MemberMapper mapper = ss.getMapper(MemberMapper.class);
			vo = mapper.getMemberByID(id);
		}
		
		return vo;
	}
	
	public void deleteMemberById(String id) {
		try(SqlSession ss= DBManager.getSqlSessionFactory().openSession(true)){
			MemberMapper mapper = ss.getMapper(MemberMapper.class);
			mapper.deleteMemberById(id);
		}
	}


//	public static void main(String[] args) {
//
//	}
}
