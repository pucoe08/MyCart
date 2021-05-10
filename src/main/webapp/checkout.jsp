<%-- 
    Document   : checkout
    Created on : 9 May, 2021, 6:22:22 PM
    Author     : Aditi
--%>
<%
   User user= (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in !! Login First to access checkout page");
        response.sendRedirect("login.jsp");
    }    

    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="Components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3"> Your Selected Items </h3>
                            <div class="cart-body">
                            </div>
                        </div>
                    </div>

                </div>
                <!--Form Details -->
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3"> Your Details For Order </h3>
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email"  class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-label">Your Name</label>
                                    <input type="text"  value="<%= user.getUserName()%>" class="form-control" id="name" placeholder="Enter Name">
                                </div>
                                  <div class="form-group">
                                    <label for="exampleInputEmail1" class="form-label">Your Contact</label>
                                    <input type="text"  value="<%= user.getUserPhone() %>" class="form-control" id="name" placeholder="Enter Contact">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter Your Address"><%= user.getUserAddress() %></textarea>
                                </div>
                                <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Order Now</button>
                                <button type="submit" class="btn btn-outline-primary">Continue Shopping</button>
                                </div>                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Components/common_modals.jsp" %>
    </body>
</html>
