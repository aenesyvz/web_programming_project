<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="css/index.css">
</head>
<body>
<section>
    <div class="container-info" style="background-color: #ffffff;padding:30px;border-radius:3rem; box-shadow: 10px 10px rgba(0, 0, 0, 0.096);">  
       <h2 class="title">Bilgilerim</h2>
       <div>
          	<div class="form" >
                    <div class='formInput'>
                        <div class="form-label">Ad</div>
                        <div class='input-group'>
                            <input class="form__input" id="firstName" name="firstName" value=${user.firstName} />
                        </div>
                    </div>
                      <div class='formInput'>
                        <div class="form-label">Soyad</div>
                        <div class='input-group'>
                            <input class="form__input" name="lastName" value=${user.lastName} />
                        </div>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Email</div>
                        <div class='input-group'>
                            <input class="form__input" name="email" value=${user.email} />
                        </div>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Sifre</div>
                        <div class='input-group'>
                            <input class="form__input" name="password" value=${user.password} />
                        </div>
                    </div>
                   
                    <div class='formInput'>
                        <div class="form-label">Cep Telefonu</div>
                        <div class='input-group'>
                            <input class="form__input" name="phoneNumber" value=${user.phoneNumber} />
                        </div>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Cinsiyet</div>
                        <div class='input-group'>
                            <input class="form__input" name="gender" value=${user.gender} />
                        </div>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Dogum Tarihi</div>
                        <div class='input-group'>
                            <input class="form__input" name="birthOfDate" value=${user.dateOfBirth} />
                        </div>
                    </div>
                </div>
               
       </div>
        
                
		
    </div>
   </section>
</body>
</html>