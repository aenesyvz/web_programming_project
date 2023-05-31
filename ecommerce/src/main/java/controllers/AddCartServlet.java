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
import models.Product;
import models.User;
import repositories.CartItemManager;
import repositories.ProductManager;
import repositories.UserManager;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
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
		ProductManager productManager = new ProductManager();
		CartItemManager cartItemManager = new CartItemManager();
		UserManager userManager = new UserManager();
		
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("current-user");
		
		
		if(currentUser == null || currentUser.getId() < 0) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		
		
		Product product = productManager.fetchById(productId);
		
		
		List<CartItem> userCartItems = cartItemManager.fetchAllByUserId(currentUser.getId());
		
		
		CartItem currentCartItem = null;
		
		for (CartItem iterationCartItem : userCartItems) {
			if(iterationCartItem.getUser().getId() == currentUser.getId() && iterationCartItem.getProduct().getId() == product.getId()) {
				currentCartItem = iterationCartItem;
			}
		}				
		
		if(currentCartItem != null) {
			int totalQuantity = (currentCartItem.getQuantity() + quantity);
			if(totalQuantity > product.getStock()) {
				totalQuantity = product.getStock();
			}
			currentCartItem.setQuantity(totalQuantity);
			cartItemManager.update(currentCartItem);
			
			response.sendRedirect("index.jsp");
			return;	
		} else {
			if(quantity > product.getStock()) {
				quantity = product.getStock();
			}
			CartItem cartItem = new CartItem(currentUser, product, quantity);
			cartItemManager.save(cartItem);
			
			response.sendRedirect("index.jsp");
			return;	
		}			
	}

}
