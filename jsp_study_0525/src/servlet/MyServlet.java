package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//jsp가 어떻데 동작하는지 servlet으로 대충 구현 해보기.
@WebServlet("/aaa") //서블릿은 공개되어있는 파일이 아니라서, WebServlet annotation을 붙여 코드를 찾아 실행할 수 있는 이름? 을 부여해야한다. 
public class MyServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		// 응답 객체 response : client쪽으로 쓴다.
		PrintWriter out = res.getWriter();
		
		String str = "Server Page";
//		out.println(show()); //전역변수
		out.println(); //지역변수
		
		out.println("<!DOCTYPE HTML>");
		out.println("<html>");
		//...
		out.println("도도도도도도ㅗㄷ");
		
		out.println("</html>");
		
		out.flush();//버퍼를 비워 브라우저로 출력
		
		out.close(); //자원 닫기
	}

	
	
}
