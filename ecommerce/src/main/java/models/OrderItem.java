package models;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_items")
public class OrderItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "order_id", referencedColumnName = "id", nullable = false)
	private Order order;
	
	@ManyToOne
	@JoinColumn(name = "product_id", referencedColumnName = "id", nullable = false)
	private Product product;
	
	@Column(name = "price", nullable = false)
	private double price;
	
	@Column(name = "quantity", nullable = false)
	private int quantity;
	
	@Column(name = "is_delivered", nullable = false)
	private boolean delivered;
	
	

	public OrderItem() {
	}
	
	public OrderItem(Order order, Product product, double price, int quantity, boolean delivered) {
		this.order = order;
		this.product = product;
		this.price = price;
		this.quantity = quantity;
		this.delivered = delivered;
	}
	
	

	public int getId() {
		return id;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public boolean isDelivered() {
		return delivered;
	}

	public void setDelivered(boolean delivered) {
		this.delivered = delivered;
	}
}