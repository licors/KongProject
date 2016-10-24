package kong2.basket.controller;

import java.util.List;

import kong2.basket.controller.basketModel;

public interface basketDAO {

    public Object insertBasket(basketModel basketModel);
	
	public List<basketModel> BasketList(basketModel basketModel);
	
	public Object deleteBasket(basketModel basketModel);
	
	public Object deleteAllBasket(basketModel basketModel);
}
