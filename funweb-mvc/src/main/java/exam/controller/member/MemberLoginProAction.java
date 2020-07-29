package exam.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import exam.dao.MemberDao;
import lombok.extern.java.Log;

@Log
public class MemberLoginProAction implements Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("MemberLoginProAction");
		
		// id passwd 파라미터 가져오기
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		boolean keepLogin = false;
		// 체크박스는 체크를 안하면 null을 리턴함
		String strKeepLogin = request.getParameter("keepLogin");// "true"
		if (strKeepLogin != null) { // "true"
			keepLogin = Boolean.parseBoolean(strKeepLogin);
		}
		
		// DB객체 준비
		MemberDao dao = MemberDao.getInstance();
		
		// -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
		int check = dao.userCheck(id, passwd);
		
		// 로그인 실패시
		if (check == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 틀림');");
			out.println("history.back();");
			out.println("</script>");
			//out.flush();
			out.close();
			return null;
		} else if (check == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디 없음');");
			out.println("history.back();");
			out.println("</script>");
			//out.flush();
			out.close();
			return null;
		}
		
		
		// 로그인 성공시
		
		// 세션 참조 가져오기
		HttpSession session = request.getSession();
		// 세션에 아이디 저장
		session.setAttribute("id", id);
		
		// 로그인 상태유지 원하면 쿠키 생성 후 응답주기
		if (keepLogin) { // keepLogin == true
			Cookie idCookie = new Cookie("id", id);
			idCookie.setMaxAge(60*10); // (초단위 설정) 10분
			idCookie.setPath("/");
			response.addCookie(idCookie);
		}
		
		return "redirect:/index.do";
	}

}
