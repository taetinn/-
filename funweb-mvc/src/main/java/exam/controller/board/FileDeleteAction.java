package exam.controller.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import exam.dao.AttachfileDao;
import exam.dao.BoardDao;
import exam.domain.AttachfileVo;
import lombok.extern.java.Log;

@Log
public class FileDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("FileDeleteAction..............");
		
		// num  pageNum  파라미터 가져오기
		int bno = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		// 파일 삭제를 위해 AttachfileDao 가져오기
		AttachfileDao attachDao = AttachfileDao.getInstance();
		// 특정번호 게시글에 첨부된 첨부파일 정보 가져오기
		List<AttachfileVo> attachList = attachDao.getAttachfilesByBno(bno);
		
		// 파일 삭제하기
		for (AttachfileVo attachVo : attachList) {
			String filename = attachVo.getUuid() + "_" + attachVo.getFilename();
			// 삭제할 파일을 File 객체로 준비
			File file = new File(attachVo.getUploadpath(), filename);
			
			if (file.exists()) { // 해당경로에 파일 존재하면
				file.delete(); // 파일삭제
			}
		}
		
		// 첨부파일 테이블 레코드 삭제하기
		attachDao.deleteAttachfilesByBno(bno);
		// 게시판 테이블 레코드 삭제하기
		BoardDao boardDao = BoardDao.getInstance();
		boardDao.deleteByNum(bno);

		
		// fileNotice.do로 리다이렉트 이동
		return "redirect:/fileNotice.do?pageNum=" + pageNum;
	}

}




