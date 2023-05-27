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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
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
		
		// Validations
		
		if(username.isEmpty() || password.isEmpty()) {
			httpSession.setAttribute("red-message", "Kullanici adi ve sifre bos olmamalidir");				
			response.sendRedirect("login.jsp");
			return;
		}
		
		// Check user from db
		
		UserManager userManager = new UserManager();
		User dbUser = userManager.fetchByUsernameAndPassword(username, password);			
		
		// Redirect			
				
		if(dbUser == null) {
			httpSession.setAttribute("red-message", "Kullanici adi veya sifre hatali");				
			response.sendRedirect("login.jsp");
			return;
		} else {
			httpSession.setAttribute("current-user", dbUser);				
			response.sendRedirect("index.jsp");
			return;
		}
	}

}
