<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css" rel="stylesheet">
        <link rel="stylesheet" href="css/index.css">
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	
	 <section id="hero" class="w-100 p-0 mb-5 position-relative d-flex z-3 flex-column justify-content-center align-items-center" style="height: 60vh;background: url('images/hero-bg.jpg') center center;background-size: cover;">
        <div class="container text-center text-md-left" data-aos="fade-up">
            <h1 class="title mb-3 font-weight-bold text-white">Benimle <span class="border-bottom border-info border-5 rounded">Tanış</span></h1>
            <h2 class="sub__title mb-5" style="color: rgba(255, 255, 255, 0.8)">Hayalindeki projeyi gerçeğe dönüştürmeden önce benim hakkımda fikir edin!</h2>
        </div>
    </section>
    
	<%@include file="components/footer.jsp"%>
	
	
	
	
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
    integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
    integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
    crossorigin="anonymous"></script>
</body>
</html>