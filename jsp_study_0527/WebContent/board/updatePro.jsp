<%@page import="exam.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 

  <%-- post parameter value 한글처리 --%>
  <% request.setCharacterEncoding("utf-8");  %>
  
     <%-- pageNum parameter value  --%>
    <% String pageNum = request.getParameter("pageNum"); %>
  
  <jsp:useBean id = "vo" class="exam.domain.BoardVo"/>
  <jsp:setProperty property="*" name ="vo"/>
  
  <%-- get DB object --%>
  <% BoardDao dao = BoardDao.getInstance(); %>
  
  <%-- modify method call dao.update(vo)--%>
  <% dao.update(vo); %>
  
  <%-- move to list after modifying --%>
  <% response.sendRedirect("list.jsp?pageNum="+pageNum ); %>
  