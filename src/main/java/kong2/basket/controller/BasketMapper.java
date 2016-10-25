package kong2.basket.controller;

import java.util.List;

public interface BasketMapper {
	
	 public void basketInsert(BasketModel basketModel);
		
		public List<BasketModel> BasketList();
		
		public void basketDelete(BasketModel basketModel);
		
		public void basketDelete_all(BasketModel basketModel);
		
		public BasketModel basket_check(BasketModel basketModel);
}
