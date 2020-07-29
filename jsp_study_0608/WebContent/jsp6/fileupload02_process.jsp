<%@page import="java.util.Enumeration"%>
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
 	// 업로드 수행
	MultipartRequest multi = new MultipartRequest(
			request,    // request 내장객체
			"C:/devtools/upload",  // 업로드할 경로
			1024 * 1024 * 10,     // 업로드 용량 제한(10MB)
			"utf-8",              // 파일명 인코딩
			new DefaultFileRenamePolicy() // 업로드 파일명 중복시 이름변경 규칙 적용
	);

	
	// getParameterNames()는 file 타입 input태그를 제외한
	// 나머지 폼의 name들을 가져옴
	Enumeration<String> enu = multi.getParameterNames();
	
	while (enu.hasMoreElements()) {
		String name = enu.nextElement();
		String value = multi.getParameter(name);
		// name에 대응하는 value값 가져와서 출력
		out.println(name + " = " + value + "<br>");
	} // while
		
	out.println("-------------------------<br>");
	
	// getFileNames()는 file 타입 input태그에 대해서만
	// name 들을 가져옴
	Enumeration<String> enuFiles = multi.getFileNames();
	
	while (enuFiles.hasMoreElements()) {
		String name = enuFiles.nextElement();
		
		String oriFilename = multi.getOriginalFileName(name);
		String filename = multi.getFilesystemName(name);
		out.println("원본파일명: " + oriFilename + ", 업로드된 파일명: " + filename + "<br>");
	}
%>
</body>
</html>





