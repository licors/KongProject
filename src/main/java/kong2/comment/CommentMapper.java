package kong2.comment;

import java.util.List;

public interface CommentMapper {
	List<CommentModel> selectall(int showcase_num);
	
	//글 보기
	CommentModel selectOne(int comment_num);
	
	//글삭제
	void delete(int comment_num);
	
	//글수정
	void update(CommentModel commentModel);
	
	//글쓰기
	void insert(CommentModel commentModel);
}
