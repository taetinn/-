package exam.controller.member;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import exam.dao.MemberDao;
import exam.domain.MemberVo;

public class MemberJoinProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinProAction");
		
		// 파라미터 가져와서 VO에 채우기
		MemberVo vo = new MemberVo();
		vo.setId(request.getParameter("id"));
		vo.setPasswd(request.getParameter("passwd"));
		vo.setName(request.getParameter("name"));
		vo.setEmail(request.getParameter("email"));
		vo.setAddress(request.getParameter("address"));
		vo.setTel(request.getParameter("tel"));
		vo.setMtel(request.getParameter("mtel"));
		
		// regDate 가입날짜 생성해서 넣기
		vo.setRegDate(LocalDateTime.now());
		
		// DB객체 가져오기
		MemberDao dao = MemberDao.getInstance();
		
		// 회원가입 메소드 호출
		dao.insert(vo);
		
		return "redirect:/memberLogin.do";
	}

}
