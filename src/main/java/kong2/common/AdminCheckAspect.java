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
public class AdminCheckAspect {
 
     /*@SuppressWarnings("unused")
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginCheckAspect.class);*/
 
    @Around("@annotation(kong2.common.AdminCheckBeforeFunctionStart)")
     public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {

	  ModelAndView mv=new ModelAndView();
	  
   
	  HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	  HttpSession session = request.getSession();
    try{
            String loginId = (String) session.getAttribute("session_member_id");

            if (loginId == null || "".equals(loginId)) {


            	System.out.println(loginId);
                mv.setViewName("/member/memberLoginForm");                
                System.out.println("null에 걸림");
                System.out.println(request.getRequestURI());
     
                return mv;
            }           
    }catch(Exception e){
    	System.out.println("Exception에 걸림");
    	e.printStackTrace();
    }
    Object result = joinPoint.proceed();   
    
    return result;
}

}
