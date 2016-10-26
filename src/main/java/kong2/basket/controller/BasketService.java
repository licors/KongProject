package kong2.basket.controller;

import java.util.List;

import javax.annotation.Resource;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BasketService implements BasketDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void basketInsert(BasketModel basketModel) {
		BasketMapper basketMapper = sqlSession.getMapper(BasketMapper.class);
		basketMapper.basketInsert(basketModel);
	}

	@Override
	public List<BasketModel> BasketList(int member_num) {
		List<BasketModel> list;
		BasketMapper basketMapper = sqlSession.getMapper(BasketMapper.class);
		list=basketMapper.BasketList(member_num);
		// TODO Auto-generated method stub
		return list;
	}

	@Override
	public void basketDelete(BasketModel basketModel) {
		BasketMapper basketMapper = sqlSession.getMapper(BasketMapper.class);
		basketMapper.basketDelete(basketModel);
		
	}

	@Override
	public void basketDelete_all(int member_num) {
		BasketMapper basketMapper = sqlSession.getMapper(BasketMapper.class);
		basketMapper.basketDelete_all(member_num);
		
	}

	@Override
	public BasketModel basket_check(BasketModel basketModel) {
		BasketMapper basketMapper = sqlSession.getMapper(BasketMapper.class);
		basketModel=basketMapper.basket_check(basketModel);

		return basketModel;
	}


	

}
