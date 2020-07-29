package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import vo.BoardVo;

public interface BoardMapper {
	
	int insertCf(BoardVo vo);
	
	void updateCf(BoardVo vo);
	
	BoardVo getAllInfosByNum(int num);
	
	@Select("select ifnull(max(num), 0) + 1 as max_num from board_cf ")
	int getBoardNum();
	
	BoardVo getBoardByNum(int num);
	
	void updateReadCntCf(int num);
	
	int getTotalCountfmCf(@Param("category") String category, 
			@Param("search") String search );
	
	List<BoardVo> getCfBoards(@Param("startRow") int startRow, 
			@Param("pageSize") int pageSize,
			@Param("category") String category,
			@Param("search") String search);
	
	BoardVo getBoardCfByNum(int num);
	
	@Delete("DELETE FROM board_cf WHERE num = #{num}")
	void deleteByNum(int num);
	
	int updateReSeqByReRef(@Param("reRef") int reRef, @Param("reSeq")int reSeq);
	
	
	@Delete("DELETE FROM board_cf")
	void deleteAll();
	
	@Select("Select COUNT(*) FROM board_cf")
	int getTotal();

}
