<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*
    // multipart/form-data 전송 시 request객체를 바로 사용할수 없음.
    
	// post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename = request.getParameter("filename");
	
	out.println("name = " + name + "<br>");
	out.println("subject = " + subject + "<br>");
	out.println("filename = " + filename + "<br>");
*/

	// cos.jar
	// 파일 업로드를 위한 MultipartRequest 클래스 사용

	// 파일업로드 수행
	MultipartRequest multi = new MultipartRequest(
			request,    // request 내장객체
			"C:/devtools/upload",  // 업로드할 경로
			1024 * 1024 * 10,    // 업로드 용량 제한(10MB)
			"utf-8",              // 파일명 인코딩
			new DefaultFileRenamePolicy() // 업로드 파일명 중복시 이름변경 규칙 적용
	);

	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");

	// 업로드한 원본 파일이름
	String oriFilename = multi.getOriginalFileName("filename");
	// 이름중복시 변경되어 업로드된 파일이름 
	String filename = multi.getFilesystemName("filename");
	
	// 파일 컨텐트 타입
	String type = multi.getContentType("filename");
	
	// 업로드한 파일에 대한 File 객체로 가져오기
	File file = multi.getFile("filename");
	
	out.println("name = " + name + "<br>");
	out.println("subject = " + subject + "<br>");
	out.println("oriFilename = " + oriFilename + "<br>");
	out.println("filename = " + filename + "<br>");
	out.println("type = " + type + "<br>");
	
	if (file != null) {
		out.println("파일 크기: " + file.length() + "<br>");
	}


%>
</body>
</html>







