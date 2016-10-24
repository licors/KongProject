package kong2.basket.controller;

import java.util.List;

public interface basketMapper {
	
	 public void basketInsert(basketModel basketModel);
		
		public List<basketModel> BasketList();
		
		public void basketDelete(basketModel basketModel);
		
		public void basketDelete_all(basketModel basketModel);
		
		public basketModel basket_check(basketModel basketModel);
}
