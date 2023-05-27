<%@page import="models.Category"%>
<%@page import="java.util.List"%>
<%@page import="repositories.CategoryManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
CategoryManager categoryManager = new CategoryManager();
List<Category> categories = categoryManager.fetchAll();
%>
				
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Category</title>

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
					Add Category
				</button>
				<button  type="button" class="btn btn-primary">
				  Toplam Kategori Sayısı <span class="ml-2 badge badge-light"><%=categories.size()%></span>
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
		      <th scope="col">Name</th>
		      <th colspan="2" class="text-center">Operation</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
				for (int i = 0; i < categories.size(); i++) {
			%>
		    <tr>
		      <th scope="row"><%=i + 1%></th>
		     <td><%=categories.get(i).getId()%></td>
		     <td ><%=categories.get(i).getName()%></td>
		      <td colspan="2"  class="text-center">
		      	<button class="btn btn-danger"  onclick="openDeleteModal(<%=categories.get(i).getId()%>, '<%=categories.get(i).getName()%>')">Sil</button>
		      	<button class="btn btn-warning text-white" onclick="openUpdateModal(<%=categories.get(i).getId()%>, '<%=categories.get(i).getName()%>')">Güncelle</button>

		      </td>
		    </tr>
		    <%
				}
			%>
		  </tbody>
		</table>
		</div>
		
	</section>
	
	
	
	<div class="modal fade" tabindex="-1" id="kt_modal_stacked_1">
<div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Category</h3>

            <!--begin::Close-->
            <div class="btn btn-icon btn-sm btn-active-light-primary ms-2" data-bs-dismiss="modal" aria-label="Close">
                <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
            </div>
            <!--end::Close-->
        </div>
		<form action="AddedCategoryServlet" method="post" class="signin-form">
	        <div class="modal-body">
	            <div class="form-group mb-3">
				      			<label class="label" for="name">Category Name</label>
				      			<input type="text" placeholder="Entrying..." id="categoryName" class="form-control" name="categoryName" required />
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
                <h3 class="modal-title">Update Category</h3>
                <!-- ... -->
            </div>
            <form action="UpdateCategoryServlet" method="post" class="signin-form">
                <div class="modal-body">
                    <div class="form-group mb-3">
                        <input type="hidden" id="UcategoryId" class="form-control" name="categoryId" readonly />
                    </div>
                    <div class="form-group mb-3">
                        <label class="label" for="categoryName">Category Name</label>
                        <input type="text" id="UcategoryName" class="form-control" name="categoryName" required />
                    </div>
                </div>
                 <div class="modal-footer">
	            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
	            <button type="submit" class="btn btn-primary">Update</button>
	        </div>
                <!-- ... -->
            </form>
        </div>
    </div>
</div>


<!--  Delete  -->

<div class="modal fade" tabindex="-1" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Delete Category</h3>
                <!-- ... -->
            </div>
             <p id="deleteMessage" class="text-center"></p>
            <form action="DeleteCategoryServlet" method="post" class="signin-form">
                <div class="modal-body">
                    <div class="form-group mb-3">
                        <input type="hidden" id="DcategoryId" class="form-control" name="categoryId" readonly />
                    </div>
                    <div class="form-group mb-3">
                        <input type="hidden" id="DcategoryName" class="form-control" name="categoryName" required />
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


	<%@include file="../../components/footer.jsp"%>
	
	<script type="text/javascript">
	
		function openUpdateModal(id, name) {
		    // Modalı aç
		    $('#updateModal').modal('show');
		  
		    // İlgili input alanlarının değerlerini güncelle
		    $('#UcategoryId').val(id);
		    $('#UcategoryName').val(name);
		    
		    $('#UcategoryName').prop('disabled', false);
		}
		
		function openDeleteModal(id, name) {
		    // Modalı aç
		    $('#deleteModal').modal('show');
		  
		    // İlgili input alanlarının değerlerini güncelle
		    $('#DcategoryId').val(id);
		    $('#DcategoryName').val(name);
		    $('#deleteMessage').text(name + "kategorisini silmek istediğinize emin misiniz ? ");
		   
		}

	</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>