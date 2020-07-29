package exam.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import lombok.extern.java.Log;

@Log
public class FileWriteFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("FileWriteFormAction.............");
		
		// 세션값 가져오기
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		// 로그인 안했으면(세션값 없으면) login.do 리다이렉트 이동
		if (id == null) {
			return "redirect:/memberLogin.do";
		}

		// 로그인 한 사용자면
		String pageNum = request.getParameter("pageNum");
		
		// jsp화면(뷰) 만들때 필요한 정보를 영역객체에 저장
		request.setAttribute("pageNum", pageNum);
		
		return "center/fileWriteForm";
	}

}
