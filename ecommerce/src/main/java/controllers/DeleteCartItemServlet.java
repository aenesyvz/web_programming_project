package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import repositories.CartItemManager;
import repositories.UserManager;

/**
 * Servlet implementation class DeleteCartItemServlet
 */
@WebServlet("/DeleteCartItemServlet")
public class DeleteCartItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartItemServlet() {
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
		CartItemManager cartItemManager = new CartItemManager();
		UserManager userManager = new UserManager();
		
		HttpSession session = request.getSession();
		User currentUser = (User)session.getAttribute("current-user");
		
		if(currentUser == null || currentUser.getId() < 0) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
		cartItemManager.deleteById(cartItemId);
		response.sendRedirect("Cart.jsp");
	}

}
