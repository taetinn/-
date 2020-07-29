<%@page import="dao.BoardCfDao"%>
<%@page import="java.io.File"%>
<%@page import="vo.FileVo"%>
<%@page import="java.util.List"%>
<%@page import="dao.FileCfDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bno = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	FileCfDao fileCfDao = FileCfDao.getInstance();
	List<FileVo> fileList = fileCfDao.getFilesByBno(bno);
	
	for(FileVo fVo:fileList){
		String filename = fVo.getUuid() + "_" + fVo.getFilename(); 
		
		File file = new File(fVo.getUploadpath(),filename);
		
		if(file.exists()){
			file.delete();
		}
	}
	
	fileCfDao.deleteFilesByBno(bno);
	
	BoardCfDao dao = BoardCfDao.getInstance();
	dao.deleteByNum(bno);
	
	response.sendRedirect("BoardMain.jsp?pageNum="+pageNum);
	
	
	
%>