package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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

    for ( Object o : joinPoint.getArgs() ){ 
        if ( o instanceof HttpServletRequest ) {
            request = (HttpServletRequest)o;
        } 
    }
    try{
    	HttpServletRequest session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

            String loginId = (String) session.getAttribute("session_member_id");

            if (loginId == null || "".equals(loginId)) {


            	System.out.println(loginId);
                mv.setViewName("/member/memberLoginForm");                
                System.out.println("/views/index.jsp");
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
