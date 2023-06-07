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
	
	public List<OrderItem> getAllByOrderId(int id){
		Session session = getSessionFactory().openSession(); 
		List<OrderItem> orders = new ArrayList<OrderItem>();
		
		try {
			Query<OrderItem> query = session.createQuery("From OrderItem as item Where item.order.id =: id");
			query.setParameter("id", id);
			orders = query.list();
		} finally {
			session.close();
		}
		
		return orders;
	}
}
