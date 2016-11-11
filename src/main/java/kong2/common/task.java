package kong2.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Resource;
import kong2.showcase.ShowcaseModel;
import kong2.showcase.ShowcaseService;
import org.springframework.scheduling.annotation.Scheduled;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class task {

    @Resource(name = "showcaseService")
    private ShowcaseService showcaseService;

    private static final Logger logger = LoggerFactory.getLogger(task.class);

    //<editor-fold defaultstate="collapsed" desc="스케쥴러 cron 양식">
//스케쥴러 cron 양식
// 
//초 0-59 , - * / 
//분 0-59 , - * / 
//시 0-23 , - * / 
//일 1-31 , - * ? / L W
//월 1-12 or JAN-DEC , - * / 
//요일 1-7 or SUN-SAT , - * ? / L # 
//년(옵션) 1970-2099 , - * /
//* : 모든 값
//? : 특정 값 없음
//- : 범위 지정에 사용
//, : 여러 값 지정 구분에 사용
/// : 초기값과 증가치 설정에 사용
//L : 지정할 수 있는 범위의 마지막 값
//W : 월~금요일 또는 가장 가까운 월/금요일
//# : 몇 번째 무슨 요일 2#1 => 첫 번째 월요일
// 
//예제) Expression Meaning 
//초 분 시 일 월 주(년)
// "0 0 12 * * ?" : 아무 요일, 매월, 매일 12:00:00
// "0 15 10 ? * *" : 모든 요일, 매월, 아무 날이나 10:15:00 
// "0 15 10 * * ?" : 아무 요일, 매월, 매일 10:15:00 
// "0 15 10 * * ? *" : 모든 연도, 아무 요일, 매월, 매일 10:15 
// "0 15 10 * * ? : 2005" 2005년 아무 요일이나 매월, 매일 10:15 
// "0 * 14 * * ?" : 아무 요일, 매월, 매일, 14시 매분 0초 
// "0 0/5 14 * * ?" : 아무 요일, 매월, 매일, 14시 매 5분마다 0초 
// "0 0/5 14,18 * * ?" : 아무 요일, 매월, 매일, 14시, 18시 매 5분마다 0초 
// "0 0-5 14 * * ?" : 아무 요일, 매월, 매일, 14:00 부터 매 14:05까지 매 분 0초 
// "0 10,44 14 ? 3 WED" : 3월의 매 주 수요일, 아무 날짜나 14:10:00, 14:44:00 
// "0 15 10 ? * MON-FRI" : 월~금, 매월, 아무 날이나 10:15:00 
// "0 15 10 15 * ?" : 아무 요일, 매월 15일 10:15:00 
// "0 15 10 L * ?" : 아무 요일, 매월 마지막 날 10:15:00 
// "0 15 10 ? * 6L" : 매월 마지막 금요일 아무 날이나 10:15:00 
// "0 15 10 ? * 6L 2002-2005" : 2002년부터 2005년까지 매월 마지막 금요일 아무 날이나 10:15:00 
// "0 15 10 ? * 6#3" : 매월 3번째 금요일 아무 날이나 10:15:00
//</editor-fold>
    @Scheduled(cron = "0 0 0 * * ?") //"*/30 * * * * *" 매 30초마다 실행// "0 0 0 * * ?" : 아무 요일, 매월, 매일 00:00:00
    public void autostatfixer() {
//        System.out.println("execute printWithCron() of Annotated PrintTask at " + new Date());
        List<ShowcaseModel> aticle = showcaseService.selectall();
        Iterator<ShowcaseModel> next = aticle.iterator();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        while (next.hasNext()) {
            ShowcaseModel val = next.next();
            String start_date = sdf.format(val.getStart_date());
            String end_date = sdf.format(val.getEnd_date());
            int showcase_num = val.getShowcase_num();
            int stats = timecal(start_date, end_date);
            ShowcaseModel model = new ShowcaseModel();
            if (stats == 1) { //시작해
                model.setShow_status(stats);
                model.setShowcase_num(showcase_num);
                showcaseService.delete(model);
                logger.info("showcase open - " + showcase_num);
            } else if (stats == -1) { //삭제해
                model.setShow_status(stats);
                model.setShowcase_num(showcase_num);
                showcaseService.delete(model);
                logger.info("showcase close - " + showcase_num);
            }//0 == 예정중이니까 무시
        }

    }

    /**
     * 시작일과 종료일을 넣어서 글상태를 리턴함(이후 서비스를 통해 바로 반영함)
     *
     * @param date1 시작일
     * @param date2 종료일
     * @return show_status //글 상태여부 -1 삭제, 0 예정중(기본), 1 개최중
     */
    public static int timecal(String date1, String date2) {
        SimpleDateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");

        Calendar aDate = Calendar.getInstance();//전
        Calendar bDate = Calendar.getInstance();//후
        Calendar cDate = Calendar.getInstance();//sys
        String[] d1 = date1.split("-");
        String[] d2 = date2.split("-");

        aDate.set(Integer.valueOf(d1[0]), Integer.valueOf(d1[1]) - 1, Integer.valueOf(d1[2]));
        bDate.set(Integer.valueOf(d2[0]), Integer.valueOf(d2[1]) - 1, Integer.valueOf(d2[2]));

        aDate.set(Calendar.HOUR_OF_DAY, 0);
        aDate.set(Calendar.MINUTE, 0);
        aDate.set(Calendar.SECOND, 0);
        aDate.set(Calendar.MILLISECOND, 0);

        bDate.set(Calendar.HOUR_OF_DAY, 0);
        bDate.set(Calendar.MINUTE, 0);
        bDate.set(Calendar.SECOND, 0);
        bDate.set(Calendar.MILLISECOND, 0);

        cDate.set(Calendar.HOUR_OF_DAY, 0);
        cDate.set(Calendar.MINUTE, 0);
        cDate.set(Calendar.SECOND, 0);
        cDate.set(Calendar.MILLISECOND, 0);
//        System.out.println("전:" + dateForm.format(aDate.getTime()));
//        System.out.println("sys:" + dateForm.format(cDate.getTime()));
//        System.out.println("후:" + dateForm.format(bDate.getTime()));
//        System.out.println("----");
//        System.out.println("전:" + aDate.getTimeInMillis());
//        System.out.println("sys:" + cDate.getTimeInMillis());
//        System.out.println("후:" + bDate.getTimeInMillis());
        if (aDate.getTimeInMillis() <= cDate.getTimeInMillis() && cDate.getTimeInMillis() < bDate.getTimeInMillis()) { //개최중
            return 1;
        } else if (cDate.getTimeInMillis() < aDate.getTimeInMillis()) { //예정중
            return 0;
        } else if (cDate.getTimeInMillis() > bDate.getTimeInMillis()) { //종료
            return -1;
        }
        return 0;
    }

}
