<%@page import="java.util.UUID"%>
<%@page import="vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.FileVo"%>
<%@page import="dao.FileCfDao"%>
<%@page import="dao.BoardCfDao"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = "C:/Users/SAMSUNG/Desktop/save_path"; //C:\Users\SAMSUNG\Desktop\save_path
	
	LocalDateTime dateTime = LocalDateTime.now(); 
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d-MMM-uuuu");
	String strDate = dateTime.format(formatter); 
	System.out.println("date : " + strDate);
	
	File dir = new File(path,strDate);
	if(!dir.exists()){
		dir.mkdir();
	}
	
	DiskFileUpload up = new DiskFileUpload();
	
	up.setSizeMax(1024*1024*50);
	up.setSizeThreshold(4096);
	up.setRepositoryPath("C:/devtools/temp");
	
	List<FileItem> list = up.parseRequest(request);
	
	// DB객체 가져오기
		BoardCfDao dao = BoardCfDao.getInstance();
		FileCfDao fileCfDao = FileCfDao.getInstance();
		
		// 첨부파일정보 담을 리스트 준비
		List<FileVo> fileList = new ArrayList<>();
		// 삭제
		List<String> delUuidList = new ArrayList<>();
		
		
		BoardVo vo = new BoardVo();
		
		for (FileItem item : list) {
			if (item.isFormField()) {
				if (item.getFieldName().equals("name")) {
					String name = item.getString("utf-8");
					vo.setName(name);
					System.out.println("name : " + vo.getName());
				} else if (item.getFieldName().equals("title")) {
					vo.setTitle(item.getString("utf-8"));
				} else if (item.getFieldName().equals("content")) {
					vo.setContent(item.getString("utf-8"));
				} else if (item.getFieldName().equals("num")) { // 수정할 글번호 파라미터
						vo.setNum(Integer.parseInt(item.getString("utf-8")));
				} else if (item.getFieldName().equals("delfile")) {
						System.out.println("delfile: " + item.getString("utf-8")); 
						
						String uuid = item.getString("utf-8");
						FileVo fVo = fileCfDao.getFileByUuid(uuid);
						
						File delFile = new File(fVo.getUploadpath(),fVo.getUuid()+"_"+fVo.getFilename());
						if (delFile.exists()) {
							delFile.delete();
						}
						delUuidList.add(uuid);
				}
			} 
		} // for
		if(delUuidList.size()>0){
			fileCfDao.deleteFilesByUuids(delUuidList);
		}
		
		//File Upload
		for (FileItem item : list) {
			 if (!item.isFormField()) { // 파일
				// 파일이름이 있을때만 파일업로드 및 DB insert
				if (!item.getString("utf-8").equals("")) {
					String filename = item.getName();
					
					// 익스플로러는 파일이름에 경로가 포함되있으므로
					// 순수 파일이름만 부분문자열로 가져오기
					int index = filename.lastIndexOf("\\") + 1;
					filename = filename.substring(index);
					
					// 파일명 중복 피하기 위해 파일이름 앞에 uuid 문자열 붙이기
					UUID uuid = UUID.randomUUID();
					String strUuid = uuid.toString();
					
					// 업로드(생성)할 파일이름
					String uploadFilename = strUuid + "_" + filename;
					
					// 생성할 파일정보 File 객체로 준비
					File file = new File(dir, uploadFilename);
					// 해당 경로에 해당 파일명으로 파일 생성(업로드 수행)
					item.write(file);
					///////////////파일 생성 끝////////////////////////
					
					
					
					///////////////첨부파일 VO 작업시작////////////////////////
					
					// 파일정보 담기위한 AttachfileVo 객체 생성
					FileVo attachVo = new FileVo();
					// 게시판 글번호 설정
					attachVo.setBno(vo.getNum());
					// 업로드 경로 설정
					attachVo.setUploadpath(dir.getPath());
					
					attachVo.setUuid(strUuid);
					attachVo.setFilename(filename);
					
					// 파일명 확장자가 이미지면 "I", 아니면 "O"
					String ext = filename.substring(filename.lastIndexOf(".") + 1);
					if (ext.equalsIgnoreCase("png")
							|| ext.equalsIgnoreCase("gif")
							|| ext.equalsIgnoreCase("jpg")
							|| ext.equalsIgnoreCase("jpeg")) {
						attachVo.setImage("I"); // Image type
					} else {
						attachVo.setImage("O"); // Other type
					}
					
					// 첨부파일 한개 추가
					//attachDao.insert(attachVo);
					fileList.add(attachVo);
				} // if
			}
		} // for
		
		
		// board 테이블에 새글 update하기
		dao.update(vo);
		// attachfile 테이블에 추가된 첨부파일정보 리스트 insert하기
		fileCfDao.insertCf(fileList);
		
		
		response.sendRedirect("BoardMain.jsp");
%>