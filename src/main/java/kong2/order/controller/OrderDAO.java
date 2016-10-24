package kong2.order.controller;

import java.util.ArrayList;

public interface OrderDAO {
	//select
	public ArrayList<OrderModel> order_selectAll();
	public OrderModel order_selectOne(OrderModel orderModel);
	public ArrayList<OrderModel> orderList(OrderModel orderModel);
	public OrderModel orderDetail(OrderModel orderModel);
	public ArrayList<OrderModel> order_date_list(OrderModel orderModel);
	public OrderModel order_check(OrderModel orderModel);
	public ArrayList<OrderModel> search_id(OrderModel orderModel);
	public ArrayList<OrderModel> search_subject(OrderModel orderModel);
	public ArrayList<OrderModel> search_status(OrderModel orderModel);
	public ArrayList<OrderModel> search_date(OrderModel orderModel);
	
	//insert
	public void insert_order(OrderModel orderModel);
	
	//update
	public void update_order(OrderModel orderModel);
	
	//delete
	public void admin_order_delete(OrderModel orderModel);	
}