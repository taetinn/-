<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.*" %>
    <%@ page import="com.oreilly.servlet.multipart.*" %>
    <%@ page import = "java.io.*" %>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
MultipartRequest multi = new MultipartRequest(
		request,
		"C:/devtools/upload"/*upload path*/,
		1024*1024*10/*uplload file size limit*/,                
		"utf-8"/*filename encoding info*/,
		new DefaultFileRenamePolicy() /*업로드 파일명 중복 방지*/
		);

	//getParameterNames()는 file타입 input태그를 제외한 나머지 폼의 name들을 가졍ㅁ

	Enumeration<String> enu = multi.getParameterNames();
	
	while(enu.hasMoreElements()){
		String name = enu.nextElement();
		String value = multi.getParameter(name);
		
		//name에 해당하는 value값 가져와서  출력
		out.println(name+" = "+value+"<br>");
	}
	
	out.println("---------------------------<br>");
	
	
	//getfileNames()는 file타입  input태그에 대해서만 폼의 name들을 가져옴
	Enumeration<String> enuFiles = multi.getFileNames();
	
	while(enuFiles.hasMoreElements()){
		String name = enuFiles.nextElement();
	
		String oriFilename = multi.getOriginalFileName(name);
		String filename = multi.getFilesystemName(name);
		out.println("원본파일명: " + oriFilename + ", 업로드된 파일명: " + filename + "<br>");
	}
%>
</body>
</html>