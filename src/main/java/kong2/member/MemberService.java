package kong2.member;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kong2.security.Role;
import kong2.showcase.ShowcaseModel;

@Service
public class MemberService implements MemberDao, UserDetailsService{
	private static final Logger logger = LoggerFactory.getLogger(MemberService.class);
	 
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberModel memberLogin(MemberModel member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.memberLogin(member);
	}

	@Override
	public ArrayList<MemberModel> memberList() {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		 ArrayList<MemberModel> result = memberMapper.memberList();
		 return result;
	}

	@Override
	public void MemberAdd(MemberModel member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.MemberAdd(member);
	}

	@Override
	public String idCheck(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.idCheck(id);
	}

	@Override
	public String passwordFind(MemberModel member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.passwordFind(member);
	}

	@Override
	public void memberModify(MemberModel member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.memberModify(member);
	}

	@Override
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		memberMapper.memberDelete(id);
	}

	@Override
	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.getMember(id);
	}

	@Override
	public MemberModel loadUserByUsername(String id_email){
		// TODO Auto-generated method stub
		MemberModel member = getMember(id_email);

        //password 암호화 추가 가능

        Role role = new Role();
        
        if(member != null) {
        	if(member.getAdmin() == 0) {
        		logger.info("role_user");
        		role.setName("ROLE_USER");
        	} else {
        		logger.info("role_admin");
        		role.setName("ROLE_ADMIN");
        	}
        } else {
        	throw new UsernameNotFoundException("회원 정보가 없습니다.");
        }
        
        
        List<Role> roles = new ArrayList<Role>();
        roles.add(role);
        member.setAuthorities(roles);
        
		logger.info("loadUserByUsername username : " + id_email);
		logger.info("loadUserByUsername username : " + member.toString());
        return member;
	}
	
}
