package kong2.member;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService implements MemberDao{

//	@Resource(name="sqlSessionTemplate")
//	private SqlSessionTemplate sqlSessionTemplate;
//	
//	@Override
//    public MemberModel memberLogin(MemberModel mem) {
//	    return sqlSessionTemplate.selectOne("member.login", mem);
//    }
//
//	@Override
//	public MemberModel getMember(String id) {
//		return sqlSessionTemplate.selectOne("member.getMember", id);
//	}
//
//	@Override
//	public Object insertMember(MemberModel mem) {
//		return sqlSessionTemplate.insert("member.insertMember", mem);
//	}
//
//	@Override
//	public MemberModel pwFindById(MemberModel member) {
//		return sqlSessionTemplate.selectOne("member.pwfind", member);
//    }
//    
//	@Override
//	public Object memberModify(MemberModel member) {
//		return sqlSessionTemplate.update("member.updateMember", member);
//	}
//	
//	@Override
//	public Object memberDelete(String id) {
//		return sqlSessionTemplate.delete("member.deleteMember", id);
//    }
//	
//	@Override
//	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSessionTemplate.selectList("member.zipcodeCheck", zipcodeModel);
//	}

	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberModel memberLogin(MemberModel member) {
		// TODO Auto-generated method stub
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		return memberMapper.memberLogin(member);
	}

	@Override
	public ArrayList<MemberModel> memberList(MemberModel member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void MemberAdd(MemberModel member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberModel idCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberModel passwordFind(MemberModel member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberModify(MemberModel member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memberDelete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberModel getMember(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	@Override
//	public ArrayList<MemberModel> getMembers() {
//		// TODO Auto-generated method stub
//		ArrayList<MemberModel> result = new ArrayList<MemberModel>();
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		result = memberMapper.getMembers();
//		return result;
//	} 
//
//	@Override
//	public void insertMember(MemberModel member) {
//		// TODO Auto-generated method stub
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.insertMember(member);
//	}
//
//	
//
//	@Override
//	public MemberModel getMember(String id) {
//		// TODO Auto-generated method stub
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		return memberMapper.getMember(id);
//	}
//
//	@Override
//	public MemberModel pwFindById(MemberModel member) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void memberModify(MemberModel member) {
//		// TODO Auto-generated method stub
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.memberModify(member);
//	}
//
//	@Override
//	public void memberDelete(String id) {
//		// TODO Auto-generated method stub
//		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
//		memberMapper.memberDelete(id);
//	}
//
//	@Override
//	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
