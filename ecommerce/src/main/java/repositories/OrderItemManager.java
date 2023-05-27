package repositories;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.OrderItem;

public class OrderItemManager extends GenericRepositoryManager<OrderItem>{

	public OrderItemManager() {
		super(OrderItem.class);
	}
	
	public List<OrderItem> fetchAllByOrderId(int orderId){
		Session session = getSessionFactory().openSession(); 
		List<OrderItem> returnList = new ArrayList<OrderItem>();
		
		try {
			Query<OrderItem> query = session.createQuery("FROM OrderItem as o WHERE o.order.id =: id");
			query.setParameter("id", orderId);
			returnList = query.list();
		} finally {
			session.close();
		}
		
		return returnList;
	}
}