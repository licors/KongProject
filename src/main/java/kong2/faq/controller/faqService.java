package kong2.faq.controller;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import kong2.faq.controller.faqDAO;

public class faqService implements faqDAO{

	
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<kong2.faq.controller.faqModel> faqList() {

		return sqlSessionTemplate.selectList("faq.faqList"); 

	}

}
