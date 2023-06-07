<%@page import="models.CartItem"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Confirm Order</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <style>
    body {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #28a745;
    }
  </style>
</head>
<body>
 <div class="container">
  <div class="row">
    <div class="col-md-4 mx-auto bg-white py-5" id="popup">
      <h2 class="text-center">Tebrikler!</h2>
      <br>
      <p class="text-center">Siparişiniz başarılı bir şekilde alındı.</p>
      <br>
     <p class="text-center"> <span id="countdown">5</span> saniye içerisinde ana sayfaya yönlendirileceksiniz.</p>

      
      <form action="../OrderServlet" method="post">
     
       
        <button type="submit" style="display: none;"></button>
      </form>
    </div>
  </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  var count = 5; // Başlangıç sayısı
  var countdown = setInterval(function() {
    document.getElementById("countdown").textContent = count; // Sayaç değerini güncelle
    count--; // Sayaç değerini azalt

    if (count === 0) {
      clearInterval(countdown); // Sayaç 0 olduğunda interval'i durdur
      document.forms[0].submit(); // Formu gönder
    }
  }, 1000); // 1 saniye (1000 milisaniye) bekleme süresi
</script>


</body>
</html>
