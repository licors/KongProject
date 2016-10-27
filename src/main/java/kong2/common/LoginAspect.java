package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.ui.Model;

@Aspect
public class LoginAspect {
 
    @Pointcut("execution(public * kong2.basket.controller.BasketController.basketAdd(..))")
    private void adminMethod(){}
     
    @Pointcut("execution(public * kong2.faq.controller.FaqController.faqWriteForm(..))")
    private void bbsMethod(){}
     
/*    @Pointcut("execution(public * com.common..*(..))")
    private void commonMethod(){}
     
    @Pointcut("execution(public * com.onm.administrator..*(..))")
    private void onmAdministratorMethod(){}
     
    @Pointcut("execution(public * com.onm.membership..*(..))")
    private void onmMembershipMethod(){}
     
    @Pointcut("execution(public * com.onm.report..*(..))")
    private void onmReportMethod(){}
         
    private String[] access_url = {
            };*/
     
    @Around(value ="adminMethod() || bbsMethod()")
    public Object trace(ProceedingJoinPoint joinPoint ) throws Throwable{
 
System.out.println("머냐");     
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        for ( Object o : joinPoint.getArgs() ){ 
            if ( o instanceof HttpServletRequest ) {
                request = (HttpServletRequest)o;
            } 
            if ( o instanceof HttpServletResponse ) {
                response = (HttpServletResponse)o;
            } 
        }
        try{
            HttpSession session = request.getSession();
           /* session.setAttribute("session_member_id", result.getId_email());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_num", result.getMember_num());*/
                String loginId = (String) session.getAttribute("session_member_num");
 /*               String userEnterType = (String) session
                        .getAttribute("UserEnterType");*/
 
               /* System.out.println("### Margo ==> loginId : " + loginId);*/
                if (loginId == null || "".equals(loginId)) {
                	response.sendRedirect("/member/login");
/*                    System.out.println("### Margo ==> in if loginId : "
                            + loginId);*/
                   /* throw new RuntimeException("먼저 로그인을 하셔야 합니다.");*/
                }           
        }catch(Exception e){
        	response.sendRedirect("/member/login");
            /*throw new RuntimeException("먼저 로그인을 하셔야 합니다.");*/
 
        }       
        Object result = joinPoint.proceed();
/*System.out.println("#### LoginAspect 끝 ####");*/      
        return result;
    }
}

