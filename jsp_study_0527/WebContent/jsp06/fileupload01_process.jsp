<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/* //multipart/form-data 전송 시  request객체를 바로 사용할 수 없음
//post 파라미터 한글처리
	request.setCharacterEncoding("utf-8");
 
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename = request.getParameter("filename");
	
	out.println("name = " + name +"<br>");
	out.println("subject = " + subject +"<br>");
	out.println("filename = " + filename +"<br>"); multipart를 사용할 때 request로부터 값을 받아올 수 없어서 null로 표시됨()
*/
	// cos.jar
	// 파일 업로드를 위한 MultipartRequest 클래스 사용
	
	
	MultipartRequest multi = new MultipartRequest(
			request,
			"C:/devtools/upload"/*upload path*/,
			1024*1024*10/*uplload file size limit*/,                
			"utf-8"/*filename encoding info*/,
			new DefaultFileRenamePolicy() /*업로드 파일명 중복 방지*/
			);
	
	String name = multi.getParameter("name");
	String subject = multi.getParameter("subject");

	// 업로드한 원본 파일이름
	String oriFilename = multi.getOriginalFileName("filename");
	// 이름중복시 변경되어 업로드된 파일이름 
	String filename = multi.getFilesystemName("filename");
	
	//file content type
	String type= multi.getContentType("filename");
	
	//get File object about uploaded file
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