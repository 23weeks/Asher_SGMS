package egovframework.scheduler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @Class Name : Scheduler.java
 * @Description : Scheduler Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.01.12           최초생성
 *
 * @author SJLEE
 */

@Component
public class Scheduler {

	/*
	 * 프로젝트 구현 완료되면 주석 해제하고 아래 @Scheduled 삭제
	 * @Scheduled(cron = "0 0 0 1 * ?")		//매월 1일 0시 0분 0초에 실행
	 */
	@Scheduled(fixedDelay = 6000000)		//600초(10분)마다 실행
	public void monthlyStatisticsScheduler() {
		
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = dataFormat.format(new Date());
		
		System.out.println("Scheduler is started............");
		System.out.println("실행시간 : " + currentDate);
		
		
		
		System.out.println("Scheduler completed.............");
	}
	
}
