package kong2.faq.controller;

import java.util.List;

import java.util.List;

import javax.annotation.Resource;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kong2.basket.controller.basketMapper;


public class faqService implements faqDAO{

	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<faqModel> selectall() {
		List<faqModel> list;
		faqMapper faqMapper = sqlSession.getMapper(faqMapper.class);
		list=faqMapper.selectall();
	
		return list;
	}

	@Override
	public faqModel selectOne(int no) {
		faqMapper faqMapper = sqlSession.getMapper(faqMapper.class);
		faqModel faqModel = faqMapper.selectOne(no);
		return faqModel;
	}

	@Override
	public void delete(int no) {
		faqMapper faqMapper = sqlSession.getMapper(faqMapper.class);
		faqMapper.delete(no);
		
	}

	@Override
	public void update(faqModel faqmodel) {
		faqMapper faqMapper = sqlSession.getMapper(faqMapper.class);
		faqMapper.update(faqmodel);
	}

	@Override
	public void insert(faqModel faqmodel) {
		faqMapper faqMapper = sqlSession.getMapper(faqMapper.class);
		faqMapper.insert(faqmodel);
		
	}


	

}
