package kong2.member.controller;

import java.util.List;

public interface MemberDao {

	public MemberModel memberLogin(MemberModel mem);

	public MemberModel getMember(String id);

	public Object insertMember(MemberModel mem);

	public MemberModel idFindByName(MemberModel member);
	
	public MemberModel pwFindById(MemberModel member);

	public Object memberModify(MemberModel member);

	public Object memberDelete(String id);
	
	public List<ZipcodeModel> zipcodeCheck(ZipcodeModel zipcodeModel) throws Exception;
	
}



