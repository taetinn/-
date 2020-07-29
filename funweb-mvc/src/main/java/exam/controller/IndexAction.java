package exam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//return null; // Ajax 처리 시 null을 리턴
		//return "redirect:명령어.do"; // 리다이렉트 방식 이동
		return "index"; // jsp 뷰 이름 리턴. 디스패치 방식 이동
	}

}









