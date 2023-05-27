package repositories;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.CartItem;

public class CartItemManager extends GenericRepositoryManager<CartItem> {
	public CartItemManager() {
		super(CartItem.class);
	}
	
	public List<CartItem> fetchAllByUserId(int userId){
		Session session = getSessionFactory().openSession(); 
		List<CartItem> cartItems = null;
		
		try {
			Query<CartItem> query = session.createQuery("FROM CartItem as c WHERE c.user.id =: userid");
			query.setParameter("userid", userId);
			cartItems = query.list();
		} finally {
			session.close();
		}
		
		return cartItems;
	}
}
