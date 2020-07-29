package exam.controller.restapi;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import exam.dao.ReplyDao;
import exam.domain.Criteria;
import exam.domain.ReplyVo;

@WebServlet(urlPatterns = "/api/reply", loadOnStartup = 1)
public class ReplyRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private ReplyDao replyDao;
	private Gson gson; //Gson :  transfer java to json

	public void init(ServletConfig config) throws ServletException {
		
		System.out.println("Init() ");
		
		replyDao = ReplyDao.getInstance();
		gson = new Gson();
		
//		ServletContext application = config.getServletContext(); //초기ㅗ하 작업 진행가능
//		application.setAttribute("timer", new Timer(true));
	}

	public void destroy() { //서ㅂ를 내리거나정리할 때
		System.out.println(" destroy() "); 

	}
	
	
	//SQL : SELECT
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doGet() "); 
		
		//rno,bno,pageNum parameter 가져오기
		String strRno = request.getParameter("rno");
		String strBno = request.getParameter("bno");
		String strPageNum = request.getParameter("pageNum");

		String strJson = "";
		
		//분기
		if(strRno!=null) {
			//댓글번호의 글 한개를 응답으로 주기
			
			int rno = Integer.parseInt(strRno);
			
			ReplyVo replyVo = replyDao.selectOne(rno);
			
			strJson = gson.toJson(replyVo);
			
		}else if(strBno != null && strPageNum!=null){
			//게시글 번호에 달린 댓글 여러개를 페이징으로 가져오기
			int bno = Integer.parseInt(strBno);
			int pageNum = Integer.parseInt(strPageNum);
			
			Criteria cri = new Criteria(pageNum,10);
			
			List<ReplyVo> list = replyDao.getListWithPaging(bno, cri);
			
			strJson = gson.toJson(list);
			
		}else { //strBno!=null
//			게시글 번호에 달린 댓글 여러개를 모두 가져오기
			int bno = Integer.parseInt(strBno);
			List<ReplyVo> list = replyDao.getList(bno);
			strJson = gson.toJson(list);
		}
		System.out.println(strJson);
		
		//성공 응답
		response.setStatus(200); // 정상응답 코드 200 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(strJson);
		out.close();

		
	}

	//SQL : INSERT
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doPost() "); 
		request.setCharacterEncoding("utf-8");
		
		//http Requestbody 영영긔 JSON문자 가져오기
		BufferedReader reader =  request.getReader();
		if(reader==null) {
			System.out.println("There is NO MESSAGE in the RequestBody area.");
			response.setStatus(500);

			return;
		}
		
//		StringBuilder sb = new StringBuilder();
//		
//		String line = "";
//		while((line = reader.readLine()) !=null) {
//			sb.append(line);
//		}
//		
		//http RequestBody 영역의 JSON문자열을 ReplyVo객체로 변환
		ReplyVo replyVo = gson.fromJson(reader, ReplyVo.class);
		System.out.println(replyVo);
		
		//close inpuststream
		reader.close();
		
		//ReplyVo DB테이블에 insert
		int cnt = replyDao.add(replyVo);
		
		if(cnt>0) {
			response.setStatus(200); // 정사응답 코드 200 설정 
			response.setContentType("text/html; charset=UTF-8"); //text한줄이면 text/html object의 경우에응 application/json
			PrintWriter out = response.getWriter();
			out.println("success");
//			out.flush();
			out.close(); //out.flush() , 버퍼를 비우고 객체를 닫는다.
		}else {
			System.out.println("FAIL to insert...");
			response.setStatus(500); //서버 내부로직 오류코드 500 설정
		}
	}//doPost()

	//SQL : UPDATE
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doPut() "); 
		request.setCharacterEncoding("utf-8");

		// http RequestBody 영역의 JSON 문자열 가져오기
		BufferedReader reader = request.getReader();
		if (reader == null) {
			System.out.println("RequestBody 영역에 메시지가 없습니다.");
			response.setStatus(500);
			return;
		}

		// http RequestBody 영역의 JSON 문자열을 ReplyVo 객체로 변환하기
		ReplyVo replyVo = gson.fromJson(reader, ReplyVo.class);
		System.out.println(replyVo);

		// ReplyVo UPDATE 하기
		replyDao.modify(replyVo);

		// 입력스트림 닫기
		reader.close();

		// 응답처리
		response.setStatus(200); // 정상응답 코드 200 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("success");
		out.close();

	}
	
	//SQL : DELETE
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(" doDelete() "); 
		
		//get rno parameter
		String strRno = request.getParameter("rno"); //인자가 하나라ㅓㅅ json으로 안받고 그냥 paramter로 받음
		//삭제할 값이 여러개라면 getParamterValues로string 배열로 넘겨서 삭제
		if(strRno==null) {
			System.out.println("삭제할 댓글번호 rno 파라미터가 없습니다.");
			response.setStatus(500);
			return;
		}
		
		int rno = Integer.parseInt(strRno);
		
		int cnt = replyDao.remove(rno);
		
		//응답처리
		if(cnt>0) {
			response.setStatus(200); // 정상응답 코드 200 설정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("success");
			out.close();
		}else{
			System.out.println("Fail to DELETE");
			response.setStatus(500);
			
		}
	}

}
