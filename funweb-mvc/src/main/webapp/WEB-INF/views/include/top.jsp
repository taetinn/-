<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- ${ cookie.쿠키이름.value } --%>
<c:if test="${ not empty cookie.id.value }">
	<c:set var="id" value="${ cookie.id.value }" scope="session" />
</c:if>

<%
	// 세션값 있으면 ..님 반가워요~  logout  join없어짐
	// 세션값 없으면  login  join
%>
	<header>
        <div id="login"> 
        	<c:choose>
        		<c:when test="${ not empty sessionScope.id }">
	        		${ sessionScope.id } 님 반가워요~
	        		<a href="/memberLogout.do">로그아웃</a>
        		</c:when>
        		<c:otherwise>
        			<a href="/memberLogin.do">로그인</a>
	        	 	| <a href="/memberJoin.do">회원가입</a>
        		</c:otherwise>
        	</c:choose>
        </div>
        <div class="clear"></div>
        <div id="logo">
        	<a href="/index.do">
        		<img src="/images/logo.gif" width="265" height="62" alt="Fun Web">
        	</a>
        </div>
        <nav id="top_menu">
            <ul>
                <li><a href="/index.do">HOME</a></li>
                <li><a href="/welcome.do">COMPANY</a></li>
                <li><a href="#">SOLUTIONS</a></li>
                <li><a href="/notice.do">CUSTOMER CENTER</a></li>
                <li><a href="#">CONTACT US</a></li>
            </ul>
        </nav>
	</header>
	
	
	
	