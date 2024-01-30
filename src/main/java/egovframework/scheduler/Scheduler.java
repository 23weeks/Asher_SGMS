package egovframework.scheduler;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import egovframework.example.std.service.StdService;
import egovframework.example.std.vo.StdVO;

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

	@Autowired
	private StdService stdService;
	
	/*
	 * 프로젝트 구현 완료되면 주석 해제하고 아래 @Scheduled 삭제
	 * @Scheduled(cron = "0 0 0 1 * ?")		//매월 1일 0시 0분 0초에 실행
	 */
	@Scheduled(fixedDelay = 6000000)
	public void monthlyStatisticsScheduler() throws Exception {
		
		SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
 		String currentDate = dataFormat.format(new Date());
		
 		System.out.println("Scheduler is started............");
		System.out.println("실행시간 : " + currentDate);
		
		//한달 전 날짜 계산
  		LocalDate oneMonthAgo = LocalDate.now().minusMonths(1);
		
		//현재기준 익월 가져오기
 		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String formattedMonth2 = oneMonthAgo.format(formatter);
		System.out.println("익월(YYYYMM) : " + formattedMonth2);
		
		/**************************************완성되면 주석 해제*****************************************/
		
		//GRP_ID, USR_ID 별 출석률
		List<StdVO> resultList = stdService.selectSchdRslt();
		
		
		//데이터 루프
		for(int i=0; i<resultList.size(); i++) {
			StdVO stdVO = new StdVO();
			
			stdVO.setGrp_id(resultList.get(i).getGrp_id());
			stdVO.setUsr_id(resultList.get(i).getUsr_id());
			stdVO.setAtt_rate(resultList.get(i).getAtt_rate());
			stdVO.setStd_yyyymm(formattedMonth2);
			
			System.out.println("================");
			System.out.println("GRP_ID : " + stdVO.getGrp_id());
			System.out.println("USR_ID : " + stdVO.getUsr_id());
			System.out.println("ATT_RATE : " + stdVO.getAtt_rate());
			System.out.println("STAT_MONTH : " + stdVO.getStd_yyyymm());
			System.out.println("================");
			
			//SGMS_STD_GRP_STAT에 INSERT
//			stdService.insertSChdStat(stdVO);
		}

		System.out.println("Scheduler completed.............");
	}
	
}
