package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import repositories.CategoryManager;

/**
 * Servlet implementation class AddedCategoryServlet
 */
@WebServlet("/AddedCategoryServlet")
public class AddedCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddedCategoryServlet() {
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
		CategoryManager categoryManager = new CategoryManager();
		
		String categoryName = request.getParameter("categoryName");
		if(categoryName.isEmpty()) {
			response.sendRedirect("views/AdminCategory.jsp");
			return;
		}
				
		Category category = new Category(categoryName);
		categoryManager.save(category);
			
		response.sendRedirect("views/AdminCategory.jsp");
		return;
		
	}

}
