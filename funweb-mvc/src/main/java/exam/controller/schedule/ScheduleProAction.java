package exam.controller.schedule;

import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exam.controller.Action;


class MyTask1 extends TimerTask {

	@Override
	public void run() {
		System.out.println("스케줄 작업 수행.....");
	}
}


public class ScheduleProAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ServletContext application = request.getServletContext();
		if (application.getAttribute("timer") == null) {
			application.setAttribute("timer", new Timer(true)); // Timer(true) 데몬스레드로 수행하는 타이머 준비
		}
		
		String strStart = request.getParameter("start");
		String strFirstTime = request.getParameter("firstTime");
		String strPeriod = request.getParameter("period");
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		System.out.println("strStart = " + strStart);
		System.out.println("strFirstTime = " + strFirstTime);
		System.out.println("strPeriod = " + strPeriod);
		
		boolean start = Boolean.parseBoolean(strStart);
		
		if (start) {
			long period = Long.parseLong(strPeriod);
			
			LocalDateTime ldt = LocalDateTime.parse(strFirstTime);
			System.out.println(ldt);
			Date firstTime = Date.from(ldt.atZone(ZoneId.systemDefault()).toInstant());
			
			
			// 작업1 스케줄 작업 수행
			Timer timer = (Timer) application.getAttribute("timer");
			
			MyTask1 myTask1 = new MyTask1();
			
			timer.scheduleAtFixedRate(myTask1, firstTime, period*1000);
			
			application.setAttribute("myTask1", myTask1);
			
			out.println(false); // 다음단계는 false로서 종료단계가 됨
			out.close();
		} else {
			// 작업1 스케줄 작업 중지
			MyTask1 myTask1 = (MyTask1) application.getAttribute("myTask1");
			myTask1.cancel();
			System.out.println("작업1 취소됨.");
			application.removeAttribute("myTask1");
			
			out.println(true); // 다음단계는 true로서 시작단계가 됨
			out.close();
		}
		
		return null;
	}

}
