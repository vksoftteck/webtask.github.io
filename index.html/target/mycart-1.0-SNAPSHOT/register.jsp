<%-- 
    Document   : register
    Created on : Oct 11, 2022, 12:55:22 PM
    Author     : ww
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body class="back">
        <%@include file="components/navbar.jsp" %>
  
        <div class="container-fluid">
            
             <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include file="components/message.jsp" %>

                    <div class="card-body px-3 ">
                        

                        <div class="container text-center">
                            <img src="img/images.png" style="max-width: 120px" class="img-fluid">       
                        </div>                        
                        
                <h3 class="text-center my-3">Sign up here !!</h3>
                
                <form action="RegisterServlet" method="post">
             <div class="form-group">
           <label for="name">User Name</label>
           <input name="user_name" type="text" class="form-control" id="name"  placeholder="Enter here" required>  
             </div>        
                    
             <div class="form-group">
           <label for="email">User Email</label>
           <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here" required>  
             </div>        
                    
             <div class="form-group">
           <label for="password">User Password</label>
           <input name="user_password" type="password" class="form-control" id="password" aria-describedby="passwordHelp" placeholder="Enter here" required>  
             </div>        
                    
             <div class="form-group">
           <label for="phone">User Phone</label>
           <input name="user_phone" type="number" class="form-control" id="phone" aria-describedby="phoneHelp" placeholder="Enter here">  
             </div>        
                    
             <div class="form-group">
           <label for="name">User Address</label>
           <textarea name="user_address" style="height: 150px" type="email" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here"></textarea>  
             </div>  
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>   
                        <button class="btn btn-outline-warning">Reset</button>   
                    </div>
                                 
                </form>
                

                        
                    </div>
                    
                </div>                
                
            </div>
        </div>
            
        </div>
    </body>
</html>
