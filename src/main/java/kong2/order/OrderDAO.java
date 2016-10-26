package kong2.order;

import java.util.ArrayList;

import kong2.showcase.ShowcaseModel;

public interface OrderDAO {
	//select
	public ArrayList<OrderModel> order_selectAll();
	public OrderModel order_selectOne(OrderModel orderModel);
	public ArrayList<OrderModel> orderList(OrderModel orderModel);
	public OrderModel orderView(OrderModel orderModel);
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
	public void ordercountPlus(ShowcaseModel showcaseModel);
	public void ordercountMinus(ShowcaseModel showcaseModel);
	
	//delete
	public void admin_order_delete(OrderModel orderModel);	
}