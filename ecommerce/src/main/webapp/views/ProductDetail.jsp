<%@page import="models.Product"%>
<%@page import="repositories.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String productId = request.getParameter("productId");
if (productId == null || productId.isEmpty()) {
	response.sendRedirect("index.jsp");
	return;
}

int id = Integer.parseInt(productId);

ProductManager productDao = new ProductManager();
Product product = productDao.fetchById(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Detail</title>
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/auth.css">

</head>
<body>
	<section class="ftco-section  d-flex justify-content-center">
		<div class="container ">
			<div class="row justify-content-between">
				<div class=" d-flex wrap d-md-flex p-0 m-0"  style="background-color:  #fff">
					<div class="col-md-6 d-md-flex">
					<img class="img-fluid " src='../img<%= product.getImage() %>'/>
			      </div>
						<div class="login-wrap p-4 p-md-5 col-md-6" style="background-color:  #fff">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			<h3 class="mb-4">Product Detail</h3>
			      		</div>
								<div class="w-100">
									<p class="social-media d-flex justify-content-end">
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
										<a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
									</p>
								</div>
			      	</div>
					<form action="../AddCartServlet" method="post" class="signin-form">
					<input type="hidden" name="productId" value="<%=product.getId()%>">
			      		<div class="form-group mb-3">
			      			<h4 class="label">Product Name</h4>
			      			<p><%=product.getName()%></p>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="label">Category Name</label>
		              	<p><%=product.getCategory().getName()%></p>
		            </div>
		             <div class="form-group mb-3">
		            	<label class="label">Price</label>
		              	<p><%=product.getPrice()%></p>
		            </div>
		             <div class="form-group mb-3">
		            	<% if(product.getStock() < 1) {%>
		            		<p>Stokta yok</p>
		            	<%} %>
		            </div>
		            <div class="cart-btn d-flex mb-50 form-group mb-3">
											<p>Adet </p>
											<div class="quantity ml-2">
												 <input
													type="number" class="qty-text" id="qty" step="1" min="1"
													max="300" name="quantity" value="1"> 
											</div>
										</div>
		            <div class="form-group">
		            	<button type="submit" class="form-control btn btn-primary rounded submit px-3  <%= product.getStock() > 0 ? "" : "disabled"%>">Satın Al</button>
		            </div>
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	
</body>
</html>