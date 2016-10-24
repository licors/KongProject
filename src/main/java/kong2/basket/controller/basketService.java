package kong2.basket.controller;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;



public class basketService implements basketDAO{
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Object insertBasket(basketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("basket.basketInsert", basketModel);
	}

	@Override
	public List<basketModel> BasketList(basketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("basket.basket_list", basketModel);
	}

	@Override
	public Object deleteBasket(basketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("basket.basketDelete", basketModel);
	}

	@Override
	public Object deleteAllBasket(basketModel basketModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("basket.basketDelete_all", basketModel);
	}
}
