<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// get parameter
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<p><%= name %> : <%=age %></p>