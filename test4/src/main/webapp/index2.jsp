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
    <div class="container">
       <h2 class="title">Kayit Ol</h2>
        <form class="form form2" action="worldServlet"  method="POST" 
							>
                    <div class='formInput'>
                        <div class="form-label">Ad</div>
                        <div class='input-group'>
                            <input class="form__input" id="firstName" name="firstName"  />
                        </div>
                            <p id="firstNameError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                      <div class='formInput'>
                        <div class="form-label">Soyad</div>
                        <div class='input-group'>
                            <input class="form__input" id="lastName" name="lastName" />
                        </div>
                            <p id="lastNameError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Email</div>
                        <div class='input-group'>
                            <input class="form__input" id="email" name="email" />
                        </div>
                            <p id="emailError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Sifre</div>
                        <div class='input-group'>
                            <input class="form__input" id="password" name="password" />
                        </div>
                            <p id="passwordError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                   
                    <div class='formInput'>
                        <div class="form-label">Cep Telefonu</div>
                        <div class='input-group'>
                            <input class="form__input" id="phoneNumber" name="phoneNumber" />
                        </div>
                           <p id="phoneNumberError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Cinsiyet</div>
                        <div class='input-group'>
                            <select name="gender" class="form__input" id="gender" style="padding-right: 5px">
 <option value="-1">Seciniz...</option>
  <option value="Erkek">Erkek</option>
  <option value="Kadin">Kadin</option>
</select>
                        </div>
                           <p id="genderError" style="color: red;position: absolute;margin-bottom: -42px"></p>
                    </div>
                    
                     <div class='formInput'>
                        <div class="form-label">Dogum Tarihi</div>
                        <div class='input-group'>
                            <input class="form__input" id="dateOfBirth" name="dateOfBirth" />
                        </div>
                           <p id="dateOfBirthError" style="color: red;position: absolute;margin-bottom: -50px"></p>
                    </div>
                   
                    <div class="button-submit">
                        <input class="submitButton" type="submit" value="Gonder"></input>
                    </div>
                </form>
		
    </div>
   </section>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function(){
			let existsForFirstName = false;
			let existsForLastName = false;
			let existsForEmail = false;
			let existsForGender = false;
			let existsForPassword = false;
			let existsForPhoneNumber = false;
			let existsForDateOfBirth = false;
			
			function isEmpty(input,elementId,errorMessage){
				if(input.trim() === ""){
					$(elementId).html(" * "+errorMessage +" bos gecilemez");
					return true;
				}else{
					$(elementId).html("");
					return false;
				}
			}
			
			
			function validateFirstName(){
				let firstName = $("#firstName").val();
				existsForFirstName =  isEmpty(firstName,"#firstNameError","Isim");
			}
			
			function validateLastName(){
				let lastName = $("#lastName").val();
				existsForLastName = isEmpty(lastName,"#lastNameError","Soyad");
			}
			
			function validateEmail(){
				let email = $("#email").val();
				existsForEmail = isEmpty(email,"#emailError","Email");
			}
			
			function validateGender() {
				let gender = $("#gender").val();
				if(gender == -1){
					$("#genderError").html(" * Cinsiyet bos gecilemez");
					existsForGender = true;
				}else{
					$("#genderError").html("");
					existsForGender = false;
				}
			}
			
			function validatePassword() {
				let password = $("#password").val();
				existsForPassword = isEmpty(password,"#passwordError","Sifre");
			}
			
			function validateDateOfBirth(){
				let dateOfBirth = $("#dateOfBirth").val();
				existsForDateOfBirth = isEmpty(dateOfBirth,"#dateOfBirthError","Dogum tarih");
			}
			
			function validatePhoneNumber() {
				let phoneNumber = $("#phoneNumber").val();
				existsForPhoneNumber = isEmpty(phoneNumber,"#phoneNumberError","Telefon numarasi");
			}
			
			
			 $(".form2").submit(function (e) {
				   	e.preventDefault();
				   	validateFirstName();
				    validateLastName();
				    validateEmail();
				    validateGender();
				    validatePassword();
				    validateDateOfBirth();
				    validatePhoneNumber();
				    if (
				    		!existsForFirstName &&
							!existsForLastName &&
							!existsForEmail &&
							!existsForGender &&
							!existsForPassword && 
							!existsForPhoneNumber &&
							!existsForDateOfBirth
				    ) {
		                   this.submit(); 
		   
				    } 
				  });
		})
	</script>
	


</body>
</html>