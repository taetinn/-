package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.DBManager;
import vo.FileVo;
import mapper.FileMapper;
import vo.FileVo;


public class FileCfDao {
	
	private static FileCfDao instance = new FileCfDao();
	
	public static FileCfDao getInstance() {
		return instance;
	}
	
	private FileCfDao() {
		
	}
	
	public FileVo getFilesByUuid(String uuid) {
		FileVo vo = null;
		
		try(SqlSession ss=DBManager.getSqlSessionFactory().openSession(false)){
			FileMapper mapper = ss.getMapper(FileMapper.class);
			vo = mapper.getFilesByUuid(uuid);
		}
		
		return vo;
	}
	
	public void insertCf(FileVo vo) {
		try (SqlSession sqlSession = DBManager.getSqlSessionFactory().openSession(true)) {
			FileMapper mapper = sqlSession.getMapper(FileMapper.class);
			mapper.insertCf(vo);
		}
	} // insert
	
	public List<FileVo> getFilesByBno(int bno){
		List<FileVo> list = null;
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)){
			FileMapper mapper = ss.getMapper(FileMapper.class);
			list = mapper.getFilesByBno(bno);
		}
		
		return list;
	}
	
	public void deleteFilesByBno(int bno) {
		try(SqlSession ss= DBManager.getSqlSessionFactory().openSession(true)){
			FileMapper mapper = ss.getMapper(FileMapper.class);
			mapper.deleteFilesByBno(bno);
		}
	}
	
	public FileVo getFileByUuid(String uuid) {
		FileVo vo = null;
		
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(false)){
			FileMapper mapper = ss.getMapper(FileMapper.class);
			vo = mapper.getFileByUuid(uuid);
		}
		
		return vo;
	}
	
	public void deleteFilesByUuids(List<String> uuids) {
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(true)){
			FileMapper mapper= ss.getMapper(FileMapper.class);
			mapper.deleteFilesByUuids(uuids);
		}
	}
	
	public void deleteFilesByUuid(String uuid) {
		try(SqlSession ss = DBManager.getSqlSessionFactory().openSession(true)){
			FileMapper mapper= ss.getMapper(FileMapper.class);
			mapper.deleteFilesByUuid(uuid);
		}
	}
	// 첨부파일정보 여러개 추가
	public void insertCf(List<FileVo> list) {
		for (FileVo vo : list) {
			this.insertCf(vo);
		}
	} // insert
}
