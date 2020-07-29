package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import vo.FileVo;

public interface FileMapper {
	
	@Select("SELECT * FROM files_cf WHERE uuid = #{uuid}")
	FileVo getFilesByUuid(String uuid);
	
	@Select("SELECT * FROM files_cf WHERE uuid= #{uuid}")
	FileVo getFileByUuid(String uuid);
	
	@Insert("INSERT INTO files_cf (uuid,filename,uploadpath,image,bno) " +
			 "VALUES (#{uuid}, #{filename}, #{uploadpath}, #{image}, #{bno})")
	void insertCf(FileVo vo);
	
	
	@Select("SELECT * FROM files_cf WHERE bno=#{bno}")
	List<FileVo> getFilesByBno(int bno);
	
	@Delete("Delete FROM files_cf WHERE bno = #{bno}")
	void deleteFilesByBno(int bno);
	
	@Delete("DELETE FROM files_cf WHERE uuid=#{uuid}")
	void deleteFilesByUuid(String uuid);
	
	void deleteFilesByUuids(@Param("uuids")List<String> uuids);
	

}
