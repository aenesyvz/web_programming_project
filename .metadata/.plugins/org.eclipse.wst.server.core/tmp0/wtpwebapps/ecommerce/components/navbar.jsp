<%@page import="repositories.CartItemManager"%>
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
                    <ul class=" d-flex justify-content-around list-unstyled my-auto ">
                        <li class=""><a class="text-decoration-none text-dark btn " href="index.html">Home</a></li>
                        
               	<%
				if (currentUser != null && currentUser.isAdmin()) {
				%>
				<li class="text-decoration-none "><a class="text-decoration-none  btn  text-dark" href="AdminMainPanel.jsp">Admin Panel</a></li>
				<%
				}
				%>
                        
                <%
				if (currentUser == null) {
				%>
				<!-- Button Group -->
				<li class="text-decoration-none "><a   class="text-decoration-none btn text-dark" href="login.jsp">Sign In</a></li>
				<li class="text-decoration-none"><a   class="text-decoration-none  btn  text-dark"href="register.jsp">Register</a></li>
				<%
				} else {
				%>
				<li><a class="text-decoration-none text-dark btn "
						href="LogOutServlet">Log Out</span>
					</a></li>
				<%
								CartItemManager cartItemManager = new CartItemManager();
								int amount = cartItemManager.getAllByUserId(currentUser.getId()).size();
				%>
				<li class="text-decoration-none   ">
					<a  class="text-decoration-none text-white btn btn-danger" style="text-transform: uppercase" href="Cart.jsp">Sepetim(<%=amount%>)</a>
				</li>
				<li class="text-decoration-none ">
					<a  class="text-decoration-none text-white btn btn-danger" style="text-transform: uppercase"><%=currentUser.getUsername()%></a>
				</li>
				<%
				}
				%>
                    </ul>

                </div>
            </div>
        </nav>
    </header>