<%@page import="models.Product"%>
<%@page import="repositories.ProductManager"%>
<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@page import="repositories.CategoryManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
CategoryManager categoryManager = new CategoryManager();
List<Category> categories = categoryManager.fetchAll();
%>

<%
String categoryId = request.getParameter("category");
ProductManager productManager = new ProductManager();
List<Product> products;
if (categoryId == null || categoryId.trim().equals("all")) {
	products = productManager.fetchAll();
} else {
	int id = Integer.parseInt(categoryId.trim());
	products = productManager.getAllByCategoryId(id);
}
%>
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <link rel="stylesheet" href="../css/index.css">
</head>
<body>
	<%@include file="../components/navbar.jsp"%>
	
	 <section  class="w-100 p-0 mb-5 position-relative d-flex z-3 flex-column justify-content-center align-items-center" style="height: 60vh;background: url('../images/order.png') center center;background-size: cover;">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1 class="title mb-3 font-weight-bold text-white">Benimle <span class="border-bottom border-info border-5 rounded">Tanış</span></h1>
            <h2 class="sub__title mb-5" style="color: rgba(255, 255, 255, 0.8)">Hayalindeki projeyi gerçeğe dönüştürmeden önce benim hakkımda fikir edin!</h2>
        </div>
    </section>
    
    
     <section id="aboutSection" class="my-5 py-5 bg-white">
        <div class="container px-5">
            <div class="row justify-content-center">
                <h2 class="text-center section__title">Ürünler</h2>
                <div class="col-md-12 w-25 border-bottom border-2 border-success section__border "></div>
            </div>
            <div class="container mt-3 pt-3">
             
           	<div class="row d-flex justify-content-center">
           			<div class="col-md-2 mt-3">
         		<ul class="list-group">
				  <li class="list-group-item active"><a href="index.jsp?category=all" class="text-white text-decoration-none">All Category</a></li>
					  <% 
	         			for(Category category : categories){
	         		%>
	         			<li class="list-group-item"><a href="index.jsp?category=<%=category.getId() %>" class="text-dark text-decoration-none"><%=category.getName() %></a></li>
	         		<%
	    					}
					%>
				</ul>
         	</div>
         	<div class="col-md-10">
         		<div class="row">
         			<% 
	         			for(Product product : products){
	         		%>
	         		 <div class="col-sm-6 col-md-4 col-lg-3 shadow p-0 m-3 project d-flex flex-column align-items-stretch">
	         		 <div>
					         		 
					     <div class="position-relative">
				            <img class="rounded img-fluid" src="../img<%= product.getImage() %>" style="height: 220px; width: 100%;" alt="">
				        </div>
				
				        <div class="px-3 py-3">
				            <h4><%= product.getName() %></h4>
				            <p>Fiyatı: <%= product.getPrice() %> $</p>
				        </div>
	         		 </div>
       
        
			        <div class="mt-auto mb-4 px-3  align-items-center">
			            <div class="py-2 d-flex align-items-center redirectBtn justify-content-center rounded bg-dark align-middle" style="max-width: 200px;">
			                <a href="ProductDetail.jsp?productId=<%=product.getId()%>" class="text-decoration-none"><h6 class="my-auto text-white ms-2"> Detaylara Git</h6></a>
			                <i class="my-auto uil uil-arrow-right text-white more__icon h5"></i>
			            </div>
			        </div>
    </div>
	         		<%
	    					}
					%>
         		</div>
         	</div>
         	
           	</div>
         	
            </div>
        </div>
    
    </section>
    
	<%@include file="../components/footer.jsp"%>
	
	
	
	
	
	
		

	 
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
</body>
</html>