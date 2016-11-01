/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kong2.common;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import kong2.member.MemberModel;
import kong2.member.MemberService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/**
 *
 * @author user2
 */
@Aspect
@Component
public class memberAspect {

    @Resource(name = "memberService")
    private MemberService memberService;

    @Around("@annotation(kong2.common.memberBeforeFunctionStart)")
    public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
        Object result = null;

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        HttpSession session = request.getSession();

        result = joinPoint.proceed();
        if (session.getAttribute("session_member_id") != null) {
            String loginId = (String) session.getAttribute("session_member_id");
            MemberModel member = memberService.getMember(loginId);
            MemberModel sendmemberModel = new MemberModel();
            sendmemberModel.setId_email(member.getId_email());
            sendmemberModel.setMember_num(member.getMember_num());
            sendmemberModel.setAdmin(member.getAdmin());
            System.out.println("member:" + sendmemberModel.toString());
            session.setAttribute("member", sendmemberModel);
        }
        return result;
    }
}
