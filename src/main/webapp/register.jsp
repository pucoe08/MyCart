<%-- 
    Document   : register
    Created on : 30 Apr, 2021, 6:42:06 AM
    Author     : Aditi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-1">
            <div class="col-md-4 offset-md-4">
               
                <div class="card">
                    <%@include file="Components/message.jsp" %>
                    <div class="card-body">
                         <h3 class="text-center my-1">Sign up Here</h3>
                         <form action="RegisterServlet" method="post">
                    <div class="form-group">
                        <label  for="name">User Name</label>
                        <input name="user_name" type="text" class="form-control" id="name"  placeholder="Enter Here">
                    </div>      
                    <div class="form-group">
                        <label for="email">E-Mail</label>
                        <input name="user_email" type="email" class="form-control" id="email"  placeholder="Enter Here">
                    </div>      
                    
                    <div class="form-group">
                        <label for="password">User Password</label>
                        <input name="user_password" type="password" class="form-control" id="password"  placeholder="Enter Here">
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">User Phone</label>
                        <input name="user_phone" type="number" class="form-control" id="phone"  placeholder="Enter Here">
                    </div>      
                    <div class="form-group">
                        <label for="address">User Address</label>
                        <textarea  name="user_address" class="form-control">Enter Your Address</textarea>
                    </div>      
                   
                    <div class="container text-center">
                        <button class="btn btn-outline-success"> Register                        
                        </button>
                        <button class="btn btn-outline-warning"> Reset                        
                        </button>
                    </div>
                    </div>
                </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </body>
</html>
