package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class LoginCheckAspect {
 
     /*@SuppressWarnings("unused")
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginCheckAspect.class);*/
 
    @Around("@annotation(kong2.common.LoginCheckBeforeFunctionStart)")
     public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {

	  ModelAndView mv=new ModelAndView();
	  
   
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

            String loginId = (String) session.getAttribute("session_member_id");
/*            String userEnterType = (String) session
                    .getAttribute("UserEnterType");*/

            

            if (loginId == null || "".equals(loginId)) {

            	String uri =request.getRequestURI();
            	///faq/write
            	System.out.println(uri);
            	
                mv.setViewName("ti_loginForm");
                System.out.println("null에 걸림");
                return mv;
            }           
    }catch(Exception e){
        
    	mv.setViewName("faq_list");
    	System.out.println("Exception에 걸림");
        return mv;

    }       
    Object result = joinPoint.proceed();   
    return result;
}

}
