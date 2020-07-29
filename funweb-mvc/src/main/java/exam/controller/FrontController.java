package exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// post 파라미터 한글처리
		request.setCharacterEncoding("utf-8");
		
		// 요청주소: http://localhost:8081/funweb-mvc/index.do
		// 요청주소: http://localhost:8081/index.do
		
		// 1단계) 명령어 command 구하기
		
		// URI 주소 가져오기
		String requestURI = request.getRequestURI();
		System.out.println("URI주소: " + requestURI);
		// URI주소: /funweb-mvc/aaa.do
		
		// 프로젝트 이름경로
		String contextPath = request.getContextPath();
		System.out.println("contextPath: " + contextPath);
		
		// 요청 명령어 구하기
		String command = requestURI.substring(contextPath.length());
		command = command.substring(0, command.indexOf(".do"));
		System.out.println("command: " + command);
		
		
		// 2단계) 명령어 실행하기
		
		ActionFactory actionFactory = ActionFactory.getInstance();
		Action action = null;
		String strView = null;
		
		// 명령어에 해당하는 Action타입 객체 구하기
		action = actionFactory.getAction(command);
		if (action == null) {
			System.out.println(command + "를 처리하는 Action이 없습니다.");
			return;
		}
		
		try {
			// Action 객체 실행
			strView = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 3단계) 화면응답 또는 이동
		if (strView == null) {
			return;
		}
		
		if (strView.startsWith("redirect:")) {
			String redirectPath = strView.substring("redirect:".length());
			response.sendRedirect(redirectPath);
		} else {
			String jspPath = "/WEB-INF/views/" + strView + ".jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(jspPath);
			dispatcher.forward(request, response);
		}
	} // doPost method

}





