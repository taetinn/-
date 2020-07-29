package exam.controller.member;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import exam.dao.MemberDao;
import lombok.extern.java.Log;

@Log
public class JoinIdCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("JoinIdCheckAction");
		
		// "id" 파라미터 가져오기
		String id = request.getParameter("id");

		// DB객체 준비하기
		MemberDao dao = MemberDao.getInstance();
		// 아이디 중복여부 값 구하기
		boolean isIdDup = dao.isIdDuplicated(id);
		
		
		// JSP 내장 영역(Scope)객체 4개
		// application : 웹프로그램당 1개 객체 유지.
		// session : 클라이언트(사용자) 당 1개 객체 유지.
		// request : 클라이언트 요청 당 1개 객체 유지.
		//           요청에 대한 응답 후 삭제됨.
		// page : JSP 한페이지당 1개 객체 유지.
		//        JSP 페이지 처리가 끝나면 삭제됨.
		
		// 모델2의 JSP는 jstl 태그와  el(표현 언어)를 함께 사용함
		
		//ServletContext application = request.getServletContext();
		//HttpSession session = request.getSession();
		
		
		// 데이터를 request 영역객체에 저장
		request.setAttribute("isIdDup", isIdDup);
		request.setAttribute("id", id);
		
		// 디스패치 방식으로 jsp 실행시
		// 현재 request 객체가 그대로 사용됨
		return "member/join_IDCheck";
	}

}



