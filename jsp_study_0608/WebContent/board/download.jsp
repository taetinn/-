<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		// uuid 문자열 붙어있는 파일이름
		String filename = request.getParameter("filename");
		// 다운로드 기준경로
		String path = "C:/devtools/upload";
		
		// 다운로드할 파일 객체 준비
		File file = new File(path, filename);
		
		// 입력스트림 준비
		BufferedInputStream is = null;
		is = new BufferedInputStream(new FileInputStream(file));
		
		// 마임타입 가져오기 (이미지 images/png 등등)
		String mimeType = application.getMimeType(file.getPath());
		if (mimeType == null) {
			mimeType = "application/octet-stream";
		}
		
		response.setContentType(mimeType);
		
		// 다운로드할 파일이름에서 UUID 제거하기
		String downloadFilename = filename.split("_")[1];
		response.setHeader("Content-Disposition", "attachment; filename=" + downloadFilename);
		
		// 출력스트림 준비
		ServletOutputStream os = response.getOutputStream();
		
		int data;
		while ((data = is.read()) != -1) {
			os.write(data);
		}
		
		// 입출력 객체 자원닫기
		os.close(); // close() 내에서 flush() 호출됨
		is.close();
	} catch (Exception e) {
		// 
	}
%>







