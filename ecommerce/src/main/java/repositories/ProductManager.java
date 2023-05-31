package repositories;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.Product;

public class ProductManager extends GenericRepositoryManager<Product> {
	public ProductManager() {
		super(Product.class);
	}
	
	public List<Product> getAllByCategoryId(int categoryId){
		Session session = getSessionFactory().openSession(); 
		List<Product> returnList = new ArrayList<Product>();
		
		try {
			Query<Product> query = session.createQuery("FROM Product as p WHERE p.category.id =: id");
			query.setParameter("id", categoryId);
			returnList = query.list();
		} finally {
			session.close();
		}
		
		return returnList;
	}
	
	public List<Product> fetchAllGreaterThanPrice(double price){
		Session session = getSessionFactory().openSession(); 
		List<Product> returnList = new ArrayList<Product>();
		
		try {
			Query<Product> query = session.createQuery("FROM Product as p WHERE p.price >=: price");
			query.setParameter("price", price);
			returnList = query.list();
		} finally {
			session.close();
		}
		
		return returnList;
	}
	
	public List<Product> fetchAllLessThanPrice(double price){
		Session session = getSessionFactory().openSession(); 
		List<Product> returnList = new ArrayList<Product>();
		
		try {
			Query<Product> query = session.createQuery("FROM Product as p WHERE p.price <=: price");
			query.setParameter("price", price);
			returnList = query.list();
		} finally {
			session.close();
		}
		
		return returnList;
	}
	
	public List<Product> fetchAllInStock(){
		Session session = getSessionFactory().openSession(); 
		List<Product> returnList = new ArrayList<Product>();
		
		try {
			Query<Product> query = session.createQuery("FROM Product as p WHERE p.stock > 0");
			returnList = query.list();
		} finally {
			session.close();
		}
		
		return returnList;
	}
}
