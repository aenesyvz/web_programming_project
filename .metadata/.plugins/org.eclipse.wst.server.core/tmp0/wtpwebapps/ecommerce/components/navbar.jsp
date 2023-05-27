<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
User currentUser = (User) session.getAttribute("current-user");
%>
 <header>
        <nav class=" navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <h2 class="me-auto my-auto">AEY37</h2>
                <div class="col-md-5">
                    <ul class=" d-flex justify-content-around list-unstyled my-auto">
                        <li class="border-bottom border-success border-2"><a class="text-decoration-none text-dark" href="index.html">Anasayfa</a></li>
                        
               	<%
				if (currentUser != null && currentUser.isAdmin()) {
				%>
				<li class="text-decoration-none  text-dark"><a class="text-decoration-none text-dark" href="AdminMainPanel.jsp">Admin Paneli</a></li>
				<%
				}
				%>
                        
                <%
				if (currentUser == null) {
				%>
				<!-- Button Group -->
				<li class="text-decoration-none  text-dark"><a   class="text-decoration-none text-dark" href="login.jsp">Sign In</a></li>
				<li class="text-decoration-none  text-dark"><a   class="text-decoration-none text-dark"href="register.jsp">Register</a></li>
				<%
				} else {
				%>
				<li><a class="text-decoration-none text-dark" aria-current="page"
						href="LogOutServlet">Log Out</span>
					</a></li>
				<li class="text-decoration-none  text-dark btn btn-danger">
					<a  class="text-decoration-none text-white" aria-current="page"style="text-transform: uppercase"> <span><%=currentUser.getUsername()%></span></a>
				</li>
				<%
				}
				%>
                    </ul>

                </div>
            </div>
        </nav>
    </header>