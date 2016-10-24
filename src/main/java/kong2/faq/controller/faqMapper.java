package kong2.faq.controller;

import java.util.List;

public interface faqMapper {

	//글 리스트
	List<faqModel> selectall();
	
	
	//글 보기
	faqModel selectOne(int no);
	
	//글삭제
	void delete(int no);
	
	//글수정
	void update(faqModel faqmodel);
	
	//글쓰기
	void insert(faqModel faqmodel);
}
