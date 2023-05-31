<%@page import="models.Category"%>
<%@page import="repositories.CategoryManager"%>
<%@page import="models.Product"%>
<%@page import="java.util.List"%>
<%@page import="repositories.ProductManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
ProductManager productManager = new ProductManager();
List<Product> products = productManager.fetchAll();
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Product</title>

<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="css/auth.css">
</head>

<body>
	<%@include file="../../components/navbar.jsp"%>
	<section>
		<div class="container mt-5 pt-5">
			<div class="d-flex justify-content-between">
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kt_modal_stacked_1">
					Add Product
				</button>
				<button  type="button" class="btn btn-primary">
				  Total Product Count <span class="ml-2 badge badge-light"><%=products.size()%></span>
				</button>
			</div>
		</div>
	</section>
	
	<section>
		<div class="container mt-3 py-3">
			<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Id</th>
		      <th scope="col">Image</th>
		      <th scope="col">Name</th> 
		      <th scope="col">Category</th>
		      <th scope="col">Price</th>
		      <th scope="col">Amount</th>
		      <th colspan="2" class="text-center">Operation</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
				for (int i = 0; i < products.size(); i++) {
			%>
		    <tr>
		      <th scope="row"><%=i + 1%></th>
		     <td><%=products.get(i).getId()%></td>
		      <td><img
								src="img<%=products.get(i).getImage()%>" width="200px"
								height="200px"></td>
		     <td ><%=products.get(i).getName()%></td>
		      <td ><%=products.get(i).getCategory().getName()%></td>
		      <td ><%=products.get(i).getPrice()%></td>
		      <td ><%=products.get(i).getStock()%></td>
		      <td colspan="2"  class="text-center">
		      	<button class="btn btn-danger"  onclick="openDeleteModal(<%=products.get(i).getId()%>, '<%=products.get(i).getName()%>')">Sil</button>
		      	<button class="btn btn-warning text-white" onclick="openUpdateModal(<%=products.get(i).getId()%>, 
		      	'<%=products.get(i).getName()%>',
		      	<%=products.get(i).getCategory().getId()%>,
		      	<%=products.get(i).getPrice()%>,
		      	<%=products.get(i).getStock()%>,
		      	'<%=products.get(i).getImage()%>')">Güncelle</button>

		      </td>
		    </tr>
		    <%
				}
			%>
		  </tbody>
		</table>
		</div>
	</section>
	
	<%@include file="../../components/footer.jsp"%>
	
	
	
	<!-- Add -->
	<div class="modal fade" tabindex="-1" id="kt_modal_stacked_1">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Product</h3>

            <!--begin::Close-->
            <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
            </div>
            <!--end::Close-->
        </div>
		<form action="AddProductServlet" method="post" class="signin-form" enctype="multipart/form-data">
	        <div class="modal-body">
	            <div class="form-group mb-3">
				      			<label class="label" for="name">Product Name</label>
				      			<input type="text" placeholder="Entrying..." id="productName" class="form-control" name="productName" required />
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="categoryId">Category</label>
				      			<div class="d-flex">
										<select name="categoryId" class="form-control mb-3"
											id="categoryId" required>
											<%
											CategoryManager categoryManager = new CategoryManager();
											List<Category> categories = categoryManager.fetchAll();
											for (Category category : categories) {
											%>
											<option value="<%=category.getId()%>"><%=category.getName()%></option>
											<%
											}
											%>
										</select>
									</div>
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="price">Price</label>
				      			<input type="text" placeholder="Entrying..." id="price" class="form-control" name="price" required />
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="productImage">Product Image</label>
				      			<input type="file" placeholder="Entrying..." id="productImage" class="form-control" name="productImage" required />
				 </div>
	        </div>

	        <div class="modal-footer">
	            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
	            <button type="submit" class="btn btn-primary">Save</button>
	        </div>
         </form>
    </div>
</div>
</div>

<!-- Update -->

<div class="modal fade" tabindex="-1" id="updateModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Update Product</h3>
                <!-- ... -->
            </div>
            <form action="UpdateProductServlet" method="post" class="signin-form" enctype="multipart/form-data">
                <div class="modal-body">
                <div class="form-group mb-3">
                        <input type="hidden" id="UproductId" class="form-control" name="productId" readonly />
                </div>
	            <div class="form-group mb-3">
				      			<label class="label" for="name">Product Name</label>
				      			<input type="text" placeholder="Entrying..." id="UproductName" class="form-control" name="productName" required />
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="categoryId">Category</label>
				      			<div class="d-flex">
										<select name="categoryId" class="form-control mb-3"
											id="UcategoryId" required>
											<%
											CategoryManager categoryManager2 = new CategoryManager();
											List<Category> categories2 = categoryManager.fetchAll();
											for (Category category : categories2) {
											%>
											<option value="<%=category.getId()%>"><%=category.getName()%></option>
											<%
											}
											%>
										</select>
									</div>
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="price">Price</label>
				      			<input type="text" placeholder="Entrying..." id="Uprice" class="form-control" name="price" required />
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="price">Stock</label>
				      			<input type="text" placeholder="Entrying..." id="UproductStock" class="form-control" name="productStock" required />
				 </div>
				  <div class="form-group mb-3">
				      			<label class="label" for="productImage">Product Image</label>
				      			<input type="file" placeholder="Entrying..." id="UproductImage" class="form-control" name="productImage" />
				 </div>
	        </div>

	        <div class="modal-footer">
	            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
	            <button type="submit" class="btn btn-primary">Save</button>
	        </div>
            </form>
        </div>
    </div>
</div>
	
<!-- Delete -->
<div class="modal fade" tabindex="-1" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Delete Product</h3>
                <!-- ... -->
            </div>
             <p id="deleteMessage" class="text-center"></p>
            <form action="DeleteProductServlet" method="post" class="signin-form">
                <div class="modal-body">
                    <div class="form-group mb-3">
                        <input type="hidden" id="DproductId" class="form-control" name="productId" readonly />
                    </div>
                    <div class="form-group mb-3">
                        <input type="hidden" id="DproductName" class="form-control" name="productName" required />
                    </div>
                </div>
                 <div class="modal-footer">
	            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
	            <button type="submit" class="btn btn-primary">Delete</button>
	        </div>
            </form>
        </div>
    </div>
</div>


<script type="text/javascript">
	
		function openUpdateModal(id, name,categoryId,price,stock,image) {
		    // Modalı aç
		    $('#updateModal').modal('show');
		  
		    // İlgili input alanlarının değerlerini güncelle
		    $('#UproductId').val(id);
		    $('#UproductName').val(name);
		    $('#UcategoryId').val(categoryId);
		    $('#Uprice').val(price);
		    $('#UproductStock').val(stock);
		    $('#UproductImage').val(image);
		    
		  
		}
		
		function openDeleteModal(id, name) {
		    // Modalı aç
		    $('#deleteModal').modal('show');
		  
		    // İlgili input alanlarının değerlerini güncelle
		    $('#DproductId').val(id);
		    $('#DproductName').val(name);
		    $('#deleteMessage').text(name + "ürününü silmek istediğinize emin misiniz ? ");
		   
		}

	</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


</body>
</html>