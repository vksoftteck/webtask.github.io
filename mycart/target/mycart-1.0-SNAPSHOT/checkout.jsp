

<%
    
      User user=(User) session.getAttribute("current-user");
      if(user==null){
          session.setAttribute("message", "You are not logged in !! Login first");
          response.sendRedirect("login.jsp");
          return;
      }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body class="back">
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row m-5">
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mb-4">Your selected items</h2>
                             <div class="cart-body">
                        
                             </div>
                            
                        </div>
                            
                        
                    </div>
                    
                </div> 
                <div class="col-md-6">
                    <!--form details-->
                     <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mb-4">Your details for order</h2>
                            <form action="#!">
                         <div class="form-group">
                     <label for="exampleInputEmail1">Email address</label>
                     <input value="<%= user.getUserEmail()%>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                     <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                     </div> 
                         <div class="form-group">
                     <label for="name">Your Name</label>
                     <input value="<%= user.getUserName()%>"  type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                     </div> 
                         <div class="form-group">
                     <label for="name">Your Phone Number</label>
                     <input value="<%= user.getUserPhone()%>"  type="text" class="form-control" id="userphone" aria-describedby="emailHelp" placeholder="Enter phone no.">
                     </div> 
                                 <div class="form-group">
                     <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                     <textarea value="<%= user.getUserAddress()%>"  class="form-control" id="exampleFormControlTextarea1" placeholder="Your address" rows="3"></textarea>
                      </div>
                                
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order now</button>  
                                    <a href="index.jsp" class="btn btn-outline-primary">Continue Shopping</a>  
                                    
                                </div>      
                                
                      </form>  
                        </div>
                            
                        
                    </div>
                    
                    
                </div> 
                
                
                
            </div>
            
            
        </div>
        
     <%@include file="components/common_modals.jsp" %>

    </body>
</html>
