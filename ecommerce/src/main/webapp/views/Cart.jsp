<%@page import="models.CartItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
	<%@include file="../../components/navbar.jsp"%>
	<%


CartItemManager cartItemManager = new CartItemManager();
List<CartItem> cartItems = cartItemManager.getAllByUserId(currentUser.getId());
double total = 0;
%>

	<section class="mt-5 py-5">
			
		<div class="container mt-3 py-3">
			<div class="row">
				<div class="col-md-8">
		<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Image</th>
		      <th scope="col">Name</th> 
		      <th scope="col">Price</th>
		      <th scope="col">Amount</th>
		      <th colspan="2" class="text-center">Operation</th>
		    </tr>
		  </thead>
		  <tbody>
		 	<%         for (int i = 0; i < cartItems.size(); i++) {
						total += cartItems.get(i).getProduct().getPrice() * cartItems.get(i).getQuantity();
			%>
		    <tr>
		      <th scope="row"><%=i + 1%></th>
		      <td><img
								src="../img<%=cartItems.get(i).getProduct().getImage()%>" width="200px"
								height="200px"></td>
		     <td ><%=cartItems.get(i).getProduct().getName()%></td>
		      <td ><%=cartItems.get(i).getProduct().getPrice()%></td>
		      <td ><%=cartItems.get(i).getQuantity()%></td>
		      <td colspan="2"  class="text-center">
		      	<button class="btn btn-danger"  onclick="openDeleteModal(<%=cartItems.get(i).getId()%>, '<%=cartItems.get(i).getProduct().getName()%>')">Sil</button>

		      </td>
		    </tr>
		    <%
				}
			%>
		  </tbody>
		</table>
				</div>
				<div class="col-md-4">
                    <!--form details-->
                    <!--card-->
                    <div class="card">
                        <div class="card-body">

                            <h3 class="text-center mb-5">Bilgileriniz</h3>
                            <form action="#">
                                <div class="form-group my-3">
                                    <label for="exampleInputEmail1">E-mail adresiniz</label>
                                    <input  type="email" class="form-control" id="exampleInputEmail1" placeholder="e-mail girin">
                                 
                                </div>
                                <div class="form-group my-3">
                                    <label for="name">Adınız Soyadınız</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="İsminizi girin">
                                </div>


                                <div class="form-group my-3">
                                    <label for="phoneNumber">Telefon numaranız</label>
                                    <input  type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Telefon numaranızı girin">
                                </div>


                                <div class="form-group my-3">
                                    <label for="address"   >Adresiniz</label>
                                    <input type="text" class="form-control" id="address"  placeholder="Adresinizi girin">
                                </div>

                                <div class="container text-center my-3">
                                	<input class="btn btn-outline-success" value="Confirm Order" type="button" onclick="window.location = 'ConfirmOrder.jsp'"> 
                                	<input class="btn btn-outline-primary" value="Continue Shopping" type="button" onclick="window.location = 'index.jsp'">                               	                          		
                                </div>

                            </form>    
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</section>
	
	

<!-- Delete -->
<div class="modal fade" tabindex="-1" id="deleteModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title">Delete Product</h3>
                <!-- ... -->
            </div>
             <p id="deleteMessage" class="text-center"></p>
            <form action="../DeleteCartItemServlet" method="post" class="signin-form">
                <div class="modal-body">
                <div class="form-group mb-3">
                       <input type="hidden" id="DcartItemId" name="cartItemId" readonly >
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
		
		function openDeleteModal(id, name) {
		    // Modalı aç
		    $('#deleteModal').modal('show');
		  
		    // İlgili input alanlarının değerlerini güncelle
		    $('#DcartItemId').val(id);
		    $('#DproductName').val(name);
		    $('#deleteMessage').text(name + "ürününü sepetten silmek istediğinize emin misiniz ? ");
		   
		}

	</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	
</body>
</html>