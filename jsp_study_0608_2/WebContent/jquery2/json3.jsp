<%@page import="com.google.gson.Gson"%>
<%@page import="exam.domain.BoardVo"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//사용자가 요청한 페이지번호 파라미터 가져오기
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum == null || strPageNum.equals("")) {
		strPageNum = "1";
	}
	//strPageNum = (strPageNum == null) ? "1" : strPageNum;
	
	// 문자열 페이지번호를 숫자로 변환
	int pageNum = Integer.parseInt(strPageNum);
	// 한 페이지에 15개씩 가져오기
	int pageSize = 15;
	// 시작행 인덱스번호 구하기(수식)
	int startRow = (pageNum-1) * pageSize;

	BoardDao dao = BoardDao.getInstance();

	List<BoardVo> list = dao.getBoards(startRow, pageSize);
	Gson gson =  new Gson();
	String str = gson.toJson(list);
%>
<%=str %>