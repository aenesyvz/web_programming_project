package repositories;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.User;

public class UserManager extends GenericRepositoryManager<User> {
	public UserManager() {
		super(User.class);
	}
	
	public User fetchByUsernameAndPassword(String username, String password){
		Session session = getSessionFactory().openSession(); 
		User user = null;
		
		try {
			Query<User> query = session.createQuery("FROM User as u WHERE u.username =: username AND u.password =: password");
			query.setParameter("username", username);
			query.setParameter("password", password);
			user = query.uniqueResult();
		} finally {
			session.close();
		}
		
		return user;
	}
}
