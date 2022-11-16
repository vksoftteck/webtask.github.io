

<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entitiy.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entitiy.User"%>
<%
    
      User user=(User) session.getAttribute("current-user");
      if(user==null){
          session.setAttribute("message", "You are not logged in !! Login first");
          response.sendRedirect("login.jsp");
          return;
      }else{
          
          if(user.getUserType().equals("normal")){
              
            session.setAttribute("message", "You are not admin !! Do not access this page");
          response.sendRedirect("login.jsp");
          return;  
              
              
          }
          
      }
      


%>

               <%
              CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory() );
              List<Category> list=cDao.getCategories();
              
                 //getting count
                 Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());

              %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body class="back">
        <%@include file="components/navbar.jsp" %>
        
        <h1 class="text-center text-white my-5">ADMIN PANEL</h1>
        
        <div class="container admin back">
            
            <div class="container-fluid mt-3">
                
                <%@include file="components/message.jsp" %>
                
            </div>
            
            <div class="row mt-3">
                
                <!--first-col-->                
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                
                                <img  style="max-width: 125px" class="img-fluid rounded-circle" src="img/user.png" alt="user_icon">
                                
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                        
                        
                    </div>
                    
                    
                    
                </div>
                <!--second-col-->                
                 <div class="col-md-4 text-center">
                    <div class="card">
                        <div class="card-body">
                             <div class="container">
                                
                                 <img  style="max-width: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="user_icon">
                                
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                        
                        
                    </div>
                    
                    
                </div>
                <!--third-col-->                
                      <div class="col-md-4 text-center">
                       <div class="card">
                        <div class="card-body">
                             <div class="container">
                                
                                 <img  style="max-width: 125px" class="img-fluid rounded-circle" src="img/products.png" alt="user_icon">
                                
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                        
                        
                    </div>
                    
                    
                </div>

                
            </div>
            <!--second-row-->
            
                <div class="row mt-3">
                    <!--second:row first-col-->
                    <div class="col-md-6 text-center">
                        
                         <div class="card" data-toggle="modal" data-target="#add-categories-modal">
                        <div class="card-body">
                             <div class="container">
                                
                                 <img  style="max-width: 125px" class="img-fluid rounded-circle" src="img/image.jpg" alt="user_icon">
                                
                            </div>
                            <p class="mb-2">Click here to add new categories</p>
                            <h1 class="text-uppercase text-muted">add categories</h1>
                        </div>
                        
                        
                    </div> 
                    
                        
                    </div>
                      <!--second:row second-col-->

                     <div class="col-md-6 text-center">
                        
                          <div class="card" data-toggle="modal" data-target="#add-products-modal">
                        <div class="card-body">
                             <div class="container">
                                
                                 <img  style="max-width: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon">
                                 <a href="img/index.jsp"></a>
                                
                            </div>
                              <p class="mb-2">Click here to add new categories</p>
                            <h1 class="text-uppercase text-muted"> add Products</h1>
                        </div>
                        
                        
                    </div>
                    
                         
                    </div>
                    
                </div>
                
            </div>
            
            
        </div>
        <!--add category modal--> 
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-categories-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
              
              <input type="hidden" name="operation" value="addcategory">
              
              <div class="form-group">
                  
                  <input type="text" class="form-control"  name="catTitle" placeholder="Enter category title" required />
              </div>
              <div class="form-group">
                  <textarea style="height: 300px;" class="form-control" placeholder="Enter Category description" name="catDescription" required></textarea>
                  
              </div>
              <div class="container text-center">
                  
                  <button class="btn btn-outline-success">Add Category</button> 
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              </div>
              
              
          </form>
          
          
          
      </div>
          </div>
  </div>
</div>
        
        
        <!--End of category modal--> 
        
        
        <!--add Product modal--> 
        
        
<!-- Modal -->
<div class="modal fade" id="add-products-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Fill Products Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="operation" value="addproduct">
              
              <div class="form-group">
                  
                  <input type="text" class="form-control"  name="pName" placeholder="Enter Product Name" required />
              </div>
              <div class="form-group">
                  <textarea style="height: 300px;" class="form-control" placeholder="Enter Products description" name="pDesc" required></textarea>
                  
              </div>
              
              <div class="form-group">
                  
                  <input type="number" class="form-control"  name="pPrice" placeholder="Enter Product pPrice" required />
              </div>
              <div class="form-group">
                  
                  <input type="number" class="form-control"  name="pDiscount" placeholder="Enter Product pDiscount" required />
              </div>
              <div class="form-group">
                  
                  <input type="number" class="form-control"  name="pQuantity" placeholder="Enter Product pQuantity" required />
              </div>
             
              
              <div class="form-group">
                
                  <select name="catId" id="" class="form-control">
                      
                      <%
                      for(Category c:list){
                      
                      %>
                      
                      <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                      <% }%>
                                            
                  </select>
              </div>
              
              <div class="form-group">
                  
                  <label for="pPic" >Select of Picture Product</label>
                  <br>
                  <input type="file" id="pPic" name="pPic" required />
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
        
        
        
        <!--End of Product modal--> 
             <%@include file="components/common_modals.jsp" %>

                
    </body>
</html>
