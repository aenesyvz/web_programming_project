package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import repositories.UserManager;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		HttpSession httpSession = request.getSession();	
		
		if(username.isEmpty() || password.isEmpty()) {
		
			response.sendRedirect("register.jsp");
			return;
		}
		
		User user = new User(username, password, false);
		UserManager userManager = new UserManager();
		int userId = userManager.save(user);
		
		if(userId > -1) {
			User savedUser = userManager.getByUsernameAndPassword(username, password);
			httpSession.setAttribute("current-user", savedUser);				
			response.sendRedirect("index.jsp");
			return;
		} else {	
			response.sendRedirect("register.jsp");
			return;
		}
		
	}

}
