package kong2.member;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kong2.showcase.ShowcaseModel;

@Service
public class MemberService implements MemberDao{

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
	
}
