package kong2.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.ModelAndView;

@Component("loginAspect")
@Aspect
public class LoginAspect {
 

     
    @Pointcut("execution(public * kong2.faq.controller.FaqController.faqWriteForm(..))")
    private void faqWriteForm(){}
     

    
    @Before("faqWriteForm()")
    public Object before(JoinPoint joinPoint) throws IOException, ServletException{
 	   System.out.println("----------------------Annotation-----------beforeAOP");
 	  String classAndMethod  = joinPoint.getSignature().toShortString();
      //className.methodName으 출력한다
      System.out.println("사용한 메서드 명:"+classAndMethod);
      
      Object result=null;
      //request, response, session 구하기 
      HttpServletRequest request = null;
   /*   HttpServletResponse response = null;*/
      for ( Object o : joinPoint.getArgs() ){ 
          if ( o instanceof HttpServletRequest ) {
              request = (HttpServletRequest)o;
          } 
/*          if ( o instanceof HttpServletResponse ) {
              response = (HttpServletResponse)o;
          } */
      } 
      HttpSession session = request.getSession();
      
      //session_member_num 구하기
      String loginId = (String) session.getAttribute("session_member_num");
      
      //test   
      System.out.println("접속 아이디:"+loginId);
      


    	  if (loginId == null || "".equals(loginId)|| "null".equals(loginId)) {

    		  result = new ModelAndView("redirect:/faq/list");

      		return result;

    		  
    		  
    		  
    	      	/*//로그에 찍힘
    	      	System.out.println("로그인 여부 (X)");
    	      //로그인 페이지로 포워딩
    	      	request.getRequestDispatcher("/faq/list").forward(request,response);*/
    	      	
    	      }
    	  
    	  return null;
      
    }
    
    
    @After("faqWriteForm()")
    public void after(){
 	   System.out.println("----------------------Annotation-----------afterAOP");
    }


/*    @Around("bbsMethod()")
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
            session.setAttribute("session_member_id", result.getId_email());
			session.setAttribute("session_member_name", result.getName());
			session.setAttribute("session_member_num", result.getMember_num());
                String loginId = (String) session.getAttribute("session_member_num");

 
               
                if (loginId == null || "".equals(loginId)) {

                	//로그에 찍힘
                	System.out.println("로그인 여부 (X)");
                	
                	response.sendRedirect("/member/login");
                	//로그인 페이지로 리다이렉트

                	

                }           
        }catch(Exception e){}
        
        Object result = joinPoint.proceed();
        System.out.println("로그인 여부(O)");
        return result;
    }*/
}

