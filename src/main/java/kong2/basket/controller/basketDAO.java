package kong2.basket.controller;

import java.util.List;

import kong2.basket.controller.basketModel;

public interface basketDAO {

	  public void basketInsert(basketModel basketModel);
		
		public List<basketModel> BasketList();
		
		public void basketDelete(basketModel basketModel);
		
		public void basketDelete_all(basketModel basketModel);
		
		public basketModel basket_check(basketModel basketModel);
}


