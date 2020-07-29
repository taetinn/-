package exam.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import exam.dao.BoardDao;
import exam.domain.BoardVo;
import exam.domain.PageDto;
import lombok.extern.java.Log;

@Log
public class NoticeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("NoticeAction.................");
		
		//검색어 관련 파라미터(category, search) 가져오기. 없으면 null 리턴
		String category = request.getParameter("category"); // 검색유형
		String search = request.getParameter("search"); // 검색어
		
		category = (category == null) ? "" : category;
		search = (search == null) ? "" : search;
		
		System.out.println("category = " + category);
		System.out.println("search = " + search);

		// DB객체 가져오기
		BoardDao dao = BoardDao.getInstance();
		// 전체 글갯수
		int totalCount = dao.getTotalCount(category, search);
		
		
		// 사용자가 요청한 페이지번호 파라미터 가져오기
		String strPageNum = request.getParameter("pageNum");
		if (strPageNum == null || strPageNum.equals("")) {
			strPageNum = "1";
		}
		//strPageNum = (strPageNum == null) ? "1" : strPageNum;
		
		// 문자열 페이지번호를 숫자로 변환
		int pageNum = Integer.parseInt(strPageNum);
		
		
		
		
		// ========================================
		// 한페이지에 해당하는 글목록 구하기 작업
		// ========================================
		
		// 한 페이지에 15개씩 가져오기
		int pageSize = 15;
		// 시작행 인덱스번호 구하기(수식)
		int startRow = (pageNum-1) * pageSize;
			
		// 원하는 페이지의 글을 가져오는 메소드
		List<BoardVo> list = null;
		if (totalCount > 0) {
			list = dao.getBoards(startRow, pageSize, category, search);
		}
		
		
		
		// ========================================
		// 페이지블록 관련정보 구하기 작업
		// ========================================
		
		// 총 페이지 수 구하기
		// 글50개. 한화면에보여줄글 10개 -> 50/10 = 5페이지
		// 글55개. 한화면에보여줄글 10개 -> 55/10 = 5 + 1페이지(나머지 있으면) -> 6페이지
		//int pageCount = totalCount / pageSize + (totalCount % pageSize == 0 ? 0 : 1);
		int pageCount = totalCount / pageSize;
		if (totalCount % pageSize > 0) {
			pageCount += 1;
		}
		
		// 화면에 보여줄 페이지번호의 갯수 설정
		int pageBlock = 10;
		
		// 페이지블록의 시작페이지 구하기!
		// 1~10   11~20   21~30
		
		//  1~10 ->  1
		// 11~20 -> 11
		// 21~30 -> 21
		// 31~40
		
		// 페이지 블록의 시작페이지
		int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		// 페이지 블록의 끝페이지
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		
		// 페이지블록 관련 정보를 PageDTO에 저장(Map 컬렉션 사용 가능)
		PageDto pageDto = new PageDto();
		pageDto.setTotalCount(totalCount);
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setCategory(category);
		pageDto.setSearch(search);
		
//		Map<String, Object> pageMap = new HashMap<>();
//		pageMap.put("totalCount", totalCount);
//		pageMap.put("pageCount", pageCount);
//		pageMap.put("pageBlock", pageBlock);
//		pageMap.put("startPage", startPage);
//		pageMap.put("endPage", endPage);
//		pageMap.put("category", category);
//		pageMap.put("search", search);
		
		
		// 뷰(jsp)에서 사용할 데이터를 request 영역객체에 저장
		request.setAttribute("boardList", list);
		request.setAttribute("pageDto", pageDto);
		//request.setAttribute("pageMap", pageMap);
		request.setAttribute("pageNum", pageNum);
		
		return "center/notice";
	}

}




