package exam.controller.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import exam.dao.BoardDao;
import exam.domain.AttachfileVo;
import exam.domain.BoardVo;

public class FileModifyFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 세션값 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		// 세션값 없으면 /memberLogin.do 리다이렉트 이동
		if (id == null) {
			return "redirect:/memberLogin.do";
		}


		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao boardDao = BoardDao.getInstance();
		
		BoardVo boardVo = boardDao.getBoardAndAttachfilesByNum(num);
		List<AttachfileVo> attachList = boardVo.getAttachList();
		
		// JSP화면(뷰)에서 사용할 데이터를 request에 저장
		request.setAttribute("boardVo", boardVo);
		request.setAttribute("attachList", attachList);
		request.setAttribute("pageNum", pageNum);
		
		return "center/fileModifyForm";
	}

}



