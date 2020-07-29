<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="exam.dao.DeptEmpDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	DeptEmpDao dao = DeptEmpDao.getInstance();
	
	List<List<Object>> list = dao.getDeptNameAndCount();
	// 자바 리스트를 Gson을 이용하여 JSON 배열리스트로 변환
	Gson gson = new Gson();
	String str = gson.toJson(list);
	System.out.println(str);
%>
<%=str %>