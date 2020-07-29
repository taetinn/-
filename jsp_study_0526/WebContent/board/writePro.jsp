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
<jsp:setProperty property="*" name"vo"/>

<%
	//ip regDate setter메소ㄷ, 호출로 값 저장 setProperty로 못하는 애들
	vo.setIp(request.getRemoteAddr());
	vo.setReg_date(LocalDateTime.now());
	vo.setReadCount(0);
	%>