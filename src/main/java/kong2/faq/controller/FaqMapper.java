package kong2.faq.controller;

import java.util.List;

public interface FaqMapper {

	//글 리스트
	List<FaqModel> selectall();
	
	
	//글 보기
	FaqModel selectOne(int no);
	
	//글삭제
	void delete(int no);
	
	//글수정
	void update(FaqModel faqmodel);
	
	//글쓰기
	void insert(FaqModel faqmodel);
}
