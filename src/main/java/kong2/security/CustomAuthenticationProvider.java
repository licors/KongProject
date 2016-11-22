package kong2.security;

import java.util.Collection;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import kong2.member.MemberModel;
import kong2.member.MemberService;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

	@Resource(name = "memberService")
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class);

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		String id_email = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();

		logger.info("welcome authentication {}", id_email + "/" + password);

		MemberModel member;
		Collection<? extends GrantedAuthority> authorities;

		try {

			member = memberService.loadUserByUsername(id_email);

			// String hashedPassword = passwordEncoder.encodePassword(password,
			// saltSource.getSalt(user));

			/*logger.info("username : " + id_email + " / password : " + password);
			logger.info("username : " + member.getUsername() + " / password : " + member.getPassword());
			*/
			if (member.getAdmin() == -1) {
				throw new UsernameNotFoundException("회원정보가 없는 아이디입니다.");
			}
			if (!password.equals(member.getPassword())){
				throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
			}

			authorities = member.getAuthorities();
		} catch (UsernameNotFoundException e) {
			logger.info(e.toString());
			throw new UsernameNotFoundException(e.getMessage());
		} catch (BadCredentialsException e) {
			logger.info(e.toString());
			throw new BadCredentialsException(e.getMessage());
		} catch (Exception e) {
			logger.info(e.toString());
			throw new RuntimeException(e.getMessage());
		}

		return new UsernamePasswordAuthenticationToken(member, password, authorities);

		/*
		 * List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		 * if(id_email.equals("admin")) { roles.add(new
		 * SimpleGrantedAuthority("ROLE_ADMIN")); }else { roles.add(new
		 * SimpleGrantedAuthority("ROLE_USER")); }
		 * 
		 * logger.info("roles {}",roles.toString());
		 * UsernamePasswordAuthenticationToken result = new
		 * UsernamePasswordAuthenticationToken(id_email, password, roles);
		 * result.setDetails(new MemberModel(id_email, password)); return
		 * result;
		 */
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
//		return authentication.equals(UsernamePasswordAuthenticationToken.class);
		return true;
	}

}
