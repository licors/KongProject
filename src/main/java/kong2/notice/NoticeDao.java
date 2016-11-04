package kong2.notice;

import java.util.List;



public interface NoticeDao {
	
List<NoticeModel> selectall();
	
	
	//글 보기
	NoticeModel selectOne(NoticeModel noticeModel);
	
	//글삭제
	void delete(int no);
	
	//글수정
	void update(NoticeModel noticemodel);
	
	//글쓰기
	void insert(NoticeModel noticemodel);
	
	void readcount(NoticeModel noticeModel);

}
