package kong2.basket.controller;

import java.util.List;

public interface BasketMapper {
	
	 public void basketInsert(BasketModel basketModel);
		
		public List<BasketModel> BasketList(int member_num);
		
		public void basketDelete(BasketModel basketModel);
		
		public void basketDelete_all(int member_num);
		
		public BasketModel basket_check(BasketModel basketModel);
}
