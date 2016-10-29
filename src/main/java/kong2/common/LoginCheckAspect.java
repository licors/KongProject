package kong2.common;

import javax.servlet.http.HttpServletRequest;
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
  	  System.out.println("----------------------Annotation-----------beforeAOP");
	  
	  
  	  ModelAndView mv = new ModelAndView();
  	  
  	  
   	  String classAndMethod  = joinPoint.getSignature().toShortString();
        //className.methodName으 출력한다
        System.out.println("사용한 메서드 명:"+classAndMethod);
  	
        
        Object[] args=joinPoint.getArgs();
        HttpServletRequest request = (HttpServletRequest) args[0];
        HttpSession session = request.getSession();
        String loginId = (String) session.getAttribute("session_member_num");
        
        if (loginId == null || "".equals(loginId)|| "null".equals(loginId)) {

      	  System.out.println("로그인 여부(X)");
  		  mv.setViewName("faq_list");

    		return mv;
        }else{
      	  System.out.println("로그인 여부(X)");
      	  mv=(ModelAndView) joinPoint.proceed(args);
        }
        
        System.out.println("----------------------Annotation-----------afterAOP");
        System.out.println("로그인 여부(X)");
		return mv;
    }
}
