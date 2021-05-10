<%-- 
    Document   : admin
    Created on : 3 May, 2021, 7:37:12 PM
    Author     : Aditi
--%>
<%@page import="java.util.Map"%>
<%@page import="com.mycompany.mavenproject1.helper.helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.mavenproject1.entities.Category"%>
<%@page import="com.mycompany.mavenproject1.helper.factoryProvider"%>
<%@page import="com.mycompany.mavenproject1.dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.mavenproject1.entities.User"%>
<%
    User user= (User)session.getAttribute("current-user");
    if(user==null){
        session.setAttribute("message", "You are not logged in !! Login First");
        response.sendRedirect("login.jsp");
    }
    else{
        if( user.getUserType().equals("normal")){
        session.setAttribute("message", "You are not Admin");
        response.sendRedirect("login.jsp");
        }
    }
    %>
    
<%
    CategoryDao cdao = new CategoryDao(factoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
//getting user and product count
    Map<String,Long> map=helper.getCount(factoryProvider.getFactory());

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="Components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <br>
        <!-- container is class of bootstrap -->
        <div class="container admin">
            <%@include file="Components/message.jsp" %>
            <!-- row gets 12 grids every tym-->
            <div class="row mt-5"> <!-- mt is margin from top-->
        <div class="col-md-4">  <!-- as we need three colums in first row and each column we gave 4 (md-4)grids-->
                    <div class="card">            <!-- (First Box) whenever we need box we use card  -->
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 50px;" class="img-fluid rounded-circle" src="images/groupUsers.png" alt="users_icon">   
                            </div>
                            <h1><%=map.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"> 
                    <div class="card">            <!-- 2nd Box-->
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 50px; max-height: 50px;" class="img-fluid rounded-circle" src="images/list.png" alt="users_icon">   
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"> 
                    <div class="card">            <!-- 3rd Box -->
                         <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 50px;" class="img-fluid rounded-circle" src="images/products.png" alt="users_icon">   
                            </div>
                             <h1><%=map.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 2nd row-->
            <div class="row mt-5">
                <div class="col-md-6"> <!--md means mobile device (not fully cleared yet -->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">            <!-- 1st Box-->
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 50px;" class="img-fluid rounded-circle" src="images/plus.png" alt="users_icon">   
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">             <!-- 2nd Box-->
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 50px;" class="img-fluid rounded-circle" src="images/add.png" alt="users_icon">   
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                </div>
                
            </div>


        </div>
<!-- add category modal -->

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <form action="ProductOperationServlet" method="post">
                    <input type="hidden" name="operation" value="addCategory"/>
                    <div class="form-group">         <!-- In bootstrap any field in form is kept in form group-->
                        <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />
                        
                    </div>
                      <div class="form-group">        
                          <textarea class="form-control" style="height:150px" name="catDescription" placeholder="Enter Category Description" required></textarea>
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add category</button>
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Category Modal-->


<!-- add Product modal -->

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post" enctype="multiPart/form-data"> <!--multiPart/form-data means image,audio etc -->
                    <input type="hidden" name="operation" value="addProduct"/>
                    <div class="form-group">         <!-- In bootstrap any field in form is kept in class form group & form control-->
                        <input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required />
                    </div>
                      <div class="form-group">        
                          <textarea class="form-control" style="height:80px" name="pDescription" placeholder="Enter Product Description" required></textarea>
                    </div>
                    <div class="form-group">        
                        <input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required />
                    </div>
                    <div class="form-group">         
                        <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required />
                    </div>
                    <div class="form-group">        
                        <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required />
                    </div>
                    
                    <div class="form-group">   
                        <select name="catId" class="form-control" >
                            <%
                                for(Category c:list){
                                %>
                                <option value="<%=c.getCategoryId()%>"> <%=c.getCategoryTitle()%> </option>
                                
                                <%
                                    }
                                %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="pPic">Select Picture of Product</label>
                        <br>
                        <input type="file" id="pPic" name="pPic" required/>
                            </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add Product</button>
                           <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>




<!-- End Product Modal-->
        
        <%@include file="Components/common_modals.jsp" %>
        
    </body>
</html>
