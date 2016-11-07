package kong2.order;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kong2.showcase.ShowcaseModel;

@Service
public class OrderService implements OrderDAO {

	@Autowired
	private SqlSession sqlSession;

	// select
	@Override
	public ArrayList<OrderModel> order_selectAll() {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.order_selectAll();

		return result;
	}

	@Override
	public OrderModel order_selectOne(OrderModel orderModel) {
		OrderModel result = new OrderModel();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.order_selectOne(orderModel);
		
		return result;
	}

	@Override
	public ArrayList<OrderModel> orderList(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.orderList(orderModel);

		return result;
	}

	@Override
	public OrderModel orderView(OrderModel orderModel) {
		OrderModel result = new OrderModel();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.orderView(orderModel);
		
		return result;
	}

	@Override
	public ArrayList<OrderModel> order_date_list(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.order_date_list(orderModel);

		return result;
	}

	@Override
	public OrderModel order_check(OrderModel orderModel) {
		OrderModel result = new OrderModel();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.order_check(orderModel);
		
		return result;
	}

	@Override
	public ArrayList<OrderModel> search_id(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.search_id(orderModel);

		return result;
	}

	@Override
	public ArrayList<OrderModel> search_subject(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.search_subject(orderModel);

		return result;
	}

	@Override
	public ArrayList<OrderModel> search_status(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.search_status(orderModel);

		return result;
	}

	@Override
	public ArrayList<OrderModel> search_date(OrderModel orderModel) {
		ArrayList<OrderModel> result = new ArrayList<OrderModel>();
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		result = orderMapper.search_date(orderModel);

		return result;
	}

	// insert
	@Override
	public void insert_order(OrderModel orderModel) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.insert_order(orderModel);
	}
	
	@Override
	public void ordercountPlus(ShowcaseModel showcaseModel) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.ordercountPlus(showcaseModel);
	}
	
	@Override
	public void ordercountMinus(ShowcaseModel showcaseModel) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.ordercountMinus(showcaseModel);
	}

	// update
	@Override
	public void update_order(OrderModel orderModel) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.update_order(orderModel);
	}

	// delete
	@Override
	public void admin_order_delete(OrderModel orderModel) {
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		orderMapper.admin_order_delete(orderModel);
	}
}
