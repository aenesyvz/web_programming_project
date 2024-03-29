package repositories;

import java.util.ArrayList;
import java.util.List;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

public class GenericRepositoryManager<T> implements GenericRepositoryService<T>{

	private SessionFactory _sessionFactory;
	private Class<T> _entityClass;
	
	public GenericRepositoryManager(Class<T> entityClass) {
		_sessionFactory = new Configuration()
								.configure("hibernate.cfg.xml")
								.buildSessionFactory();
		_entityClass = entityClass;
		
	}

	@Override
	public List<T> fetchAll() {
		Session session = _sessionFactory.openSession(); 
		List<T> returnList = new ArrayList<T>();
		
		try {
		    CriteriaBuilder builder = session.getCriteriaBuilder();
		    CriteriaQuery<T> criteria = builder.createQuery(_entityClass);
		    criteria.from(_entityClass);
		    returnList = session.createQuery(criteria).getResultList();
		} finally {
			session.close();
		}
		
		return returnList;
	}

	@Override
	public T fetchById(int id) {
		Session session = _sessionFactory.openSession(); 
		T entity = null;
		try {
			entity = session.get(_entityClass, id);		
		} finally {
			session.close();
		}
		
		return entity;
	}

	@Override
	public int save(T entity) {
		Session session = _sessionFactory.openSession(); 
		int entityId = -1;
		
		try {
			session.beginTransaction();
			entityId = (int) session.save(entity);
		    session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
		}	
		
		return entityId;
	}

	@Override
	public void update(T entity) {
		Session session = _sessionFactory.openSession(); 
		
		try {
			session.beginTransaction();
			session.update(entity);
		    session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
		}	
		
	}

	@Override
	public void deleteById(int id) {
		Session session = _sessionFactory.openSession(); 
		
		try {
			session.beginTransaction();
			T category = session.get(_entityClass, id);
			session.delete(category);
		    session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
		} finally {
			session.close();
		}	
		
	}
	
	protected SessionFactory getSessionFactory() {
		return this._sessionFactory;
	}

}
