package kong2.basket.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class basketService implements basketDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void basketInsert(basketModel basketModel) {
		basketMapper basketMapper = sqlSession.getMapper(basketMapper.class);
		basketMapper.basketInsert(basketModel);
	}

	@Override
	public List<basketModel> BasketList() {
		List<basketModel> list;
		basketMapper basketMapper = sqlSession.getMapper(basketMapper.class);
		list=basketMapper.BasketList();
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public void basketDelete(basketModel basketModel) {
		basketMapper basketMapper = sqlSession.getMapper(basketMapper.class);
		basketMapper.basketDelete(basketModel);
		
	}

	@Override
	public void basketDelete_all(basketModel basketModel) {
		basketMapper basketMapper = sqlSession.getMapper(basketMapper.class);
		basketMapper.basketDelete_all(basketModel);
		
	}

	@Override
	public basketModel basket_check(basketModel basketModel) {
		basketMapper basketMapper = sqlSession.getMapper(basketMapper.class);
		basketModel=basketMapper.basket_check(basketModel);

		return basketModel;
	}


	

}
