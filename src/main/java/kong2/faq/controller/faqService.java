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
		return sqlSessionTemplate.selectList("faq.selectall");

	}

	@Override
	public faqModel faqView(int no) {
		return sqlSessionTemplate.selectOne("faq.selectOne",no);

	}

	@Override
	public int faqDelete(int no) {
		return sqlSessionTemplate.update("faq.delete",no); 

	}

	@Override
	public int faqModify(faqModel faqmodel) {
		return sqlSessionTemplate.update("faq.update",faqmodel); 

	}

	@Override
	public int faqWrite(faqModel faqmodel) {
		return sqlSessionTemplate.insert("faq.insert", faqmodel);
	
	}
	
	

}
