package exam.controller.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import exam.controller.Action;
import exam.dao.MemberDao;
import lombok.extern.java.Log;

@Log
public class AjaxJoinIdCheckAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("AjaxJoinIdCheckAction");
		
		String id = request.getParameter("id");

		if (id == null || id.length() == 0) {
			return null;
		}
		
		
		
		MemberDao dao = MemberDao.getInstance();
		
		boolean isIdDup = dao.isIdDuplicated(id);
		//out.println(isIdDup);
		
		Map<String, Object> map = new HashMap<>();
		map.put("isIdDup", isIdDup);
		map.put("name", "홍길동");
		map.put("age", 22);

		Gson gson = new Gson();
		String strJson = gson.toJson(map);
		
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(strJson);
		out.close();
		
		return null;
	}

}
