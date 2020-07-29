package exam.schedule;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.ZoneId;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

class MyTask3 extends TimerTask {
	@Override
	public void run() {
		System.out.println("스케줄 작업 수행...");
	}
}

public class TimerTest2 {

	public static void main(String[] args) {
		// LocalDateTime to Date
		LocalDateTime ldt = LocalDateTime.of(2020, Month.JUNE, 29, 14, 27);
		Instant instant = ldt.atZone(ZoneId.systemDefault()).toInstant();
		Date date = Date.from(instant);
		
		
		Timer timer = new Timer(); // 주스레드
		
		timer.scheduleAtFixedRate(new MyTask3(), date, 1000);
		
		//timer.scheduleAtFixedRate(new MyTask3(), date, 1000*60*60*24*7);
		

	} // main

}
