package repositories;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.CartItem;

public class CartItemManager extends GenericRepositoryManager<CartItem> {
	public CartItemManager() {
		super(CartItem.class);
	}
	
	public List<CartItem> getAllByUserId(int id){
		Session session = getSessionFactory().openSession(); 
		List<CartItem> cartItems;
		
		try {
			Query<CartItem> query = session.createQuery("From CartItem as item Where item.user.id =: id");
			query.setParameter("id", id);
			cartItems = query.list();
		} finally {
			session.close();
		}
		
		return cartItems;
	}
}
