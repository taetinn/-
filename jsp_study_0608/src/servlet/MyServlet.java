package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/aaa")
public class MyServlet extends HttpServlet  {
	
	String str1 = "Java"; // 전역변수
	
	public String show() { // 메소드 정의
		return str1;
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션 제공 (클라이언트 1명당 세션 객체 1개씩 유지됨)
		HttpSession session = request.getSession();
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 응답객체 response
		PrintWriter out = response.getWriter();
		
		// 스크립틀릿 안에 내용은
		// service() 메소드 안에 있는 지역변수
		String str = " Server Page";
		
		out.println(show()); // 전역메소드 호출 결과 출력
		out.println(str + "<br>"); // 지역변수 출력
		
		//////////////////////////////////
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		// ....
		
		// 변수선언
		// 문자열 id    문자열 passwd   정수형 age
		// 값넣기 "myid"       "mypasswd"      20
		String id = "myid";
		String passwd = "mypasswd";
		int age = 20;
		
		// 브라우저 출력
		// id님의 비밀번호는 passwd이고,
		// 나이는 age세 입니다.
		out.println(id + "님의 비밀번호는 " + passwd + "이고,<br>");
		out.println("나이는 " + age + "세 입니다.<br>");
		
		out.println("	<hr>");
		
		out.println(id);
		out.println("님의 비밀번호는 ");
		out.println(passwd);
		out.println("이고,<br>");
		// ....
		
		out.println("</html>");
		
		out.flush(); // 버퍼를 비워서 브라우저로 출력
		
		out.close(); // 닫기
		
	} // service()

}
