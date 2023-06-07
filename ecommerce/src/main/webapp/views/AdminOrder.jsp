<%@page import="models.OrderItem"%>
<%@page import="java.util.Calendar"%>
<%@page import="models.Order"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="repositories.OrderItemManager"%>
<%@page import="repositories.OrderManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
OrderManager orderManager = new OrderManager();
OrderItemManager orderItemManager = new OrderItemManager();
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
String startDate = request.getParameter("startDate");
String finishDate = request.getParameter("finishDate");
Calendar calendar = Calendar.getInstance();
List<Order> orders;

if ((startDate == null || startDate.isEmpty()) && (finishDate == null || finishDate.isEmpty())) {
	orders = orderManager.fetchAll();
} else if (!(startDate == null || startDate.isEmpty()) && (finishDate == null || finishDate.isEmpty())) {
	orders = orderManager.getAllByBetweenOrderDate(startDate, simpleDateFormat.format(calendar.getTime()));
} else if ((startDate == null || startDate.isEmpty()) && !(finishDate == null || finishDate.isEmpty())) {
	calendar.add(Calendar.YEAR, -200);
	orders = orderManager.getAllByBetweenOrderDate(simpleDateFormat.format(calendar.getTime()), finishDate);
} else {
	orders = orderManager.getAllByBetweenOrderDate(startDate, finishDate);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Order Page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="../css/auth.css">
</head>
<body>
	<%@include file="../../components/navbar.jsp"%>
	<section>
		<div class="container mt-5 pt-5">
			<div class="d-flex justify-content-between">
					<div class="d-flex">
						<form action="AdminOrder.jsp" method="get" class="signin-form">
						<div class="form-group ">
							<label class="label" for="startDate">Start:</label> 
							<input class="" type="date" id="startDate" name="startDate"> 
						</div>
						<div class="form-group ">
							<label class="label" for="finishDate">Finish : </label> 
						<input class=""	type="date" id="finishDate" name="finishDate"> 
						</div>
						
						<button class="btn btn-primary" type="submit">Search</button>
					</form>
					</div>
					
			</div>
		</div>
	</section>
	
	<section>
		<div class="container mt-3 py-3">
			<table class="table">
		  <thead class="thead-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Product Name</th> 
		      <th scope="col">UserName</th>
		      <th scope="col">Price</th>
		      <th scope="col">Amount</th>
		      <th scope="col">Created At</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  		int count = 1;
				for (Order order : orders) {
					List<OrderItem> orderItems = orderItemManager.getAllByOrderId(order.getId());
					for (OrderItem orderItem : orderItems) {
			%>
		    <tr>
		      <td><%=count++ %></td>
		     <td ><%=orderItem.getProduct().getName()%></td>
		      <td ><%=order.getUser().getUsername()%></td>
		      <td ><%=orderItem.getProduct().getPrice()%></td>
		      <td ><%=orderItem.getProduct().getStock()%></td>
		       <td ><%=order.getCreatedAt()%></td>
		    </tr>
		    <%
			    }
				}
			%>
		  </tbody>
		</table>
		</div>
	</section>
	
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>