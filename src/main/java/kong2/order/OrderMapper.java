package kong2.order;

import java.util.ArrayList;

public interface OrderMapper {
	//select
	ArrayList<OrderModel> order_selectAll();
	OrderModel order_selectOne(OrderModel orderModel);
	ArrayList<OrderModel> orderList(OrderModel orderModel);
	OrderModel orderDetail(OrderModel orderModel);
	ArrayList<OrderModel> order_date_list(OrderModel orderModel);
	OrderModel order_check(OrderModel orderModel);
	ArrayList<OrderModel> search_id(OrderModel orderModel);
	ArrayList<OrderModel> search_subject(OrderModel orderModel);
	ArrayList<OrderModel> search_status(OrderModel orderModel);
	ArrayList<OrderModel> search_date(OrderModel orderModel);
	
	//insert
	void insert_order(OrderModel orderModel);
	
	//update
	void update_order(OrderModel orderModel);
	
	//delete
	void admin_order_delete(OrderModel orderModel);	
}
