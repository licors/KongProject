package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Component("loginAspect")
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
    /*adminMethod() || */
    @Around("bbsMethod()")
    public Object trace(ProceedingJoinPoint joinPoint ) throws Throwable{
 
    	
    	String classAndMethod  = joinPoint.getSignature().toShortString();
        //className.methodName으 출력한다
        System.out.println(classAndMethod);

   
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

 
               
                if (loginId == null || "".equals(loginId)) {
                	Object result;
                	//로그에 찍힘
                	System.out.println("로그인 여부 (X)");
                	
                	
                	//로그인 페이지로 리다이렉트
                	result = new ModelAndView("redirect:/member/memberLoginForm");
                	return result;

                }           
        }catch(Exception e){
        	/*response.sendRedirect("/faq/list");*/
        }       
        Object result = joinPoint.proceed();
System.out.println("#### LoginAspect 끝 ####"); 
        System.out.println("로그인 여부(O)");
        return result;
    }
}

