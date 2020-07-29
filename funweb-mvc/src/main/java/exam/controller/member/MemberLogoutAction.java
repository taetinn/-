package exam.controller.member;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exam.controller.Action;
import lombok.extern.java.Log;

@Log
public class MemberLogoutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("MemberLogoutAction");
		
		//세션값 초기화
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 로그인 상태유지용 쿠키가 존재하면 삭제
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("id")) {
					cookie.setMaxAge(0); // 유효기간 0 설정
					cookie.setPath("/"); // 경로 설정
					response.addCookie(cookie);
				}
			}
		}
		
		// "로그아웃됨"  index.jsp로 이동
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('로그아웃됨');");
		out.println("location.href = '/index.do';");
		out.println("</script>");
		out.close();
		
		return null;
	}

}





