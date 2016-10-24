package kong2.faq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import kong2.faq.controller.faqDAO;

public class faqService implements faqDAO{

	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<faqModel> faqList() {
	
		return null;
	}

	@Override
	public faqModel faqView(int no) {

		return null;
	}

	@Override
	public int faqDelete(int no) {

		return 0;
	}

	@Override
	public int faqModify(faqModel QnAmodel) {

		return 0;
	}

	@Override
	public int faqWrite(faqModel QnAmodel) {

		return 0;
	}
	
	

}
