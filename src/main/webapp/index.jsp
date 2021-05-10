<%-- 
    Document   : index
    Created on : 28 Apr, 2021, 9:59:08 PM
    Author     : Aditi
--%>

<%@page import="com.mycompany.mavenproject1.helper.helper"%>
<%@page import="com.mycompany.mavenproject1.entities.Category"%>
<%@page import="com.mycompany.mavenproject1.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject1.entities.Product"%>
<%@page import="com.mycompany.mavenproject1.dao.ProductDao"%>
<%@page import="com.mycompany.mavenproject1.helper.factoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart : Home Page</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>

    <body>
        <%@include file="Components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-2 mx-2">
                <%  String cat = request.getParameter("category");
                    if (cat == null) {
                        cat = "all";
                    }
                    //out.println(cat);
                    List<Product> productList = null;
                    ProductDao productDao = new ProductDao(factoryProvider.getFactory());
                    if (cat.trim().equals("all")) {
                        productList = productDao.getAllProducts();
                    } else {
                        int cId = Integer.parseInt(cat.trim());
                        productList = productDao.getProductsById(cId);

                    }
                    CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
                    List<Category> categoryList = cdao.getCategories();

                %>

                <!-- show categories -->
                <div class="col-md-2">
                    <div class="list-group mt-2">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active custom-bg">
                            All Products
                        </a>
                        <%  for (Category cList : categoryList) {
                        %>
                        <a href="index.jsp?category=<%= cList.getCategoryId()%>" class="list-group-item list-group-item-action"><%=cList.getCategoryDescription()%></a>
                        <% }
                        %>
                    </div>
                </div>
                <!-- show products -->
                <div class="col-md-10">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product product : productList) {
                                %>
                                <div class="card product-card ">
                                    <div class="container text-center mt-2">
                                        <img class="card-img-top" style="max-height: 120px; max-width: 70%; width: auto" src="images/products/<%= product.getpPhoto()%>" alt="Card image cap ">
                                    </div> 
                                    <div class="card-body" style="margin-top: -1.1rem ">
                                        <h5 class="card-title"> <%= product.getpName()%></h5>
                                        <p class="card-text text-secondary" style="margin-top: -0.5rem; font-size: 13px">
                                            <%= helper.get10Words(product.getpDescription())%>
                                        </p>
                                    </div>
                                        <div class="card-footer text-center" style="margin-top: -1rem ">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= product.getpId()%>, '<%= product.getpName()%>', '<%= product.getPriceAfterApplyingDiscount()%>')">Add to Cart</button>
                                        <button class="btn btn-outline-success ">&#8377 <%=product.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"><%= product.getpPrice() + "," + product.getpDiscount() + "% off"%></span></button>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
            <%@include file="Components/common_modals.jsp" %>
    </body>
</html>
