package kong2.faq.controller;

import java.util.List;





public interface faqDAO {

	
	//글 리스트 
	List<kong2.faq.controller.faqModel> faqList();
	
	
	//글 보기
	faqModel faqView(int no);
	
	//글삭제
	int faqDelete(int no);
	
	//글수정
	int faqModify(faqModel faqmodel);
	
	//글쓰기
	int faqWrite(faqModel faqmodel);
}
