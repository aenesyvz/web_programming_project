package repositories;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import models.Order;

public class OrderManager extends GenericRepositoryManager<Order>{
	public OrderManager() {
		super(Order.class);
	}
	
	public List<Order> getAllByBetweenOrderDate(String startDate, String finishDate){		
		Session session = getSessionFactory().openSession(); 
		List<Order> orders = new ArrayList<Order>();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Calendar calenderForStartDate = Calendar.getInstance();
			calenderForStartDate.setTime(simpleDateFormat.parse(startDate));
			calenderForStartDate.add(Calendar.HOUR, 23);
			calenderForStartDate.add(Calendar.MINUTE, 59);
			calenderForStartDate.add(Calendar.SECOND, 59);
			
			Calendar calenderForFinishDate = Calendar.getInstance();
			calenderForFinishDate.setTime(simpleDateFormat.parse(finishDate));
			calenderForFinishDate.add(Calendar.HOUR, 23);
			calenderForFinishDate.add(Calendar.MINUTE, 59);
			calenderForFinishDate.add(Calendar.SECOND, 59);
			
			SimpleDateFormat finalFormat =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			Query<Order> query = session.createQuery("From Order as item Where item.createdAt >=: startDate And item.createdAt <=: finishDate");
			query.setParameter("startDate", finalFormat.parse(finalFormat.format(calenderForStartDate.getTime())));
			query.setParameter("finishDate", finalFormat.parse(finalFormat.format(calenderForFinishDate.getTime())));
			orders = query.list();
		} catch(Exception e) {			
		} finally {
			session.close();
		}
		
		return orders;
	}
}
