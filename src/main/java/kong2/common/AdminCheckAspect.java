/*package kong2.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



@Aspect
@Component
public class AdminCheckAspect {
 
     @SuppressWarnings("unused")
	private static final Logger logger = (Logger) LoggerFactory.getLogger(LoginCheckAspect.class);
 
    @Before("@annotation(kong2.common.LoginCheckBeforeFunctionStart)")
     public void loginCheck(JoinPoint joinPoint) throws Throwable {

    
    	
    
	   HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
	   HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
	   HttpSession session = request.getSession();
  try{
	  		String loginId = (String) session.getAttribute("session_member_id");
            int session_member_admin = (Integer)session.getAttribute("session_member_admin");
            memberModel = memberService.getMember(loginId);
            loginId==null||memberModel.getAdmin()==0
            if (session_member_admin==0) {

            	
            	
              
            	System.out.println("admin==0에 걸림");
                System.out.println("관리자 여부(X)");
                request.getRequestDispatcher("/adminCheck").forward(request, response);

            }           
}catch(Exception e){
	System.out.println("로그인 여부(X)");
	System.out.println("관리자 여부(X)");
    request.getRequestDispatcher("/common/adminCheck").forward(request, response);
    }

}

}
*/