package kong2.member.controller;



import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;



@Service
public class MemberService implements MemberDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
    public MemberModel memberLogin(MemberModel mem) {
	    return sqlSessionTemplate.selectOne("member.login", mem);
    }

	@Override
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("member.getMember", id);
	}

	@Override
	public Object insertMember(MemberModel mem) {
		return sqlSessionTemplate.insert("member.insertMember", mem);
	}

	@Override
	public MemberModel pwFindById(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.pwfind", member);
    }
    
	@Override
	public Object memberModify(MemberModel member) {
		return sqlSessionTemplate.update("member.updateMember", member);
	}
	
	@Override
	public Object memberDelete(String id) {
		return sqlSessionTemplate.delete("member.deleteMember", id);
    }
	
	@Override
	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.zipcodeCheck", zipcodeModel);
	}

	
	
}
