package exam.controller.board;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import exam.dao.BoardDao;
import exam.domain.BoardVo;

public class WriteProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardVo vo = new BoardVo();
		
		// 파라미터 가져와서 VO 에 채우기
		vo.setName(request.getParameter("name"));
		vo.setPasswd(request.getParameter("passwd"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		
		// ip주소  작성일자 값 저장
		vo.setIp(request.getRemoteAddr());
		vo.setRegDate(LocalDateTime.now());
		
		// DB객체 가져오기
		BoardDao dao = BoardDao.getInstance();
		// 주글 한개 등록
		dao.insert(vo);
		
		// notice.do로 리다이렉트 이동정보 리턴
		return "redirect:/notice.do";
	}

}




