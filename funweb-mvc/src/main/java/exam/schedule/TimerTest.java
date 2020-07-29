package exam.schedule;

import java.util.Timer;
import java.util.TimerTask;

class MyTask extends TimerTask {
	@Override
	public void run() {
		System.out.println("스케줄 작업 수행...");
	}
}

class MyTask2 extends TimerTask {
	@Override
	public void run() {
		System.out.println("스케줄 작업2 수행...");
	}
}


public class TimerTest {

	public static void main(String[] args) {
		// Timer 클래스는 내부적으로 스레드로 실행됨.
		// 데몬(보조)스레드로 실행하려면 생성자에 true 전달.
		
		// 데몬스레드는 프로그램이 종료되면
		// 자신도 같이 종료됨.(주스레드는 종료안됨)
		
		Timer timer = new Timer(true); // 데몬스레드로 수행
		
		MyTask myTask = new MyTask(); // 스케줄 작업
		MyTask2 myTask2 = new MyTask2();
		
		timer.scheduleAtFixedRate(myTask, 3000, 1000); // 밀리초 단위
		timer.scheduleAtFixedRate(myTask2, 500, 3000);
		
		// 주스레드(main스레드)를 10초 대기
		try {
			Thread.sleep(10000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		
		//myTask.cancel(); // 작업 개별적으로 취소 가능
		
		//timer.cancel(); //타이머에 등록된 작업 모두 취소
		
	} // main

}
