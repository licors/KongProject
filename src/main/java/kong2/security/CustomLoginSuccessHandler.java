package kong2.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.util.StringUtils;

import kong2.member.MemberModel;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private RequestCache requestCache = new HttpSessionRequestCache();
	private String targetUrlParameter;
	private String defaultUrl;
	private String adminUrl;
	private boolean useReferer;
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	public CustomLoginSuccessHandler() {
		// TODO Auto-generated constructor stub
		targetUrlParameter="";
		defaultUrl="/";
		adminUrl="/admin/main";
		useReferer=false;
	}
	
	public String getTargetUrlParameter() {
		return targetUrlParameter;
	}

	public void setTargetUrlParameter(String targetUrlParameter) {
		this.targetUrlParameter = targetUrlParameter;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	public boolean isUseReferer() {
		return useReferer;
	}

	public void setUseReferer(boolean useReferer) {
		this.useReferer = useReferer;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authetication)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
//		clearAuthenticationAttributes(request);
		MemberModel member = (MemberModel)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		HttpSession session = request.getSession();

		session.setAttribute("session_member_id", member.getId_email());
		session.setAttribute("session_member_name", member.getName());
		session.setAttribute("session_member_num", member.getMember_num());
		
		int intRedirectStrategy = decideRedirectStrategy(member.getAdmin(), request, response);
		switch (intRedirectStrategy) {
		case 1:
			logger.info("admin");
			useAdminUrl(request,response);
			break;
		case 2:
			logger.info("targetUrl");
			useTargetUrl(request,response);
			break;
		case 3:
			logger.info("SessionUrl");
			useSessionUrl(request,response);
			break;
		case 4:
			logger.info("RefererUrl");
			useRefererUrl(request,response);
			break;
		default:
			logger.info("DefaultUrl : /");
			useDefaultUrl(request,response);
			break;
		}
		
	}
	
	private void useAdminUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		redirectStrategy.sendRedirect(request, response, adminUrl);
	}

	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	private void useTargetUrl(HttpServletRequest request, HttpServletResponse response) throws IOException{
		// TODO Auto-generated method stub
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(savedRequest != null) {
			requestCache.removeRequest(request, response);
		}
		String targetUrl = request.getParameter(targetUrlParameter);
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void useSessionUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		String targetUrl = savedRequest.getRedirectUrl();
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void useRefererUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String targetUrl = request.getHeader("REFERER");
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private void useDefaultUrl(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		redirectStrategy.sendRedirect(request, response, defaultUrl);
	}

	/*인증 성공 후 어디로 보낼 지 결정
	 * return :
	 * 	0 defaultUrl /
	 *  1 admin 일 때 /admin/main
	 * 	2 targetUrlParameter 에 저장된 값
	 * 	3 session 에 저장된 값
	 * 	4 referer 헤더에 있는 값
	 * 	
	*/
	private int decideRedirectStrategy(int admin, HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		if(admin > 0) {
			return 1;
		}
		if(!"".equals(targetUrlParameter)) {
			String tagetUrl = request.getParameter(targetUrlParameter);
			logger.info("targetUrl : " + tagetUrl);
			if(StringUtils.hasText(tagetUrl)) {
				result = 2;
			} else {
				if(savedRequest != null) {
					result = 3;
				} else {
					String refererUrl = request.getHeader("REFERER");
					if(useReferer && StringUtils.hasText(refererUrl)) {
						result = 4;
					} else {
						result = 0;
					}
				}
			}
			return result;
		}
		
		if(savedRequest != null) {
			result = 3;
			return result;
		}
		
		String refererUrl = request.getHeader("REFERER");
		if(useReferer && StringUtils.hasText(refererUrl)) {
			result = 4;
		} else {
			result = 0;
		}
		return result;
		
	}

}
