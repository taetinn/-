<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");
%>
<%-- 액션태그 useBean 객체생성 BoardVo --%>
<%
	//BoardVo vo = new BoardVo();
%>
<jsp:useBean id="vo" class="exam.domain.BoardVo" />

<%-- 액션태그 setProperty 폼 -> vo에 저장 --%>
<jsp:setProperty property="*" name="vo"/>

<%
	// ip  regDate  setter메소드 호출로 값 저장
	vo.setIp(request.getRemoteAddr());
	vo.setRegDate(LocalDateTime.now());
	vo.setReadcount(0);
	
	// DB객체 가져오기
	BoardDao dao = BoardDao.getInstance();
	// 새글번호 생성해서 가져오기
	int num = dao.getBoardNum();
	// vo에 새글번호 설정
	vo.setNum(num);
	
	// 주글의 답글관련 필드값(reRef,reLev,reSeq) 설정
	vo.setReRef(num); // 주글의 글그룹번호는 글번호와 동일 
	vo.setReLev(0); // 주글의 들여쓰기 레벨은 없음(0)
	vo.setReSeq(0); // 같은 그룹 내에서 최상단에 정렬(오름차순)되도록 순번은 0
	
	// board 테이블에 새글 insert하기
	dao.insert(vo);
	
	// 글목록 list.jsp 로 이동
	response.sendRedirect("list.jsp");
%>







