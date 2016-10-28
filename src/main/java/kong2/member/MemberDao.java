package kong2.member;

import java.util.ArrayList;
import java.util.List;

public interface MemberDao {
	
	public ArrayList<MemberModel> memberList(MemberModel member);
	
	public MemberModel memberLogin(MemberModel member);

	public void MemberAdd(MemberModel member);
	
	public String idCheck(String id);
	
	public String passwordFind(MemberModel member);

	public void memberModify(MemberModel member);

	public void memberDelete(String id);
	
	public MemberModel getMember(String id);
}



