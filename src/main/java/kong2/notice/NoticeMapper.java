package kong2.notice;

import java.util.List;

import kong2.notice.NoticeModel;

public interface NoticeMapper {
	

	//글 리스트
	List<NoticeModel> selectall();
	
	
	//글 보기
	NoticeModel selectOne(int no);
	
	//글삭제
	void delete(int no);
	
	//글수정
	void update(NoticeModel noticemodel);
	
	//글쓰기
	void insert(NoticeModel noticemodel);
	
	void readcount(NoticeModel noticeModel);

}
