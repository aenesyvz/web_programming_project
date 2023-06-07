package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CartItem;
import models.Order;
import models.OrderItem;
import models.User;
import repositories.CartItemManager;
import repositories.OrderItemManager;
import repositories.OrderManager;
import repositories.ProductManager;
import repositories.UserManager;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserManager userManager = new UserManager();
		CartItemManager cartItemManager = new CartItemManager();
		OrderManager orderManager = new OrderManager();
		OrderItemManager orderItemManager = new OrderItemManager();
		ProductManager productManager = new ProductManager();
		
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("current-user");
		
			
		if(currentUser == null) {
			response.sendRedirect("login.jsp");
			return;
		}
			
		User user = userManager.fetchById(currentUser.getId());
			
			
		Order order = new Order(user, 0);				
		orderManager.save(order);
				
		List<CartItem> cartItems = cartItemManager.getAllByUserId(currentUser.getId());
			
			
		double price = 0;
			
		for (CartItem cartItem : cartItems) {
			if(cartItem.getProduct().getStock() <= 0) {
				continue;
			}
				
			OrderItem orderItem = new OrderItem(order, cartItem.getProduct(), cartItem.getProduct().getPrice(), cartItem.getQuantity(), false);
			orderItemManager.save(orderItem);
				
								
			cartItemManager.deleteById(cartItem.getId());
			cartItem.getProduct().setStock(cartItem.getProduct().getStock() - cartItem.getQuantity());
			productManager.update(cartItem.getProduct());
			price += cartItem.getProduct().getPrice() * cartItem.getQuantity();
				
			}
			
			order.setTotal(price);
			orderManager.update(order);
			
			response.sendRedirect("index.jsp");
			return;
			
	}

}
