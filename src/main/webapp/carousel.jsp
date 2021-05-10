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
        <title>Login</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        
        <div class="col-md-6">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100"  style="width:100%; height: 400px;" src="images/image1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 " style="width:100%; height: 400px;"  src="images/image2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" style="width:100%; height: 400px;"  src="images/image3.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        </div>
           
        
        <h1></h1>
    </body>
</html>
