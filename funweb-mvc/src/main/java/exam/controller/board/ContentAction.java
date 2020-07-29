package exam.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import exam.dao.BoardDao;
import exam.domain.BoardVo;

public class ContentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// int num    String pageNum  파라미터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// DB객체 가져오기
		BoardDao dao = BoardDao.getInstance();
		// 조회수 1증가
		dao.updateReadcount(num);
		// 글 한개 가져오기
		BoardVo vo = dao.getBoardByNum(num);
		// 내용에서 엔터키 줄바꿈 \r\n -> <br> 바꾸기
		String content = "";
		if (vo.getContent() != null) {
			content = vo.getContent().replace("\r\n", "<br>");
			vo.setContent(content);
		}
		
		// jsp에서 사용할 데이터를 영역객체에 저장
		request.setAttribute("boardVo", vo);
		request.setAttribute("pageNum", pageNum);
		
		// 실행할 특정 jsp 경로정보 리턴
		return "center/content";
	}

}



