package controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import models.Category;
import models.Product;
import repositories.CategoryManager;
import repositories.ProductManager;

/**
 * Servlet implementation class AddProductServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 10, 	// 10 MB
maxRequestSize = 1024 * 1024 * 10)	// 10 MB
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
			ProductManager productManager = new ProductManager();
		
			String productName = request.getParameter("productName");
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			double productPrice = Double.parseDouble(request.getParameter("price"));
			int productStock = 0;
			Part productImage = request.getPart("productImage");	
			
		
			if(checkInputs(productName, categoryId, productPrice, productStock, productImage) == -1) {
				return;
			}
			
			
			Category category = categoryManager.fetchById(categoryId);
			
			String path = File.separator + "product" + File.separator + "default.png";
			
			if(productImage.getSize() != 0 && productImage.getSubmittedFileName() != "") {
				path = uploadImage(request, productImage);
			}
			
			Product product = new Product(category, productName, productPrice, productStock, path);
			productManager.save(product);
							
			response.sendRedirect("AdminProduct.jsp");
			return;
			
		
	}
	
	private int checkInputs( String productName,int categoryId, double productPrice, int productStock, Part productImagePart) throws IOException {
		if(productName.isEmpty()) {
			return -1;
		}
		
		if(categoryId < 0) {
			return -1;
		}
		
		if(productPrice < 0) {
			return -1;
		}
		
		if(productStock < 0) {
			return -1;
		}
		
		if(productImagePart.getSize() > 10485760) {
			return -1;
		}
		
		return 0;
	}
	
	private String uploadImage(HttpServletRequest request, Part productImagePart)
			throws FileNotFoundException, IOException {		
		String appPath = request.getRealPath("img");
		String uploadPath = File.separator + "product" + File.separator + java.util.UUID.randomUUID();
		String fullPath = appPath + uploadPath;
		
		FileOutputStream fos = new FileOutputStream(fullPath);
		
		InputStream is = productImagePart.getInputStream();	
				
		byte[] data = new byte[is.available()];
		
		is.read(data);
		fos.write(data);
		fos.close();
		
		return uploadPath;
	}

}