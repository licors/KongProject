package kong2.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kong2.validator.MemberValidator;



@Controller
@RequestMapping("/member")
public class MemberController {
   
   @Resource(name="memberService")
   private MemberService memberService;
   
   ModelAndView mav = new ModelAndView();
   
   
   private List<ZipcodeModel> zipcodeList = new ArrayList<ZipcodeModel>();
   
   
   //�α��� ��
   @RequestMapping(value="/login", method=RequestMethod.GET)
   public String loginForm() {
      return "loginForm";
   }

   //�α��ε��� �� ���� ����
   @RequestMapping(value="/login", method=RequestMethod.POST)
   public ModelAndView memberLogin(HttpServletRequest request, MemberModel mem) {

      MemberModel result = memberService.memberLogin(mem);
      //ModelAndView mav = new ModelAndView();
      
      if(result!=null) {
         
         HttpSession session = request.getSession();         
         
         session.setAttribute("mem", result);
         session.setAttribute("session_member_id", result.getId());
         session.setAttribute("session_member_name", result.getName());
         session.setAttribute("session_member_no", result.getNum());
      
         session.setAttribute("TOKEN_SAVE_CHECK", "TRUE");
                 
         mav.setViewName("auth/loginSuccess");
         return mav;
      }
      
      //System.out.println("�α��� ����");         
      mav.setViewName("auth/loginError");
      return mav;
         
   }
   
   
   
   @RequestMapping("/logout")
   public ModelAndView memberLogout(HttpServletRequest request, MemberModel mem){
      
      HttpSession session = request.getSession(false);
      
      if(session!=null){
         session.invalidate();
      }
      MemberModel member = (MemberModel) session.getAttribute("mem");
      
      mav.addObject("member", new MemberModel());
      //ModelAndView mav = new ModelAndView();
      mav.setViewName("member/logout");
      return mav;
   }
   
   
   //��ȿ���˻������� ���������� �Ѿ�Բ� �������
      @ModelAttribute("member")
      public MemberModel formBack() {
         return new MemberModel();
      }
      
      @RequestMapping("/member")
      public ModelAndView memberStep1(){
         
    	 ModelAndView mav = new ModelAndView();
    	  
         mav.setViewName("member");
         return mav;
      }
      
      
      
      @RequestMapping("/memberEnd")
      public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member,
                              BindingResult result) {
         
         //<form:form commandName="member"> �˻��� model�� ������ �÷��� �̸��� �����ϰ��Ѵ�.
         
         // Validation Binding
         new MemberValidator().validate(member, result);
         
         // ������������ ȸ������������ �Ѿ
         if(result.hasErrors()) {
        	 
        	ModelAndView mav = new ModelAndView();
        	 
            mav.setViewName("member");
            return mav;
         }
         try {
            // ��ȿ���˻翡 ����ϸ� ȸ������
        	member.setAddr(member.getAddr()+" " + member.getAddr2());
            
            memberService.insertMember(member);
            mav.addObject("member",member);
            mav.setViewName("memberEnd");
            return mav;
         } catch (DuplicateKeyException e) {
            // db���� id�� ���������� unique�� �ٲ�� ������ �ߺ��� ���̵�� �����Ϸ��ϸ� DuplicateKeyException�� �߰Եǰ�
            // ����ó���� properties���Ͽ� ��ϵ� "invalid"�� ������ ������ ����� ȸ������������ ���ư�������.
            // ���̵� �ߺ��˻�
            result.reject("invalid", null);
            mav.setViewName("member");
            return mav;
         }

      }
      

  	@RequestMapping(value = "/memberIdFind", method = RequestMethod.GET)
  	public ModelAndView memberFindForm() {
  		mav.setViewName("member/idFind");
  		return mav;
  	}

  	@RequestMapping(value = "/memberIdFind", method = RequestMethod.POST)
  	public ModelAndView memberIdFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

  		int memberFindChk;

  		member = memberService.idFindByName(member);
  		if (member == null) {
  			memberFindChk = 0; // ���ԵǾ� �ִ� ��� X;
  			mav.addObject("memberFindChk", memberFindChk);
  			mav.setViewName("member/idFindError");
  			return mav;

  		} else {
  			if (member.getName().equals(member.getName()) && member.getEmail().equals(member.getEmail())) {
  				memberFindChk = 1; // ȸ�����ԵǾ� ����, �̸��� ��ġ
  				mav.addObject("member", member);
  				mav.addObject("memberFindChk", memberFindChk);
  				mav.setViewName("member/idFindOk");
  				return mav;
  			} else {
  				memberFindChk = -1; // �̸� , �̸��� Ʋ��
  				mav.addObject("memberFindChk", memberFindChk);
  				mav.setViewName("member/idFindError");
  				return mav;
  			}
  		}
  	}

  	// ��й�ȣã��
  	@RequestMapping(value = "/memberPwFind", method = RequestMethod.GET)
  	public ModelAndView memberPwFindForm() {
  		mav.setViewName("member/pwFind");
  		return mav;
  	}

  	@RequestMapping(value = "/memberPwFind", method = RequestMethod.POST)
  	public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

  		int memberFindChk;


  		member = memberService.pwFindById(member);
  		
  		if (member == null) {
  			memberFindChk = 0; // ���ԵǾ� �ִ� ��� X;
  			mav.addObject("memberFindChk", memberFindChk);
  			mav.setViewName("member/idFindError");
  			return mav;

  		} else {
  			
  			if (member.getId().equals(member.getId()) && member.getEmail().equals(member.getEmail())) {
  				memberFindChk = 1; // ȸ�����ԵǾ� ����, �̸��� ��ġ
  				mav.addObject("member", member);
  				mav.addObject("memberFindChk", memberFindChk);
  				mav.setViewName("member/pwFindOk");
  				return mav;
  			} else {
  				memberFindChk = -1; // �̸� , �̸��� Ʋ��
  				mav.addObject("memberFindChk", memberFindChk);
  				mav.setViewName("member/idFindError");
  				return mav;
  			}
  		}
  	}

  	// ȸ����������
  	@RequestMapping("/memberModify")
  	public ModelAndView memberModify(@ModelAttribute("member") MemberModel member, BindingResult result,
  			HttpSession session) {
  		session.getAttribute("session_member_id");

  		if (session.getAttribute("session_member_id") != null) {
  			String id = (String) session.getAttribute("session_member_id");
  			member = memberService.getMember(id);

  			mav.addObject("member", member);
  			mav.setViewName("memberModify");
  			return mav;
  		} else {

  			mav.setViewName("loginConfirm");
  			return mav;
  		}
  	}

  	@RequestMapping("/memberModifyEnd")
  	public ModelAndView memberModifyEnd(@ModelAttribute("member") MemberModel member, BindingResult result) {
  		// Validation Binding
  		/*new MemberValidator().validate(member, result);*/
  	
  		try {
  			// ��ȿ���˻翡 ����ϸ�
  			memberService.memberModify(member);
  			mav.setViewName("memberModifyEnd");
  			return mav;
  		} catch (DuplicateKeyException e) {
  			// db���� id�� ���������� unique�� �ٲ�� ������ �ߺ��� ���̵�� �����Ϸ��ϸ�
  			// DuplicateKeyException�� �߰Եǰ�
  			// ����ó���� properties���Ͽ� ��ϵ� "invalid"�� ������ ������ ����� ȸ������������ ���ư�������.
  			// ���̵� �ߺ��˻�
  			result.reject("invalid", null);
  			System.out.println("ĳġ����");
  			mav.setViewName("memberModify");
  			return mav;
  		}

  	}
   
      @RequestMapping(value="/zipcodeCheckForm")
      public ModelAndView zipcodeCheckForm( HttpServletRequest req) throws Exception{
         ModelAndView mv = new ModelAndView();

             mv.setViewName("check/zipcodeCheck");
          return mv;
   }
      /*ȸ�����Խ� �����ȣ �˻� ����*/ 
      @RequestMapping(value="/zipcodeCheck")
      public ModelAndView zipcodeCheck( @ModelAttribute ZipcodeModel zipcodeModel ,HttpServletRequest req) throws Exception{
         
    	 ModelAndView mv = new ModelAndView();
         
         int chk=100;

         zipcodeList = memberService.zipcodeCheck(zipcodeModel);
             
         mv.addObject("zipcode", zipcodeList);
                
         if(zipcodeList.size() == 0){
        	 chk =0;
         }else{
        	 chk=1;
         }
             mv.addObject("chk",chk);
             mv.setViewName("check/zipcodeCheck");
             return mv;
          }   
   
   
        @RequestMapping("/memberWith")
     	public ModelAndView memberWith() {
     		mav.setViewName("signOut");
     		return mav;
     	}
     	
     	@RequestMapping("/memberDelete")
     	public ModelAndView memberDelete(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
     		
     		MemberModel memberModel; // ���� ��� ���� ������ ��ü
     		
     		String id;
     		String password;
     		password = request.getParameter("password");
     		int deleteCheck;
     		
     		//�ش� ���̵��� ������ �����´�
     		id = session.getAttribute("session_member_id").toString();
     		memberModel = (MemberModel) memberService.getMember(id);
     		
     		
     		
     		if(memberModel.getPassword().equals(password)) {
     			//�н����尡 ������
     			deleteCheck = 1;
     			//���� ���� ����
     			memberService.memberDelete(id);
     			session.removeAttribute("session_member_id");
     			session.removeAttribute("session_member_name");
     		/*	session.removeAttribute("session_member_no");*/
     		}
     		else {
     			deleteCheck = -1; //�н����尡 �ȸ�����
     		}
     		
     		mav.addObject("deleteCheck", deleteCheck);
     		mav.setViewName("deleteResult");
     		return mav;
     	}
   
   
}
