<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main Panel</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
</head>
<body>
		<%@include file="components/navbar.jsp"%>
		<section>
			<div class="container mt-5 py-5">
					<div class="row mt-3">

			<!--second :row first col-->
			<div class="col-md-6 mb-3">
					<div class="card bg-warning d-flex justify-content-center align-items-center flex-column" style="min-height: 300px">

					<div class="card-body text-center">

						<div class="container">
								<img style="width: 200px;height: 200px" class="img-fluid rounded-circle"
								src="images/bg-1.jpg" alt="user_icon">

						</div>

						<h1 class="text-white"><a href="AdminCategory.jsp"  class="text-decoration-none">View Category</a> </h1>
						
					</div>

				</div>
			</div>
			
			<div class="col-md-6 mb-3">
					<div class="card bg-danger d-flex justify-content-center align-items-center flex-column" style="min-height: 300px">

					<div class="card-body text-center">

						<div class="container">
								<img style="width: 200px;height: 200px" class="img-fluid rounded-circle"
								src="images/hero-bg.jpg" alt="user_icon">

						</div>

						<h1 class="text-white">View Product</h1>

					</div>

				</div>
			</div>
		
	
			<div class="col-md-6 mb-3">
					<div class="card bg-secondary d-flex justify-content-center align-items-center flex-column" style="min-height: 300px">

					<div class="card-body text-center">

						<div class="container">
								<img style="width: 200px;height: 200px" class="img-fluid rounded-circle"
								src="images/order.png" alt="user_icon">

						</div>

						<h1 class="text-white">View Order</h1>

					</div>

				</div>
			</div>
			
			<div class="col-md-6">
						<div class="card bg-success d-flex justify-content-center align-items-center flex-column" style="min-height: 300px">

					<div class="card-body text-center">

						<div class="container">
							<img style="width: 200px;height: 200px" class="img-fluid rounded-circle"
								src="images/customer.png" alt="user_icon">

						</div>

						<h1 class="text-white">View Customer</h1>

					</div>

				</div>
			</div>
		</div>
			</div>
		</section>
		
		
		<%@include file="components/footer.jsp"%>
		
		
</body>
</html>