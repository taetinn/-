package exam.controller.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import exam.dao.BoardDao;
import exam.domain.AttachfileVo;
import exam.domain.BoardVo;
import lombok.extern.java.Log;

@Log
public class FileContentAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 세션값 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		// 세션값 없으면 login.jsp로 이동
		if (id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('해당 게시물은 로그인 후 이용할 수 있습니다.');");
			out.println("location.href = '/memberLogin.do';");
			out.println("</script>");
			//out.flush();
			out.close();
			return null;
		}
		
		
		// int num    String pageNum  파라미터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// DB객체 가져오기
		BoardDao dao = BoardDao.getInstance();
		// 조회수 1증가
		dao.updateReadcount(num);
		// 글 한개 가져오기
		BoardVo vo = dao.getBoardAndAttachfilesByNum(num);
		// 첨부파일 리스트 가져오기
		List<AttachfileVo> attachList = vo.getAttachList();
		
		// 내용에서 엔터키 줄바꿈 \r\n -> <br> 바꾸기
		String content = "";
		if (vo.getContent() != null) {
			content = vo.getContent().replace("\r\n", "<br>");
			vo.setContent(content);
		}
		
		// jsp화면(뷰) 만들때 필요한 데이터를 영역객체에 저장
		request.setAttribute("boardVo", vo);
		request.setAttribute("attachList", attachList);
		request.setAttribute("pageNum", pageNum);
		
		
		return "center/fileContent";
	}

}
