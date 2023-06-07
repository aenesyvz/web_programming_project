package repositories;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.User;

public class UserManager extends GenericRepositoryManager<User> {
	public UserManager() {
		super(User.class);
	}
	
	public User getByUsernameAndPassword(String username, String password){
		Session session = getSessionFactory().openSession(); 
		User user;
		
		try {
			Query<User> query = session.createQuery("From User as item Where item.username =: username And item.password =: password");
			query.setParameter("username", username);
			query.setParameter("password", password);
			user = query.uniqueResult();
		} finally {
			session.close();
		}
		
		return user;
	}
}
