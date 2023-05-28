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
 * Servlet implementation class UpdateProductServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 10, 	// 10 MB
maxRequestSize = 1024 * 1024 * 10)	
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProductServlet() {
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
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		double productPrice = Double.parseDouble(request.getParameter("price"));
		int productStock = Integer.parseInt(request.getParameter("productStock"));
		Part productImage = request.getPart("productImage");	
		
		
	
		if(checkInputs( productName, categoryId, productPrice, productStock, productImage) == -1) {
			return;
		}
		
		Product updatedProduct = productManager.fetchById(productId);
		Category category = categoryManager.fetchById(categoryId);
		
		if(category == null) {
			response.sendRedirect("AdminProduct.jsp");
			return;
		}
		
		updatedProduct.setCategory(category);
		updatedProduct.setName(productName);
		updatedProduct.setPrice(productPrice);
		updatedProduct.setStock(productStock);
		
		String imagePath = updatedProduct.getImage();
		
		if(productImage != null && productImage.getSize() != 0 && productImage.getSubmittedFileName() != "") {
			imagePath = uploadImage(request, productImage);				
		}
		
		updatedProduct.setImage(imagePath);
		
		productManager.update(updatedProduct);
		
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
