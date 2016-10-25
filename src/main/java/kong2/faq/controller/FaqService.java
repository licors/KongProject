package kong2.faq.controller;

import java.util.List;

import java.util.List;

import javax.annotation.Resource;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kong2.basket.controller.BasketMapper;


public class FaqService implements FaqDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<FaqModel> selectall() {
		List<FaqModel> list;
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		list=faqMapper.selectall();
	
		return list;
	}

	@Override
	public FaqModel selectOne(int no) {
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		FaqModel faqModel = faqMapper.selectOne(no);
		return faqModel;
	}

	@Override
	public void delete(int no) {
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		faqMapper.delete(no);
		
	}

	@Override
	public void update(FaqModel faqmodel) {
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		faqMapper.update(faqmodel);
	}

	@Override
	public void insert(FaqModel faqmodel) {
		FaqMapper faqMapper = sqlSession.getMapper(FaqMapper.class);
		faqMapper.insert(faqmodel);
		
	}


	

}
