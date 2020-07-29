package mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import vo.MemberVo;

public interface MemberMapper {
	
	@Select("SELECT * FROM member where id=#{id}")
	MemberVo getMemberByID(String id);

	@Delete("DELETE FROM MEMBER WHERE id=#{id}")
	void deleteMemberById(String id);
	
	int insertMem(MemberVo vo);
	
	int insertGx(Map<String, Object> map);
	
	@Select("select passwd from member where id=#{id}")
	String getPasswdById(String id);
	
	@Select("select count(*) from member where id=#{id}")
	int getCheckIdDup(String id);
	
	@Select("select no from member where id=#{id}")
	int getMemberNum(String id);
	
	int getCheckCfAuth(int memNumber);
	
	int getCheckAyAuth(int memNumber);
	
	int getCheckPilAuth(int memNumber);
}
