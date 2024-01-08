<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="includes/head.jsp" %> 
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header text-center">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Login Page</h4>
                        </div>
                        
                        <!-- Code below will show message when user has not logged in successfully-->
                        <!-- Getting attribute (login-failed message) from the loginServlet. Attribute was set in loginServlet -->
                        <%
                            String InvalidMsg = (String)session.getAttribute("login-failed");
                            
                            if(InvalidMsg != null) 
                            {%>    
                                <div class="alert alert-danger" role="alert"><%= InvalidMsg %></div>
                            <%     
                                session.removeAttribute("login-failed");
                            }
                        %>                          
                        
                        <!-- If you try to access booking page without logging in, then will be sent to login page and a message will show "Please Login" (above the Login form) [Look at book.jsp]-->
                        <!-- Getting attribute (Login-error message) from the book.jsp. Attribute was set in book.jsp -->
                        <%
                            String withoutLogin = (String)session.getAttribute("Login-error");
                            if(withoutLogin != null)
                            {%>
                                <div class="alert alert-danger" role="alert"><%= withoutLogin %></div>
                            <%
                                session.removeAttribute("Login-error");
                            }
                        %>    
                        
                        <!-- Once you click Logout (on navbar) within the application, then message will show on Loginpage (above login form) that "You have Successfully Logged Out". Then will be redirected to login page(login.jsp) -->
                        <!-- Getting attribute (logout message) from the logout Servlet. Attribute was set in logoutServlet -->
                        <%
                            String LogoutMsg = (String)session.getAttribute("logoutMsg");
                            if(LogoutMsg != null)
                            {%>
                                <div class="alert alert-success" role="alert"><%= LogoutMsg %></div>
                            <%
                                session.removeAttribute("logoutMsg");
                            }
                        %> 
                        
                        <div class="card-body">
                            <form action="loginServlet" method="post"> <!-- The action is the name of the url pattern from LoginServlet-->
                                
                                <div class="form-group">
                                    <label>Enter Email</label>
                                    <input type="email" class="form-control" name="email" placeholder="....@gmail.com" required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Enter Password</label>
                                    <input type="password" class="form-control" name="password" placeholder="********" required='required'>
                                </div>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                                
                            </form>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
               
    </body>
</html>
