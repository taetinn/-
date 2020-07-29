package exam.controller.company;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;
import lombok.extern.java.Log;

@Log
public class WelcomeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("WelcomeAction");
		return "company/welcome";
	}

}
