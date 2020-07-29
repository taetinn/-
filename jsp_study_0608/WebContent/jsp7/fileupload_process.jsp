<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
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
	DiskFileUpload upload = new DiskFileUpload();
	
	List<FileItem> list = upload.parseRequest(request);
	
	for (FileItem fileItem : list) {
		if (fileItem.isFormField()) { // 텍스트
			String name = fileItem.getFieldName(); // name 속성
			out.println("fieldName = " + name + "<br>");
			
			String title = fileItem.getString("utf-8");
			out.println("<h3>" + title + "</h3>");
		} else { // 파일
			String name = fileItem.getFieldName(); // name 속성
			out.println("fieldName = " + name + "<br>");
			
			String filename = fileItem.getName(); // 파일이름(익스플로러는 경로포함)
			out.println("<h3>filename = " + filename + "</h3>");
			// 익스플로러 대비 파일이름만 가져오기
			filename = filename.substring(filename.lastIndexOf("\\")+1);
			
			//파일이름 중복 대비해서 uuid 생성하여 붙이기
			UUID uuid = UUID.randomUUID();
			String strUuid = uuid.toString();
			
			String uploadPath = "C:/devtools/upload/";
			filename = strUuid + "_" + filename;
			
			File file = new File(uploadPath, filename);
			fileItem.write(file); // 파일 생성
			
			out.println("파일이름: " + filename + "<br>");
		}
	} // for
	
%>
</body>
</html>






