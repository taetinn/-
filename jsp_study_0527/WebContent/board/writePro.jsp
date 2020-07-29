<%@page import="exam.domain.BoardVo"%>
<%@page import="exam.dao.BoardDao"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	//post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");
%>

<%-- 액션태그 useBean 객체생성 BoardVo --%>
<jsp:useBean id="vo" class="exam.domain.BoardVo"/>

<%-- 액션태그 setProperty 폼 -> vo에 저장 --%>
<jsp:setProperty property="*" name="vo"/> 
<%// BoardVo vo = new BoardVo(); %>
<%
	//ip regDate setter메소ㄷ, 호출로 값 저장 setProperty로 못하는 애들
	vo.setIp(request.getRemoteAddr());
	vo.setReg_date(LocalDateTime.now());
	vo.setReadCount(0);
	
	//get DB object
	BoardDao dao = BoardDao.getInstance();
	//새글번호 생성해서 가져오기
	int num = dao.getBoardNum();
	//vo에 새글번호 설정
	vo.setNum(num);
	
	//주 글의 답글 관련 필드값(reRef,reLev,reSeq) set
	vo.setReRef(num); // 주 글의 글 그룹 번호는 글번호와 동일
	vo.setReLev(0);// 주 그르이 들여쓰기 레벨은 없음(0)
	vo.setReSeq(0); // 같은 그룹 내에서 최상단에 정렬(오름차순)되도록 순번은 0
	
	
	//board 테이블에 새 글 insert
	dao.insert(vo);
	
	//글 목록 list.jsp로 이동
	response.sendRedirect("list.jsp");
	%>